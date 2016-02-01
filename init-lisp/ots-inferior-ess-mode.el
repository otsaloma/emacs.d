;;; -*- coding: utf-8 -*-
;;; ots-inferior-ess-mode.el

(defun ess-smart-S-assign ()
  "Always insert a fucking underscore, regardless of whether
  ess-toggle-underscore happens to be working or not."
  (interactive)
  (insert "_"))

(defun ots-inferior-ess-mode-set-properties ()
  "Set properties for interactive R sessions."
  ;; auto-complete with global config seems slow.
  (setq-local ac-delay 0.5)
  (setq-local ac-sources (remq 'ac-source-R-args ac-sources))
  (setq-local ac-use-quick-help nil)
  (local-set-key (kbd "C-b") 'ots-inferior-ess-mode-smart-home)
  (local-set-key (kbd "<home>") 'ots-inferior-ess-mode-smart-home)
  (setq ac-use-quick-help nil)
  (setq ess-use-auto-complete t)
  (setq inferior-ess-r-help-command ".ess.help('%s', help.type='html')\n")
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
