;;; -*- coding: utf-8 -*-
;;; ots-smooth-scrolling.el

(require 'smooth-scrolling)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control))))
(setq scroll-preserve-screen-position nil)
(setq smooth-scroll-margin 10)

(provide 'ots-smooth-scrolling)
;;; ots-smooth-scrolling.el ends here
