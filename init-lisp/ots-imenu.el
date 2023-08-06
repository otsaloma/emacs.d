;;; -*- coding: utf-8 -*-
;;; ots-imenu.el

(defun ots-imenu-add-maybe ()
  "Add imenu index if the mode supports it."
  (ignore-errors (imenu-add-to-menubar "Index")))

(use-package imenu)
(use-package helm
  :config
  (add-hook 'font-lock-mode-hook 'ots-imenu-add-maybe t)
  (global-set-key (kbd "<f4>") 'helm-imenu))

(provide 'ots-imenu)
;;; ots-imenu.el ends here
