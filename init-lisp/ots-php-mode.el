;;; -*- coding: utf-8 -*-
;;; ots-php-mode.el

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(defun ots-php-mode-set-properties ()
  "Set properties for editing php files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (hs-minor-mode 1)
  (setq-local company-backends
   '((company-keywords company-dabbrev-code)
     (company-dabbrev)))
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'php-mode-hook 'ots-php-mode-set-properties)
(modify-coding-system-alist 'file "\\.php\\'" 'utf-8)

(provide 'ots-php-mode)
;;; ots-php-mode.el ends here
