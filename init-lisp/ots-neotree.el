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
(global-set-key (kbd "<f11>") 'ots-neotree-toggle)

(setq neo-hidden-regexp-list '("\\.elc$"
                               "\\.pyc$"
                               "\\.rdata$"
                               "\\.rds$"
                               "^#.*#$"
                               "^\\.git$"
                               "^\\.cache$"
                               "^\\.pytest_cache$"
                               "^__pycache__$"
                               "^node_modules$"
                               "~$"))

(setq neo-smart-open t)
(setq neo-theme 'icons)
(setq neo-window-width 50)

(require 'all-the-icons)
(add-to-list 'all-the-icons-dir-icon-alist '("test" all-the-icons-octicon "file-directory" :height 1.0 :v-adjust -0.1))
(add-to-list 'all-the-icons-icon-alist '("\\.dockerignore$" all-the-icons-fileicon "dockerfile" :face all-the-icons-dblue))
(add-to-list 'all-the-icons-icon-alist '("\\.rs$" all-the-icons-alltheicon "rust" :height 1.0 :face all-the-icons-maroon))

(provide 'ots-neotree)
;;; ots-neotree.el ends here
