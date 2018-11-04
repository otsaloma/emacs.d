;;; -*- coding: utf-8 -*-
;;; ots-rust-mode.el

(defun ots-rust-mode-set-properties ()
  "Set properties for editing Rust files."
  (racer-mode 1)
  (setq-local company-backends
   '((company-capf company-keywords company-dabbrev-code)
     (company-dabbrev)))
  (setq-local rust-indent-offset 4))

(autoload 'rust-mode "rust-mode" nil t)
(add-hook 'rust-mode-hook 'ots-rust-mode-set-properties)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(provide 'ots-rust-mode)
;;; ots-rust-mode.el ends here
