;;; -*- coding: utf-8 -*-
;;; ots-ess-mode.el

(defvar ots-ess-mode-faces-toggled nil)

(defun ots-ess-mode-eval-region ()
  "Send the current region to R."
  (interactive)
  (if (not ess-local-process-name)
      (ess-switch-process))
  (if (use-region-p)
      (ess-eval-region-and-go (region-beginning) (region-end) nil)
    (ess-eval-region-and-go (line-beginning-position) (line-end-position) nil)))

(defun ots-ess-mode-insert-pipe ()
  "Insert the magrittr pipe operator at point."
  (interactive)
  (if (not (looking-back " "))
      (insert " "))
  (insert "%>% "))

(defun ots-ess-mode-set-faces ()
  "Set faces for editing R files."
  (unless ots-ess-mode-faces-toggled
    ;; Enable some font-lock stuff that's off by default.
    ;; Full list is in ess-R-font-lock-keywords.
    (ess-font-lock-toggle-keyword 'ess-fl-keyword:numbers)
    (ess-font-lock-toggle-keyword 'ess-fl-keyword:operators)
    (ess-font-lock-toggle-keyword 'ess-R-fl-keyword:F&T)
    (setq ots-ess-mode-faces-toggled t))
  (font-lock-add-keywords
   nil '(("\\<\\(args\\|browser\\|function\\|gc\\|invisible\\|library\\|messagef?0?\\|options\\|print\\|require\\|rm\\|stop\\|stopif\\|stopifnot\\|system\\|try\\|tryCatch\\|UseMethod\\|warning\\|with\\)("
          1 font-lock-keyword-face)
         ("\\<\\(Recall\\|return\\)("
          1 font-lock-function-name-face)
         ("^ *\\([a-zA-Z0-9._]+\\) *\\(=\\|<<?-\\) *\\(function\\|local\\)\\>"
          1 font-lock-function-name-face)
         ("\\(\\.\\.\\.\\|\\$\\|@\\)"
          1 font-lock-keyword-face)
         ("[^= ]\\(=\\)[^= ]"
          1 font-lock-keyword-face))))

(defun ots-ess-mode-set-indentation ()
  "Set indentation properties for editing R files."
  (setq-local ess-align-blocks '())
  (setq-local ess-default-style 'DEFAULT)
  (setq-local ess-indent-from-lhs '())
  (setq-local ess-indent-offset 4)
  (setq-local ess-indent-with-fancy-comments nil)
  (setq-local ess-offset-arguments-newline 'prev-line))

(defun ots-ess-mode-set-keys ()
  "Set keybindings for editing R files."
  (local-set-key (kbd "C-m") 'ots-util-pop-mark)
  (local-set-key (kbd "C-+") 'yas-expand)
  (local-set-key (kbd "C-ö") 'ots-ess-mode-insert-pipe)
  (local-set-key (kbd "_") '(lambda () (interactive) (insert "_")))
  (local-set-key (kbd "<delete>") 'delete-char)
  (local-set-key (kbd "<f2>") 'ess-display-help-on-object)
  (local-set-key (kbd "<f5>") 'ots-ess-mode-source)
  (ots-util-bind-key-compile (kbd "<S-f5>") "rscript %s")
  (local-set-key (kbd "<f6>") 'ots-ess-mode-eval-region)
  (ots-util-bind-key-compile (kbd "<f8>") "r --vanilla -e 'invisible(parse(\"%s\"))'"))

(defun ots-ess-mode-set-properties ()
  "Set properties for editing R files."
  (modify-syntax-entry ?. "w")
  (setq-local comment-add 0)
  (setq-local company-backends
   '((company-R-objects company-R-args company-keywords company-dabbrev)
     (company-dabbrev))))

(defun ots-ess-mode-setwd ()
  "setwd to the directory of the current buffer in R."
  (interactive)
  (ess-change-directory
   (file-name-directory
    (buffer-file-name))))

(defun ots-ess-mode-start ()
  "Start or associate a process for the buffer."
  (interactive)
  (when (buffer-file-name)
    (setq inferior-R-args "--no-save --no-restore-history --quiet")
    (let ((new-process (not ess-process-name-list)))
      (ess-force-buffer-current nil t nil nil)
      (if new-process (delete-other-windows)))
    (ess-tracebug -1)))

(defun ots-ess-mode-source ()
  "Source the current buffer in R."
  (interactive)
  (if (not ess-local-process-name)
      (ess-switch-process))
  (ots-ess-mode-setwd)
  (sleep-for 1)
  (let ((file-name
         (file-name-nondirectory
          (buffer-file-name))))
    (ess-switch-to-end-of-ESS)
    (ots-util-comint-send "source(\"%s\")" file-name)))

(autoload 'R-mode "ess-site.el" "ESS" t)
(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))

(add-hook 'ess-mode-hook 'ots-ess-mode-set-faces t)
(add-hook 'ess-mode-hook 'ots-ess-mode-set-indentation t)
(add-hook 'ess-mode-hook 'ots-ess-mode-set-keys t)
(add-hook 'ess-mode-hook 'ots-ess-mode-set-properties t)
(add-hook 'ess-mode-hook 'ots-ess-mode-start t)

(setq ess-ask-for-ess-directory nil)
(setq ess-gen-proc-buffer-name-function
 'ess-gen-proc-buffer-name:simple)
(setq ess-history-directory "~")
(setq
 ;; This gets fed to imenu-generic-expression.
 ;; The default in ESS insists on arrows.
 ess-imenu-S-generic-expression
 '((nil "^\\([a-zA-Z0-9._]+\\) = function(" 1)
   (nil "^\\([a-zA-Z0-9._]+\\) <- function(" 1)))
(setq ess-R-argument-suffix "=")
(setq ess-roxy-str "#'")
(setq ess-use-company t)
(setq inferior-ess-r-help-command
 ".ess.help(\"%s\", help.type=\"html\")\n")

(provide 'ots-ess-mode)
;;; ots-ess-mode.el ends here
