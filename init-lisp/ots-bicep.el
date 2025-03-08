;;; -*- coding: utf-8 -*-
;;; ots-bicep.el

;; XXX: Work around (void-function bicep-langserver-path)
;; error that for some reason comes from eglot. (3/2025)
(defun bicep-langserver-path (&rest rest) "/xxx/yyy/zzz")

(use-package bicep-ts-mode :defer t :mode "\\.bicep\\'")

(provide 'ots-bicep)
;;; ots-bicep.el ends here
