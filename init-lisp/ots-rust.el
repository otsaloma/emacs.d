;;; -*- coding: utf-8 -*-
;;; ots-rust.el

(defun ots-rust-set-properties ()
  "Set properties for editing Rust files."
  (setq-local rust-indent-offset 4))

(autoload 'rust-mode "rust-mode" nil t)
(add-hook 'rust-mode-hook 'ots-rust-set-properties)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(provide 'ots-rust)
;;; ots-rust.el ends here
