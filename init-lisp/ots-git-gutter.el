;;; -*- coding: utf-8 -*-
;;; ots-git-gutter.el

(defun ots-git-gutter-enable ()
  "Enable git-gutter."
  (setq git-gutter-fr+-side 'right-fringe)
  (git-gutter+-mode t))

(defun ots-git-gutter-enable-maybe ()
  "Enable git-gutter if in a git repository."
  (if (ots-util-in-git-repo (buffer-file-name))
      (if (not (string-suffix-p ".csv" (buffer-file-name)))
          (ots-git-gutter-enable))))

(use-package git-gutter-fringe+
  :defer t
  :init
  (add-hook 'find-file-hook 'ots-git-gutter-enable-maybe))

(provide 'ots-git-gutter)
;;; ots-git-gutter.el ends here
