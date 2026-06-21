;;; -*- coding: utf-8 -*-
;;; ots-neotree.el

(defvar ots-neotree-binary-extensions
  '("7z"
    "a"
    "avi"
    "bin"
    "class"
    "dat"
    "db"
    "dll"
    "doc"
    "docx"
    "dylib"
    "eot"
    "exe"
    "flac"
    "gif"
    "ico"
    "jpeg"
    "jpg"
    "mkv"
    "mov"
    "mp3"
    "mp4"
    "o"
    "ogg"
    "otf"
    "pdf"
    "png"
    "ppt"
    "pptx"
    "rar"
    "so"
    "sqlite"
    "tar"
    "tgz"
    "ttf"
    "wav"
    "webm"
    "webp"
    "woff"
    "woff2"
    "xls"
    "xlsx"
    "xz"
    "zip")
  "File extensions shown with the binary icon in neotree.")

(defun ots-neotree-binary-file-p (file)
  "Return non-nil if FILE has a binary extension."
  (member (downcase (or (file-name-extension file) ""))
          ots-neotree-binary-extensions))

;; Override to render only three distinct icons.
;; This also works around slow rendering of some particular icons.
(with-eval-after-load 'all-the-icons
  (defun all-the-icons-icon-for-dir (dir &rest _)
    (all-the-icons-octicon "file-directory" :height 1.0 :v-adjust -0.1))
  (defun all-the-icons-icon-for-file (file &rest _)
    (if (ots-neotree-binary-file-p file)
        (all-the-icons-faicon "file-o" :height 1.0 :v-adjust 0.0)
      (all-the-icons-faicon "file-text-o" :height 1.0 :v-adjust 0.0))))

(defun ots-neotree-set-properties ()
  "Set properties for neotree buffers."
  (local-set-key (kbd "<f4>") 'neotree-change-root)
  (local-set-key (kbd "<f5>") 'neotree-refresh))

(defun ots-neotree-toggle ()
  "Open neotree at the current file or directory."
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
          (setq buffer-face-mode-face `(:background "#f2ede0")))
        (buffer-face-mode 1)
        (switch-to-buffer buffer)))))

(use-package neotree
  :defer t
  :config
  (require 'all-the-icons)
  (add-hook 'neotree-mode-hook 'ots-neotree-set-properties t)
  (setq neo-autorefresh nil)
  (setq neo-hidden-regexp-list '("#$"
                                 "\\.elc$"
                                 "\\.pyc$"
                                 "^\\.cache$"
                                 "^\\.git$"
                                 "^\\.pytest_cache$"
                                 "^\\.venv$"
                                 "^__pycache__$"
                                 "^node_modules$"
                                 "^venv$"
                                 "~$"))

  (setq neo-show-slash-for-folder nil)
  (setq neo-smart-open t)
  (setq neo-theme 'icons)
  (setq neo-window-width 64))

(provide 'ots-neotree)
;;; ots-neotree.el ends here
