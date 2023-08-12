;;; -*- coding: utf-8 -*-
;;; ots-git-gutter.el

(defun ots-git-gutter-enable ()
  "Enable git-gutter."
  (git-gutter-mode 1))

(defun ots-git-gutter-enable-maybe ()
  "Enable git-gutter if in a git repository."
  (if (ots-util-in-git-repo (buffer-file-name))
      (if (not (string-suffix-p ".csv" (buffer-file-name)))
          (ots-git-gutter-enable))))

(use-package git-gutter)
(use-package git-gutter-fringe
  :config
  (add-hook 'find-file-hook 'ots-git-gutter-enable-maybe)
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated)))

(provide 'ots-git-gutter)
;;; ots-git-gutter.el ends here
