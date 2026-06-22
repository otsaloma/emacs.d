;;; -*- coding: utf-8 -*-
;;; ots-corfu.el

(defun ots-corfu-set-eglot-capf ()
  "Set completion sources for eglot-managed buffers."
  (setq-local completion-at-point-functions
              (list (cape-capf-super #'eglot-completion-at-point
                                     #'cape-keyword
                                     #'cape-dabbrev))))

(defun ots-corfu-set-prog-capf ()
  "Merge cape keyword and dabbrev fallbacks with the buffer's native capfs."
  (setq-local completion-at-point-functions
              (list (apply #'cape-capf-super
                           (append (delq t (copy-sequence completion-at-point-functions))
                                   (list #'cape-keyword #'cape-dabbrev))))))

(use-package corfu
  :config
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.1)
  (setq corfu-auto-prefix 3)
  (setq corfu-cycle t)
  (setq corfu-preselect 'first)
  (setq corfu-preview-current t)
  (setq corfu-quit-at-boundary t)
  (setq corfu-quit-no-match t)
  ;; TAB accepts the selection, RET inserts a newline. Corfu binds neither
  ;; the arrow keys nor C-s, so those just do what they should.
  (keymap-set corfu-map "<tab>" 'corfu-insert)
  (keymap-unset corfu-map "RET" t)
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
