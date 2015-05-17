;;; -*- coding: utf-8 -*-
;;; ots-ess-mode.el

(require 'ots-auto-complete)
(require 'ess-site)

(defun ess-smart-S-assign ()
  "Always insert a fucking underscore, regardless of whether
  ess-toggle-underscore happens to be working or not."
  (interactive)
  (insert "_"))

(defun ots-ess-mode-set-sources ()
  "Set sources to use with auto-complete mode."
  (setq ac-sources (remq 'ac-source-R-args ac-sources)))

(defun ots-ess-mode-set-faces ()
  "Set faces for editing R files."
  (font-lock-add-keywords
   nil
   '(;; Keywords
     ("\\(\\.\\.\\.\\)"
      1 font-lock-keyword-face)
     ;; Constants
     ("\\<\\(FALSE\\|Inf\\|NA\\|NaN\\|NULL\\|TRUE\\)\\>"
      1 font-lock-constant-face)
     ;; Strings
     ("\\<\\([0-9.]+L?\\)\\>"
      1 font-lock-string-face)
     ;; Functions
     ("^ *\\([a-zA-Z0-9._]+\\) *\\(=\\|<<?-\\) *function\\>"
      1 font-lock-function-name-face)
     ;; Keyword arguments
     ("\\<\\([a-zA-Z0-9._]+\\)=[^=]"
      1 font-lock-preprocessor-face)
     ;; Built-ins
     ("\\<\\(browser\\|function\\|library\\|messagef?\\|print\\|return\\|stop\\|stopif\\|stopifnot\\|source\\|warning\\)\\>"
      1 font-lock-builtin-face)
     ;; Variables
     ("^ *\\([a-zA-Z0-9._]+\\) +\\(=\\|<<?-\\)[^=]"
      1 font-lock-variable-name-face)
     ("^ *\\([a-zA-Z0-9._]+\\)\\[.+\\] +\\(=\\|<<?-\\)[^=]"
      1 font-lock-variable-name-face)
     ("^ *\\([a-zA-Z0-9._]+\\$[a-zA-Z0-9._]+\\) +\\(=\\|<<?-\\)[^=]"
      1 font-lock-variable-name-face)
     ("^ *\\([a-zA-Z0-9._]+\\$[a-zA-Z0-9._]+\\)\\[.+\\] +\\(=\\|<<?-\\)[^=]"
      1 font-lock-variable-name-face)
     )))

(defun ots-ess-mode-set-keys ()
  "Set keybindings for editing R files."
  (local-set-key (kbd "C-m") 'exchange-point-and-mark)
  (local-set-key (kbd "C-+") 'yas/expand)
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<delete>") 'delete-char)
  (local-set-key (kbd "<f2>") 'ess-display-help-on-object)
  (local-set-key (kbd "<f8>") 'ots-ess-start)
  (local-set-key (kbd "<f9>") 'ots-ess-mode-source)
  (local-set-key (kbd "<S-f9>") 'ots-ess-mode-setwd))

(defun ots-ess-mode-set-properties ()
  "Set properties for editing R files."
  (hs-minor-mode 1)
  (modify-syntax-entry ?_ "w")
  (setq ac-use-quick-help nil)
  (setq comment-add 0)
  (setq ess-arg-function-offset nil)
  (setq ess-ask-for-ess-directory nil)
  (setq ess-brace-imaginary-offset 0)
  (setq ess-brace-offset -4)
  (setq ess-close-brace-offset 0)
  (setq ess-continued-brace-offset 0)
  (setq ess-continued-statement-offset 4)
  (setq ess-else-offset 0)
  (setq ess-expression-offset nil)
  (setq ess-fancy-comments nil)
  (setq ess-first-continued-statement-offset 0)
  (setq ess-history-directory "~")
  (setq ess-indent-level 4)
  (setq ess-roxy-str "#'")
  (setq ess-use-auto-complete t)
  (setq ess-use-eldoc t)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq inferior-ess-r-help-command ".ess.help('%s', help.type='html')\n")
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(defun ots-ess-mode-setwd ()
  "setwd to the directory of the current buffer in R."
  (interactive)
  (ess-change-directory (file-name-directory (buffer-file-name))))

(defun ots-ess-mode-start ()
  "Start or associate a process for the buffer."
  (setq inferior-R-args "--no-save --no-restore-history --quiet")
  (let ((new-process (not ess-process-name-list)))
    (ess-force-buffer-current nil t nil nil)
    (if new-process
        (delete-other-windows)))
  (set-process-query-on-exit-flag (get-process "R") nil))

(defun ots-ess-mode-source ()
  "Source the current buffer in R."
  (interactive)
  (if (not ess-local-process-name)
      (ess-switch-process))
  (ess-change-directory (file-name-directory (buffer-file-name)))
  (sleep-for 1)
  (let ((file-name (file-name-nondirectory (buffer-file-name))))
    (ess-switch-to-end-of-ESS)
    (insert (format "source('%s')" file-name))
    (comint-send-input)))

(add-hook 'ess-mode-hook 'ots-ess-mode-set-faces t)
(add-hook 'ess-mode-hook 'ots-ess-mode-set-keys t)
(add-hook 'ess-mode-hook 'ots-ess-mode-set-properties t)
(add-hook 'ess-mode-hook 'ots-ess-mode-set-sources t)
(add-hook 'ess-mode-hook 'ots-ess-mode-start t)

(provide 'ots-ess-mode)
;;; ots-ess-mode.el ends here
