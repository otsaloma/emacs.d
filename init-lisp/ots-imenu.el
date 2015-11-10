;;; -*- coding: utf-8 -*-
;;; ots-imenu.el

(require 'ots-helm)

(defun ots-imenu-add-maybe ()
  "Add imenu index if the mode supports it."
  (condition-case nil (imenu-add-to-menubar "Index") (error nil)))

(add-hook 'font-lock-mode-hook 'ots-imenu-add-maybe)
(global-set-key (kbd "<f4>") 'helm-imenu)
(global-set-key (kbd "<S-f4>") 'helm-imenu-in-all-buffers)

(provide 'ots-imenu)
;;; ots-imenu.el ends here
