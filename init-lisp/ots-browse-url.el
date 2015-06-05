;;; -*- coding: utf-8 -*-
;;; ots-browse-url.el

(setq browse-url-browser-function 'browse-url-firefox)
(setq browse-url-firefox-new-window-is-tab t)
(setq browse-url-new-window-flag t)

(when (eq system-type 'windows-nt)
  (setq browse-url-firefox-program
        "C:/Program Files (x86)/Mozilla Firefox/firefox.exe"))

(provide 'ots-browse-url)
;;; ots-browse-url.el ends here
