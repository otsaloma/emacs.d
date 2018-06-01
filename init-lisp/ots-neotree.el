;;; -*- coding: utf-8 -*-
;;; ots-neotree.el

(defun ots-neotree-mode-set-properties ()
  "Set properties for neotree buffers."
  (local-set-key (kbd "<f4>") 'neotree-change-root)
  (local-set-key (kbd "<f5>") 'neotree-refresh))

(defun ots-neotree-toggle ()
  "Open neotree in projectile root or current directory."
  ;; https://github.com/jaypei/emacs-neotree/issues/149
  ;; https://github.com/jaypei/emacs-neotree/pull/263
  (interactive)
  (require 'all-the-icons)
  (require 'neotree)
  (let ((file-name (buffer-file-name)))
    (if (neo-global--window-exists-p)
        (neotree-hide)
      (progn
        (neotree-show)
        (when (and (fboundp 'projectile-project-p)
                   (projectile-project-p)
                   (fboundp 'projectile-project-root))
          (neotree-dir (projectile-project-root)))
        (neotree-find file-name)))))

(add-hook 'neotree-mode-hook 'ots-neotree-mode-set-properties t)
(global-set-key (kbd "<f10>") 'ots-neotree-toggle)
(global-set-key (kbd "<S-f10>") 'neotree-find)

(setq neo-smart-open t)
(setq neo-theme 'icons)
(setq neo-window-width 50)

(setq neo-hidden-regexp-list '("\\.elc$"
                               "\\.pyc$"
                               "^#.*#$"
                               "^\\.git$"
                               "^\\.cache$"
                               "^__pycache__$"
                               "^node_modules$"
                               "~$"))

(provide 'ots-neotree)
;;; ots-neotree.el ends here
