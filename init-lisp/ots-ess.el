;;; -*- coding: utf-8 -*-
;;; ots-ess.el

(defvar ots-ess-faces-toggled nil)

(defun ots-ess-insert-pipe ()
  "Insert the magrittr pipe operator at point."
  (interactive)
  (if (not (looking-back " "))
      (insert " "))
  (insert "|> "))

(defun ots-ess-set-faces ()
  "Set faces for editing R files."
  (unless ots-ess-faces-toggled
    ;; Enable some font-lock stuff that's off by default.
    ;; Full list is in ess-R-font-lock-keywords.
    (ess-font-lock-toggle-keyword 'ess-fl-keyword:operators)
    (ess-font-lock-toggle-keyword 'ess-R-fl-keyword:F&T)
    (setq ots-ess-faces-toggled t))
  (font-lock-add-keywords
   nil '(("\\<\\(args\\|browser\\|function\\|gc\\|invisible\\|messagef?0?\\|options\\|print\\|require\\|rm\\|stop\\|stopif\\|stopifnot\\|system\\|try\\|tryCatch\\|UseMethod\\|warning\\|with\\)("
          1 font-lock-keyword-face)
         ("\\<\\(Recall\\|return\\)("
          1 font-lock-function-name-face)
         ("^ *\\([a-zA-Z0-9._]+\\) *\\(=\\|<<?-\\) *\\(function\\|local\\)\\>"
          1 font-lock-function-name-face)
         ("\\(\\.\\.\\.\\|\\$\\|@\\)"
          1 font-lock-keyword-face)
         ("[^= ]\\(=\\)[^= ]"
          1 font-lock-keyword-face))))

(defun ots-ess-set-keys ()
  "Set keybindings for editing R files."
  (local-set-key (kbd "C-m") 'ots-util-pop-mark)
  (local-set-key (kbd "C-+") 'yas-expand)
  (local-set-key (kbd "C-ö") 'ots-ess-insert-pipe)
  (local-set-key (kbd "_") '(lambda () (interactive) (insert "_")))
  (local-set-key (kbd "<delete>") 'delete-char)
  (local-set-key (kbd "<f2>") 'ess-display-help-on-object)
  (local-set-key (kbd "<f5>") 'ots-ess-source)
  (local-set-key (kbd "<S-f5>") 'ots-ess-setwd)
  (local-set-key (kbd "<f6>") 'ess-eval-region-or-line-visibly-and-step)
  (ots-util-bind-key-compile (kbd "<f8>") "r --vanilla -e 'invisible(parse(\"%s\"))'")
  (local-set-key (kbd "<M-left>") 'xref-pop-marker-stack)
  (local-set-key (kbd "<M-right>") 'xref-find-definitions))

(defun ots-ess-set-properties ()
  "Set properties for editing R files."
  (modify-syntax-entry ?. "w")
  (setq-local comment-add 0)
  (setq-local company-backends '((company-R-objects
                                  company-R-args
                                  company-keywords
                                  company-dict
                                  company-dabbrev-code
                                  company-dabbrev))))

(defun ots-ess-setwd ()
  "Change to the directory of the current buffer in R."
  (interactive)
  (ess-change-directory
   (file-name-directory
    (buffer-file-name))))

(defun ots-ess-start ()
  "Start or associate a process for the buffer."
  (interactive)
  (when (buffer-file-name)
    (setq inferior-R-args "--no-save --no-restore-history --quiet")
    (let ((new-process (not ess-process-name-list)))
      (ess-force-buffer-current nil t nil nil)
      (if new-process (delete-other-windows)))))

(defun ots-ess-source ()
  "Source the current buffer in R."
  (interactive)
  (if (not ess-local-process-name)
      (ess-switch-process))
  (ots-ess-setwd)
  (sleep-for 1)
  (let ((file-name
         (file-name-nondirectory
          (buffer-file-name))))
    (ess-switch-to-end-of-ESS)
    (ots-util-comint-send "source(\"%s\")" file-name)))

(autoload 'R-mode "ess-r-mode.el" "ESS" t)
(add-to-list 'auto-mode-alist '("\\.[Rr]\\'" . R-mode))

(add-hook 'ess-mode-hook 'ots-ess-set-faces t)
(add-hook 'ess-mode-hook 'ots-ess-set-keys t)
(add-hook 'ess-mode-hook 'ots-ess-set-properties t)
(add-hook 'ess-mode-hook 'ots-ess-start t)

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
(setq ess-use-tracebug nil)
(setq ess-write-to-dribble nil)

;; Indentation
(setq ess-align-blocks '())
(setq ess-indent-from-lhs '())
(setq ess-indent-offset 4)
(setq ess-indent-with-fancy-comments nil)
(setq ess-offset-arguments-newline 'prev-line)
(setq ess-style 'DEFAULT)

(provide 'ots-ess)
;;; ots-ess.el ends here
