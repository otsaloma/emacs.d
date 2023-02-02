;;; -*- coding: utf-8 -*-
;;; ots-ligature.el

;; Local Variables:
;; eval: (ligature-mode -1)
;; End:

(require 'ligature)

;; https://github.com/mickeynp/ligature.el
;; https://github.com/microsoft/cascadia-code#font-features
(ligature-set-ligatures
 '(markdown-mode prog-mode text-mode)
 '("<-" "<--" "<!--" "<==" "->" "-->" "==>" "|>"))

(global-ligature-mode t)

(provide 'ots-ligature)
;;; ots-ligature.el ends here
