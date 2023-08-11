;;; -*- coding: utf-8 -*-
;;; ots-browse-url.el

(use-package browse-url
  :defer t
  :config
  (setq browse-url-browser-function 'browse-url-xdg-open))

(provide 'ots-browse-url)
;;; ots-browse-url.el ends here
