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
  (require 'doom-themes)
  (require 'neotree)
  (let ((file-name (buffer-file-name)))
    (if (neo-global--window-exists-p)
        (neotree-hide)
      (progn
        (neotree-show)
        (when (and (fboundp 'projectile-project-p)
                   (projectile-project-p)
                   (fboundp 'projectile-project-root))
          (setq doom-neotree-project-size 1.05)
          (doom-themes-neotree-config)
          (advice-remove #'neo-buffer--insert-root-entry #'doom-neotree-insert-root)
          (copy-face 'neo-file-link-face 'doom-neotree-hidden-file-face)
          (neotree-dir (projectile-project-root)))
        (neotree-find file-name)))))

(add-hook 'neotree-mode-hook 'ots-neotree-mode-set-properties t)
(global-set-key (kbd "<f11>") 'ots-neotree-toggle)

(setq neo-show-slash-for-folder nil)
(setq neo-smart-open t)
(setq neo-theme 'icons)
(setq neo-window-width 50)

(setq neo-hidden-regexp-list '("^\\.cache$"
                               "^\\.git$"
                               "^\\.pytest_cache$"
                               "^__pycache__$"
                               "^node_modules$"
                               "~$"
                               "\\.*#$"
                               "\\.elc$"
                               "\\.pyc$"
                               "\\.rdata$"
                               "\\.rds$"))

(provide 'ots-neotree)
;;; ots-neotree.el ends here
