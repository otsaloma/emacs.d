;;; -*- coding: utf-8 -*-
;;; ots-prog.el

(defun ots-prog-set-keys ()
  "Set keybindings for editing program code."
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify))

(defun ots-prog-set-properties ()
  "Set properties for editing program code."
  (unwind-protect (ignore-errors (eldoc-mode 1)) (message ""))
  (unwind-protect (ignore-errors (hs-minor-mode 1)) (message ""))
  (modify-syntax-entry ?_ "w")
  (setq-local company-backends '((company-capf
                                  company-keywords
                                  company-dict
                                  company-dabbrev-code
                                  company-dabbrev)))

  (setq-local comment-auto-fill-only-comments t)
  (setq-local eldoc-echo-area-use-multiline-p nil)
  (setq-local fill-column 80)
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
  (setq-local truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'prog-mode-hook 'ots-prog-set-keys)
(add-hook 'prog-mode-hook 'ots-prog-set-properties)

;; Some programming modes don't inherit from prog-mode.
;; Add hooks for these modes too, but remember to append
;; the main config hook so that it has precedence over this.
(add-hook 'ess-mode-hook 'ots-prog-set-keys)
(add-hook 'ess-mode-hook 'ots-prog-set-properties)

(provide 'ots-prog)
;;; ots-prog.el ends here
