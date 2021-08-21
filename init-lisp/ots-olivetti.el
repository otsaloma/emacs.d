;;; -*- coding: utf-8 -*-
;;; ots-olivetti.el

(setq olivetti-body-width 120)
(setq olivetti-margin-width 3)
(setq olivetti-style 'fancy)

(add-hook 'olivetti-mode-hook '(lambda () (git-gutter+-mode -1)))
(global-set-key (kbd "<C-f11>") 'olivetti-mode)

(provide 'ots-olivetti)
;;; ots-olivetti.el ends here
