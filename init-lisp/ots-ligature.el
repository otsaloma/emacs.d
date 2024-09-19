;;; -*- coding: utf-8 -*-
;;; ots-ligature.el

;; Local Variables:
;; eval: (ligature-mode -1)
;; End:

(use-package ligature
  :config
  ;; https://github.com/mickeynp/ligature.el
  (ligature-set-ligatures '(text-mode) '("<-" "<--" "<!--" "<==" "->" "-->" "==>"))
  (global-ligature-mode -1))

(provide 'ots-ligature)
;;; ots-ligature.el ends here
