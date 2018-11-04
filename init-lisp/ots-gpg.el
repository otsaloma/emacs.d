;;; -*- coding: utf-8 -*-
;;; ots-gpg.el

;; Remember passphrase typed when opening a GPG-encrypted file
;; and automatically use the same passphrase when saving the file.
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq epa-pinentry-mode 'loopback)

(pinentry-start)

(defun ots-gpg-mask ()
  "Hide contents of all lines beginning with a space."
  (when (string= (file-name-nondirectory buffer-file-name) "pass.gpg")
    (font-lock-add-keywords
     nil '(("^ \\(.*\\)$" 1 font-lock-keyword-face)))
    (let ((default-bg (face-attribute 'default :background))
          (default-fg (face-attribute 'default :foreground)))
      (set-face-attribute 'region nil :foreground default-fg :strike-through nil)
      (set-face-attribute 'font-lock-keyword-face nil :foreground default-bg :strike-through default-fg))))

(add-hook 'find-file-hook 'ots-gpg-mask)

(provide 'ots-gpg)
;;; ots-gpg.el ends here
