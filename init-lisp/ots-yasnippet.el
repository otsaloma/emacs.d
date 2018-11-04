;;; -*- coding: utf-8 -*-
;;; ots-yasnippet.el

(require 'yasnippet)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-+") 'yas-expand)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(setq yas-trigger-symbol "+")

(yas-global-mode 1)

;; Allow snippets in comments too (e.g. coding magic line).
(add-hook 'after-change-major-mode-hook '(lambda () (setq yas-buffer-local-condition t)))

(provide 'ots-yasnippet)
;;; ots-yasnippet.el ends here
