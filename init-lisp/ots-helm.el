;;; -*- coding: utf-8 -*-
;;; ots-helm.el

(require 'helm-config)
(setq helm-case-fold-search t)

;; XXX: Does not work well in some cases, e.g. sgml-tag.
;; (helm-mode 1)

(provide 'ots-helm)
;;; ots-helm.el ends here
