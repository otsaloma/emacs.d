;;; -*- coding: utf-8 -*-
;;; ots-inferior-ess-mode.el

(defun ess-smart-S-assign ()
  "Always insert a fucking underscore, regardless of whether
  ess-toggle-underscore happens to be working or not."
  (interactive)
  (insert "_"))

(defun ots-inferior-ess-mode-set-properties ()
  "Set properties for interactive R sessions."
  (local-set-key (kbd "C-b") 'ots-inferior-ess-mode-smart-home)
  (local-set-key (kbd "<home>") 'ots-inferior-ess-mode-smart-home)
  (setq ess-R-argument-suffix "=")
  (setq ess-use-company t)
  (setq inferior-ess-r-help-command
   ".ess.help('%s', help.type='html')\n")
  (when (eq system-type 'windows-nt)
    (setq process-coding-system-alist '(("R.*" . windows-1252)))))

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
