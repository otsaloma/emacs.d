;;; -*- coding: utf-8 -*-
;;; ots-pcre.el

;; Use PCRE for regular expressions in the minibuffer.
(add-hook 'after-change-major-mode-hook
          '(lambda () (pcre-mode 1)) t)

(provide 'ots-pcre)
;;; ots-pcre.el ends here
