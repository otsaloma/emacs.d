;;; -*- coding: utf-8 -*-
;;; ots-compilation.el

(use-package compile
  :defer t
  :config
  (add-hook 'compilation-filter-hook 'comint-truncate-buffer)
  (setq comint-buffer-maximum-size 1024)
  (setq compilation-scroll-output t)
  (setq truncate-partial-width-windows nil))

(provide 'ots-compilation)
;;; ots-compilation.el ends here
