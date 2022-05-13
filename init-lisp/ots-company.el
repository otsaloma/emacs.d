;;; -*- coding: utf-8 -*-
;;; ots-company.el

(defun ots-company-enter ()
  "Just do what the fuck Enter should do."
  (interactive)
  (company-abort)
  (execute-kbd-macro (kbd "<return>")))

(defun ots-company-left ()
  "Just do what the fuck Left should do."
  (interactive)
  (company-abort)
  (execute-kbd-macro (kbd "<left>")))

(defun ots-company-right ()
  "Just do what the fuck Right should do."
  (interactive)
  (company-abort)
  (execute-kbd-macro (kbd "<right>")))

(defun ots-company-save ()
  "Just do what the fuck Ctrl+S should do."
  (interactive)
  (company-abort)
  (execute-kbd-macro (kbd "C-s")))

(defun ots-company-set-keys ()
  "Set keybindings for company-mode buffers."
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
  (define-key company-active-map (kbd "<return>") 'ots-company-enter)
  (define-key company-active-map (kbd "<left>") 'ots-company-left)
  (define-key company-active-map (kbd "<right>") 'ots-company-right)
  (define-key company-active-map (kbd "C-s") 'ots-company-save))

(defun ots-company-set-properties ()
  "Set properties for company-mode buffers."
  (setq-local company-dabbrev-code-everywhere nil)
  (setq-local company-dabbrev-downcase nil)
  (setq-local company-dabbrev-ignore-case nil)
  (setq-local company-dabbrev-minimum-length 2)
  ;; Disable icons.
  ;; https://github.com/company-mode/company-mode/issues/1102
  (setq-local company-format-margin-function nil)
  (setq-local company-idle-delay 0.1)
  (setq-local company-tooltip-align-annotations t)
  (setq-local company-transformers '(company-sort-by-backend-importance
                                     delete-consecutive-dups)))

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'company-mode-hook 'ots-company-set-keys)
(add-hook 'company-mode-hook 'ots-company-set-properties)

(provide 'ots-company)
;;; ots-company.el ends here
