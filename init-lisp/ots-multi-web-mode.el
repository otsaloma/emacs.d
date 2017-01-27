;;; -*- coding: utf-8 -*-
;;; ots-multi-web-mode.el

(require 'multi-web-mode)

;; HTML in Javascript/ES6 template literals.
(setq mweb-default-major-mode 'js-mode)
(setq mweb-tags '((html-mode "`\n? *<" ">`")))
(setq mweb-filename-extensions '("js"))
(multi-web-global-mode 1)

(provide 'ots-multi-web-mode)
;;; ots-multi-web-mode.el ends here
