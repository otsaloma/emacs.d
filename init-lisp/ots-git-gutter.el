;;; -*- coding: utf-8 -*-
;;; ots-git-gutter.el

(require 'ots-util)

(defun ots-git-gutter-enable ()
  "Enable git-gutter."
  (require 'git-gutter-fringe+)
  (setq git-gutter-fr+-side 'right-fringe)
  (git-gutter+-mode t))

(defun ots-git-gutter-enable-maybe ()
  "Enable git-gutter if in a git repository."
  (let ((parent (file-name-directory (buffer-file-name))))
    (dotimes (i 10)
      (if (file-exists-p (concat parent "/.git/"))
          (ots-git-gutter-enable))
      (setq parent (ots-util-parent-directory parent)))))

(add-hook 'find-file-hook 'ots-git-gutter-enable-maybe)

(provide 'ots-git-gutter)
;;; ots-git-gutter.el ends here
