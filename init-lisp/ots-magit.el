;;; -*- coding: utf-8 -*-
;;; ots-magit.el

;; Only use magit for git-commit-mode.
(modify-coding-system-alist 'file "COMMIT_EDITMSG\\'" 'utf-8)
(global-git-commit-mode)

(provide 'ots-magit)
;;; ots-magit.el ends here
