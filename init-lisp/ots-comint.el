;;; -*- coding: utf-8 -*-
;;; ots-comint.el

(defun ots-comint-next ()
  "Fetch the next line from command input history."
  (interactive)
  (let ((total (line-number-at-pos (point-max))))
    (if (= (line-number-at-pos) total)
        (comint-next-input 1)
      (forward-line 1))))

(defun ots-comint-previous ()
  "Fetch the previous line from command input history."
  (interactive)
  (let ((total (line-number-at-pos (point-max))))
    (if (= (line-number-at-pos) total)
        (comint-previous-input 1)
      (forward-line -1))))

(defun ots-comint-set-keys ()
  "Set keybindings for inferior interpreter sessions."
  (local-set-key (kbd "C-r") 'helm-comint-input-ring)
  (local-set-key (kbd "<tab>") 'completion-at-point)
  (local-set-key (kbd "<up>") 'ots-comint-previous)
  (local-set-key (kbd "<C-up>") 'previous-line)
  (local-set-key (kbd "<down>") 'ots-comint-next)
  (local-set-key (kbd "<C-down>") 'next-line))

(defun ots-comint-set-properties ()
  "Set properties for inferior interpreter sessions."
  (setq-local comint-buffer-maximum-size 1024)
  (setq-local comint-completion-addsuffix t)
  (setq-local comint-completion-autolist t)
  (setq-local comint-completion-recexact t)
  (setq-local comint-input-ignoredups t)
  (setq-local comint-move-point-for-output "all")
  (setq-local comint-prompt-read-only nil)
  (setq-local comint-scroll-show-maximum-output t)
  (make-local-variable 'jit-lock-defer-timer)
  (setq-local jit-lock-defer-time 0)
  (if (not (eq major-mode 'inferior-emacs-lisp-mode))
      (setq-local comint-process-echoes t)))

(defun ots-comint-wrap (text)
  "Wrap output to avoid long lines slowing Emacs down."
  ;; https://www.reddit.com/r/emacs/comments/3scsak/
  (replace-regexp-in-string
   (format "\\([^\n]\\{%d\\}\\)" (window-body-width))
   "\\1\n"
   text))

(use-package comint
  :defer t
  :config
  (add-hook 'comint-mode-hook 'ots-comint-set-keys)
  (add-hook 'comint-mode-hook 'ots-comint-set-properties)
  (add-hook 'comint-output-filter-functions #'comint-truncate-buffer)
  (add-hook 'comint-preoutput-filter-functions 'ots-comint-wrap))

(provide 'ots-comint)
;;; ots-comint.el ends here
