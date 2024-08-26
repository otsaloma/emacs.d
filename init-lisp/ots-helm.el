;;; -*- coding: utf-8 -*-
;;; ots-helm.el

(defun ots-helm-find-file ()
  "Find a file to open from common sources."
  (interactive)
  (if (ots-util-project-p)
      (helm-projectile-find-file-dwim)
    (helm-find-files default-directory)))

(defun ots-helm-git-grep (arg)
  "Run ripgrep at project root and show results with helm."
  ;; Compare: helm-do-grep-ag
  ;; Note that ag is really rg as defined below.
  (interactive "P")
  (require 'helm-files)
  (if (ots-util-project-p)
      (let ((default-directory (projectile-project-root)))
        (helm-grep-ag (expand-file-name default-directory) arg))
    (helm-grep-ag (expand-file-name default-directory) arg)))

(use-package helm
  :defer t
  :config
  (setq helm-case-fold-search t)
  (setq helm-grep-ag-command "rg %s %s %s")
  (setq helm-grep-file-path-style 'relative)
  (setq helm-grep-ignored-directories '("elpa"))
  (setq helm-grep-ignored-files '("*.min.js"))
  (setq helm-split-window-default-side 'below)
  (setq helm-split-window-in-side-p t))

(provide 'ots-helm)
;;; ots-helm.el ends here
