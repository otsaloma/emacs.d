;;; -*- coding: utf-8 -*-
;;; ots-multi-web-mode.el

(require 'multi-web-mode)

;; XXX: multi-web-mode doesn't seem to work with mode-specific hooks and/or
;; buffer-local definitions, so we can only use one global config at a time.

;; JavaScript + HTML in template literals
(setq mweb-default-major-mode 'js-mode)
(setq mweb-tags '((html-mode "`\n? *<" ">`")))
(setq mweb-filename-extensions '("js"))
(multi-web-global-mode 1)

;; HTML + CSS and JavaScript
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags
;;       '((css-mode "<style>" "</style>")
;;         (js-mode "<script>" "</script>")))
;; (setq mweb-filename-extensions '("html"))
;; (multi-web-global-mode 1)

(provide 'ots-multi-web-mode)
;;; ots-multi-web-mode.el ends here
