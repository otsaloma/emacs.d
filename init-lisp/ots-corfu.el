;;; -*- coding: utf-8 -*-
;;; ots-corfu.el

(defun ots-corfu-set-eglot-capf ()
  "Set completion sources for eglot-managed buffers."
  (setq-local completion-at-point-functions
              ;; Keep cape-file separate, merging it with cape-capf-super
              ;; would lose completion boundaries and thus complete
              ;; relative file names without their directory part.
              (list #'cape-file
                    (cape-capf-properties
                     (cape-capf-super #'eglot-completion-at-point
                                      #'cape-keyword
                                      #'cape-dabbrev)
                     ;; Drop annotations like "Dabbrev".
                     :annotation-function #'ignore))))

(defun ots-corfu-set-prog-capf ()
  "Merge cape keyword and dabbrev fallbacks with the buffer's native capfs."
  (let ((capfs (delq t (delq #'cape-file
                             (copy-sequence completion-at-point-functions)))))
    (setq-local completion-at-point-functions
                ;; Keep cape-file separate, merging it with cape-capf-super
                ;; would lose completion boundaries and thus complete
                ;; relative file names without their directory part.
                (list #'cape-file
                      (cape-capf-properties
                       (apply #'cape-capf-super
                              (append capfs (list #'cape-keyword #'cape-dabbrev)))
                       ;; Drop annotations like "Dabbrev".
                       :annotation-function #'ignore)))))

(use-package corfu
  :config
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.1)
  (setq corfu-auto-prefix 3)
  (setq corfu-cycle t)
  (setq corfu-on-exact-match 'quit)
  (setq corfu-popupinfo-delay '(2 . 0.5))
  (setq corfu-preselect 'first)
  (setq corfu-preview-current t)
  (setq corfu-quit-at-boundary t)
  (setq corfu-quit-no-match t)
  ;; TAB accepts the selection, RET inserts a newline.
  (keymap-set corfu-map "<escape>" 'corfu-quit)
  (keymap-set corfu-map "<tab>" 'corfu-insert)
  (keymap-unset corfu-map "RET" t)
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  (global-corfu-mode))

(use-package cape
  :config
  (setq cape-dabbrev-min-length 2)
  (add-hook 'completion-at-point-functions #'cape-file))

(use-package dabbrev
  :config
  (setq dabbrev-case-fold-search nil)
  (setq dabbrev-case-replace nil))

(provide 'ots-corfu)
;;; ots-corfu.el ends here
