;;; -*- coding: utf-8 -*-
;;; ots-ess-mode.el

(autoload 'R-mode "ess-site.el" "ESS" t)
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))

(setq
 ;; This gets fed to imenu-generic-expression.
 ;; The default in ESS insists on arrows.
 ess-imenu-S-generic-expression
 '((nil "^\\([a-zA-Z0-9._]+\\) = function(" 1)
   (nil "^\\([a-zA-Z0-9._]+\\) <- function(" 1)))

(defun ess-smart-S-assign ()
  "Always insert a fucking underscore, regardless of whether
  ess-toggle-underscore happens to be working or not."
  (interactive)
  (insert "_"))

(defun ots-ess-mode-eval-region ()
  "Send the current region to R."
  (interactive)
  (if (not ess-local-process-name)
      (ess-switch-process))
  (if (use-region-p)
      (ess-eval-region-and-go (region-beginning) (region-end) nil)
    (ess-eval-region-and-go (line-beginning-position) (line-end-position) nil)))

(defun ots-ess-mode-set-faces ()
  "Set faces for editing R files."
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
  (setq ess-default-style 'DEFAULT)
  (setq ess-indent-offset 4)
  (setq ess-indent-with-fancy-comments nil)
  (setq ess-offset-arguments-newline 'prev-line))

(defun ots-ess-mode-set-keys ()
  "Set keybindings for editing R files."
  (local-set-key (kbd "C-m") 'exchange-point-and-mark)
  (local-set-key (kbd "C-+") 'yas-expand)
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<delete>") 'delete-char)
  (local-set-key (kbd "<f2>") 'ess-display-help-on-object)
  (local-set-key (kbd "<f6>") 'ots-ess-mode-start)
  (local-set-key (kbd "<S-f6>") 'ots-ess-mode-setwd)
  (local-set-key (kbd "<f8>") 'ots-ess-mode-source)
  (local-set-key (kbd "<f9>") 'ots-ess-mode-eval-region))

(defun ots-ess-mode-set-properties ()
  "Set properties for editing R files."
  (hs-minor-mode 1)
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?. "w")
  (setq comment-add 0)
  (setq ess-ask-for-ess-directory nil)
  (setq-local company-backends
   '((company-R-objects company-R-args company-keywords company-dabbrev)
     (company-dabbrev)))
  (setq ess-gen-proc-buffer-name-function
   'ess-gen-proc-buffer-name:simple)
  (setq ess-history-directory "~")
  (setq ess-R-argument-suffix "=")
  (setq ess-roxy-str "#'")
  (setq ess-use-company t)
  (setq ess-use-eldoc t)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq inferior-ess-r-help-command
   ".ess.help('%s', help.type='html')\n")
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(defun ots-ess-mode-setwd ()
  "setwd to the directory of the current buffer in R."
  (interactive)
  (ess-change-directory
   (file-name-directory
    (buffer-file-name))))

(defun ots-ess-mode-start ()
  "Start or associate a process for the buffer."
  (interactive)
  (setq inferior-R-args "--no-save --no-restore-history --quiet")
  (let ((new-process (not ess-process-name-list)))
    (ess-force-buffer-current nil t nil nil)
    (if new-process
        (delete-other-windows)))
  (ess-tracebug -1))

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
    (ots-util-comint-send("source('%s')" file-name))))

(add-hook 'ess-mode-hook 'ots-ess-mode-set-faces t)
(add-hook 'ess-mode-hook 'ots-ess-mode-set-indentation t)
(add-hook 'ess-mode-hook 'ots-ess-mode-set-keys t)
(add-hook 'ess-mode-hook 'ots-ess-mode-set-properties t)
(add-hook 'ess-mode-hook 'ots-ess-mode-start t)

(setq ess-R-font-lock-keywords
 '((ess-R-fl-keyword:modifiers . t)
   (ess-R-fl-keyword:fun-defs . t)
   (ess-R-fl-keyword:keywords . t)
   (ess-R-fl-keyword:assign-ops . t)
   (ess-R-fl-keyword:constants . t)
   (ess-fl-keyword:fun-calls)
   (ess-fl-keyword:numbers . t)
   (ess-fl-keyword:operators)
   (ess-fl-keyword:delimiters)
   (ess-fl-keyword:=)
   (ess-R-fl-keyword:F&T . t)
   (ess-R-fl-keyword:%op% . t)))

(provide 'ots-ess-mode)
;;; ots-ess-mode.el ends here
