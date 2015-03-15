;;; -*- coding: utf-8 -*-
;;; ots-comint-mode.el

(defun ots-comint-mode-next ()
  "Fetch the next line from command input history."
  (interactive)
  (let ((current (line-number-at-pos))
        (total (count-lines (point-min) (point-max))))
    (if (= current total)
        (comint-next-input 1)
      (forward-line 1))))

(defun ots-comint-mode-previous ()
  "Fetch the previous line from command input history."
  (interactive)
  (let ((current (line-number-at-pos))
        (total (count-lines (point-min) (point-max))))
    (if (= current total)
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
  (setq comint-completion-autolist t)
  (setq comint-completion-recexact t)
  (setq comint-input-ignoredups t)
  (setq comint-move-point-for-output "all")
  (setq comint-process-echoes t)
  (setq comint-prompt-read-only nil)
  (setq comint-scroll-show-maximum-output t)
  (if (eq system-type 'windows-nt)
      (setq comint-completion-addsuffix '("\\" . " "))
    (setq comint-completion-addsuffix t)))

(add-hook 'comint-mode-hook 'ots-comint-mode-set-keys)
(add-hook 'comint-mode-hook 'ots-comint-mode-set-properties)

(provide 'ots-comint-mode)
;;; ots-comint-mode.el ends here
