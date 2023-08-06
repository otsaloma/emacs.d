;;; -*- coding: utf-8 -*-
;;; ots-dockerfile.el

(use-package dockerfile-mode
  :config
  (add-to-list 'auto-mode-alist '("\\<Dockerfile" . dockerfile-mode))
  (modify-coding-system-alist 'file "\\<Dockerfile" 'utf-8))

(provide 'ots-dockerfile)
;;; ots-dockerfile.el ends here
