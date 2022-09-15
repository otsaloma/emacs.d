;;; -*- coding: utf-8 -*-
;;; ots-ligature.el

(require 'ligature)

;; https://github.com/microsoft/cascadia-code#font-features
(ligature-set-ligatures '(markdown-mode text-mode) '("!="
                                                     ">="
                                                     "<="
                                                     "<-"
                                                     "<--"
                                                     "->"
                                                     "-->"
                                                     "<!--"
                                                     "<=="
                                                     "==>"))

(global-ligature-mode t)

(provide 'ots-ligature)
;;; ots-ligature.el ends here
