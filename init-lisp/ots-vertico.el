;;; -*- coding: utf-8 -*-
;;; ots-vertico.el

;; Related Emacs minibuffer config
;; (Although note, we're using vertico-buffer-mode below.)
;; https://github.com/minad/vertico?tab=readme-ov-file#configuration
(use-package emacs
  :custom
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt))
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package vertico
  :init
  (vertico-mode)
  (vertico-buffer-mode)
  :config
  (setq vertico-buffer-display-action '(display-buffer-at-bottom (window-height . ,(+ 3 vertico-count))))
  (setq vertico-count 20)
  (setq vertico-group-format nil)
  (setq vertico-preselect 'prompt)
  (setq vertico-resize nil))

(use-package consult)

(use-package orderless
  :custom
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-styles '(orderless basic)))

;; TODO: Anything useful here?
;; (use-package marginalia :init (marginalia-mode))

(provide 'ots-vertico)
;;; ots-vertico.el ends here
