;;; -*- coding: utf-8 -*-
;;; ots-gpg.el

;; Remember passphrase typed when opening a GPG-encrypted file
;; and automatically use the same passphrase when saving the file.
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq epa-pinentry-mode 'loopback)

(pinentry-start)

(defun ots-gpg-copy ()
  "Copy phrase at point to the clipboard."
  (interactive)
  (kill-new
   (replace-regexp-in-string "^.: *" ""
    (replace-regexp-in-string "[ \n]*$" ""
     (thing-at-point 'line t))))
  (message "Copied to clipboard!"))

(defun ots-gpg-pass ()
  "Add special font-lock for pass.gpg files."
  (local-set-key (kbd "C-c C-c") 'ots-gpg-copy)
  (local-set-key (kbd "<f5>") 'ots-gpg-copy)
  (font-lock-add-keywords
   nil '(("^#: +\\(.+\\)$" 1 font-lock-function-name-face)
         ("^u: +\\(.+\\)$" 1 font-lock-variable-name-face)
         ("^p: +\\(.+\\)$" 1 font-lock-keyword-face)))
  (let ((default-fg (face-attribute 'default :foreground)))
    (set-face-attribute 'font-lock-keyword-face nil
                        :background default-fg
                        :foreground default-fg)))

(defun ots-gpg-pass-maybe ()
  "Add special font-lock for pass.gpg files."
  (when (string= (file-name-nondirectory buffer-file-name) "pass.gpg")
    (ots-gpg-pass)))

(add-hook 'find-file-hook 'ots-gpg-pass-maybe)

(provide 'ots-gpg)
;;; ots-gpg.el ends here
