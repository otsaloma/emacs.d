;;; -*- coding: utf-8 -*-
;;; ots-helm.el

(use-package helm
  :defer t
  :config
  (setq helm-case-fold-search t)
  (setq helm-split-window-default-side 'below)
  (setq helm-split-window-in-side-p t))

(provide 'ots-helm)
;;; ots-helm.el ends here
