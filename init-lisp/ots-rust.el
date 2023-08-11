;;; -*- coding: utf-8 -*-
;;; ots-rust.el

(defun ots-rust-set-properties ()
  "Set properties for editing Rust files."
  (setq-local rust-indent-offset 4))

(use-package rust-mode
  :defer t
  :config
  (add-hook 'rust-mode-hook 'ots-rust-set-properties))

(provide 'ots-rust)
;;; ots-rust.el ends here
