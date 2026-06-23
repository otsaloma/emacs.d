;;; -*- coding: utf-8 -*-
;;; ots-corfu.el

(defun ots-corfu-set-eglot-capf ()
  "Set completion sources for eglot-managed buffers."
  (setq-local completion-at-point-functions
              (list (cape-capf-properties
                     (cape-capf-super #'eglot-completion-at-point
                                      #'cape-keyword
                                      #'cape-dabbrev)
                     ;; Drop annotations like "Dabbrev".
                     :annotation-function #'ignore))))

(defun ots-corfu-set-prog-capf ()
  "Merge cape keyword and dabbrev fallbacks with the buffer's native capfs."
  (setq-local completion-at-point-functions
              (list (cape-capf-properties
                     (apply #'cape-capf-super
                            (append (delq t (copy-sequence completion-at-point-functions))
                                    (list #'cape-keyword #'cape-dabbrev)))
                     ;; Drop annotations like "Dabbrev".
                     :annotation-function #'ignore))))

(use-package corfu
  :config
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.1)
  (setq corfu-auto-prefix 3)
  (setq corfu-cycle t)
  (setq corfu-popupinfo-delay '(2 . 0.5))
  (setq corfu-preselect 'first)
  (setq corfu-preview-current t)
  (setq corfu-quit-at-boundary t)
  (setq corfu-quit-no-match t)
  ;; TAB accepts the selection, RET inserts a newline.
  (keymap-set corfu-map "<tab>" 'corfu-insert)
  (keymap-unset corfu-map "RET" t)
  (corfu-popupinfo-mode)
  (global-corfu-mode))

(use-package cape
  :config
  (setq cape-dabbrev-min-length 2))

(use-package dabbrev
  :config
  (setq dabbrev-case-fold-search nil)
  (setq dabbrev-case-replace nil))

(provide 'ots-corfu)
;;; ots-corfu.el ends here
