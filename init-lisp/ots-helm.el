;;; -*- coding: utf-8 -*-
;;; ots-helm.el

(defun ots-helm-find-file ()
  "Find a file to open from common sources."
  (interactive)
  (if (and (fboundp 'projectile-project-p)
           (projectile-project-p))
      (helm-projectile-find-file-dwim)
    (helm-find-files default-directory)))

(global-set-key (kbd "C-o") 'ots-helm-find-file)
(setq helm-case-fold-search t)
(setq helm-grep-ag-command "rg --no-heading %s %s %s")
(setq helm-grep-file-path-style 'relative)
(setq helm-grep-ignored-directories '("elpa"))
(setq helm-grep-ignored-files '("*.min.js"))
(setq helm-split-window-default-side 'below)
(setq helm-split-window-in-side-p t)

(provide 'ots-helm)
;;; ots-helm.el ends here
