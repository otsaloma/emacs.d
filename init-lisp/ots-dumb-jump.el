;;; -*- coding: utf-8 -*-
;;; ots-dumb-jump.el

(use-package dumb-jump
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-force-searcher 'rg)
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read))

(provide 'ots-dumb-jump)
;;; ots-dumb-jump.el ends here
