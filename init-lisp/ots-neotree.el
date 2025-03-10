;;; -*- coding: utf-8 -*-
;;; ots-neotree.el

(defun ots-neotree-set-properties ()
  "Set properties for neotree buffers."
  (local-set-key (kbd "<f4>") 'neotree-change-root)
  (local-set-key (kbd "<f5>") 'neotree-refresh))

(defun ots-neotree-toggle ()
  "Open neotree in projectile root or current directory."
  (interactive)
  (require 'neotree)
  (let ((buffer (current-buffer))
        (file-name (buffer-file-name)))
    (if (neo-global--window-exists-p)
        (neotree-hide)
      (progn
        (neotree-show)
        (neotree-find file-name)
        (if (string= ots-theme-current "dark")
            (setq buffer-face-mode-face `(:background "#313131"))
          (setq buffer-face-mode-face `(:background "#eeeeee")))
        (buffer-face-mode 1)
        (switch-to-buffer buffer)))))

(use-package neotree
  :defer t
  :config
  (require 'all-the-icons)
  (add-hook 'neotree-mode-hook 'ots-neotree-set-properties t)
  (setq neo-autorefresh nil)
  (setq neo-hidden-regexp-list '("^\\.cache$"
                                 "^\\.git$"
                                 "^\\.pytest_cache$"
                                 "^\\.venv$"
                                 "^__pycache__$"
                                 "^node_modules$"
                                 "^venv$"
                                 "~$"
                                 "\\.*#$"
                                 "\\.elc$"
                                 "\\.pyc$"
                                 "\\.rdata$"
                                 "\\.rds$"))

  (setq neo-show-slash-for-folder nil)
  (setq neo-smart-open t)
  (setq neo-theme 'icons)
  (setq neo-window-width 64))

(provide 'ots-neotree)
;;; ots-neotree.el ends here
