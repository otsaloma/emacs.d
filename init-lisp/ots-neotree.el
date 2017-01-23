;;; -*- coding: utf-8 -*-
;;; ots-neotree.el

(require 'all-the-icons)
(require 'neotree)

(defun ots-neotree-mode-set-properties ()
  "Set properties for neotree buffers."
  (local-set-key (kbd "<f4>") 'neotree-change-root)
  (local-set-key (kbd "<f5>") 'neotree-refresh))

(add-hook 'neotree-mode-hook 'ots-neotree-mode-set-properties t)
(global-set-key (kbd "<f10>") 'neotree-toggle)
(global-set-key (kbd "<S-f10>") 'neotree-find)

(setq neo-hidden-regexp-list
      '("\\.elc$"
        "\\.min.css$"
        "\\.min.js$"
        "\\.pyc$"
        "^#.*#$"
        "^.cache$"
        "^\\.git$"
        "^\\.tern-port$"
        "^__pycache__$"
        "^node_modules$"
        "~$"))

(setq neo-smart-open t)
(setq neo-theme 'icons)
(setq neo-window-width 50)

(provide 'ots-neotree)
;;; ots-neotree.el ends here
