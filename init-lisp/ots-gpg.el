;;; -*- coding: utf-8 -*-
;;; ots-gpg.el

;; Remember passphrase typed when opening a GPG-encrypted file and
;; automatically use the same passphrase when saving the file.
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq epa-pinentry-mode 'loopback)

(pinentry-start)

(provide 'ots-gpg)
;;; ots-gpg.el ends here
