;;; -*- coding: utf-8 -*-
;;; ots-browse-url.el

(use-package browse-url
  :defer t
  :config
  (setq browse-url-browser-function 'browse-url-chrome)
  (setq browse-url-chrome-program "brave-browser"))

(provide 'ots-browse-url)
;;; ots-browse-url.el ends here
