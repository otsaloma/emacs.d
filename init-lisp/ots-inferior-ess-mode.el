;;; -*- coding: utf-8 -*-
;;; ots-inferior-ess-mode.el

(defun ots-inferior-ess-mode-clear ()
  "Clear the ESS initialization junk from the buffer."
  (with-current-buffer "*R*"
    (comint-clear-buffer)))

(defun ots-inferior-ess-mode-set-properties ()
  "Set properties for interactive R sessions."
  (run-with-idle-timer 1 nil 'ots-inferior-ess-mode-clear)
  (local-set-key (kbd "C-b") 'ots-inferior-ess-mode-smart-home)
  (local-set-key (kbd "<home>") 'ots-inferior-ess-mode-smart-home)
  (local-set-key (kbd "C-ö") 'ots-ess-mode-insert-pipe)
  (local-set-key (kbd "_") '(lambda () (interactive) (insert "_")))
  ;; Avoid rlang etc. output making text unreadable.
  ;; https://github.com/emacs-ess/ESS/issues/1193
  (setq-local ansi-color-for-comint-mode 'filter)
  (setq-local ess-R-argument-suffix "=")
  (setq-local ess-use-company t)
  (setq-local inferior-ess-r-help-command ".ess.help('%s', help.type='html')\n")
  ;; Try to avoid broken syntax highlighting due to messages etc.
  (copy-face 'default 'ess-operator-face))

(defun ots-inferior-ess-mode-smart-home (&optional count)
  "Go to the beginning of the line or right after the prompt."
  (interactive)
  (beginning-of-line count)
  (if (looking-at "> ")
      (forward-char 2)
    (if (looking-at "Browse\\[[0-9]\\]> ")
        (forward-char 11))))

(add-hook 'inferior-ess-mode-hook 'ots-inferior-ess-mode-set-properties t)
(setq inferior-R-args "--no-save --no-restore-history --quiet")

(provide 'ots-inferior-ess-mode)
;;; ots-inferior-ess-mode.el ends here
