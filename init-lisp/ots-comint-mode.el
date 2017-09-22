;;; -*- coding: utf-8 -*-
;;; ots-comint-mode.el

(defun ots-comint-mode-next ()
  "Fetch the next line from command input history."
  (interactive)
  (let ((total (line-number-at-pos (point-max))))
    (if (= (line-number-at-pos) total)
        (comint-next-input 1)
      (forward-line 1))))

(defun ots-comint-mode-previous ()
  "Fetch the previous line from command input history."
  (interactive)
  (let ((total (line-number-at-pos (point-max))))
    (if (= (line-number-at-pos) total)
        (comint-previous-input 1)
      (forward-line -1))))

(defun ots-comint-mode-set-keys ()
  "Set keybindings for inferior interpreter sessions."
  (local-set-key (kbd "C-r") 'helm-comint-input-ring)
  (local-set-key (kbd "<tab>") 'comint-dynamic-complete)
  (local-set-key (kbd "<up>") 'ots-comint-mode-previous)
  (local-set-key (kbd "<C-up>") 'previous-line)
  (local-set-key (kbd "<down>") 'ots-comint-mode-next)
  (local-set-key (kbd "<C-down>") 'next-line))

(defun ots-comint-mode-set-properties ()
  "Set properties for inferior interpreter sessions."
  (if (eq system-type 'windows-nt)
      (setq-local comint-completion-addsuffix '("\\" . " "))
    (setq-local comint-completion-addsuffix t))
  (setq-local comint-completion-autolist t)
  (setq-local comint-completion-recexact t)
  (setq-local comint-input-ignoredups t)
  (setq-local comint-move-point-for-output "all")
  (if (not (eq major-mode 'inferior-emacs-lisp-mode))
      (setq-local comint-process-echoes t))
  (setq-local comint-prompt-read-only nil)
  (setq-local comint-scroll-show-maximum-output t))

(add-hook 'comint-mode-hook 'ots-comint-mode-set-keys)
(add-hook 'comint-mode-hook 'ots-comint-mode-set-properties)

(provide 'ots-comint-mode)
;;; ots-comint-mode.el ends here
