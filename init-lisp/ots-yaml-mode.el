;;; -*- coding: utf-8 -*-
;;; ots-yaml-mode.el

(autoload 'ots-yaml-mode "yaml" "Edit YAML files." t)
(let ((modes '(("\\.yml$" . ots-yaml-mode))))
  (setq auto-mode-alist (append modes auto-mode-alist)))

(define-derived-mode ots-yaml-mode prog-mode "YAML"
  "Mode for editing YAML files."
  (setq major-mode 'ots-yaml-mode mode-name "YAML")
  (run-hooks 'ots-yaml-mode-hook))

(defun ots-yaml-mode-set-faces ()
  "Set faces for editing YAML files."
  (font-lock-add-keywords
   nil '(("\\(#.*$\\)" 1 font-lock-comment-face)
         ("^\\([a-z_]+:\\)" 1 font-lock-function-name-face))))

(defun ots-yaml-mode-set-properties ()
  "Set properties for editing YAML files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (setq fill-column 72)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'ots-yaml-mode-hook 'ots-yaml-mode-set-faces)
(add-hook 'ots-yaml-mode-hook 'ots-yaml-mode-set-properties)

(provide 'ots-yaml-mode)
;;; ots-yaml-mode.el ends here
