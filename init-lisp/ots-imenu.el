;;; -*- coding: utf-8 -*-
;;; ots-imenu.el

(require 'ots-helm)

(defun ots-imenu-add-maybe ()
  "Add imenu index if the mode supports it."
  (condition-case nil (imenu-add-to-menubar "Index") (error nil)))

(add-hook 'font-lock-mode-hook 'ots-imenu-add-maybe t)
(global-set-key (kbd "<f4>") 'helm-imenu)

(provide 'ots-imenu)
;;; ots-imenu.el ends here
