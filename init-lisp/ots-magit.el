;;; -*- coding: utf-8 -*-
;;; ots-magit.el

(require 'ots-util)

(defun ots-magit-diff-external ()
  "Launch external diff program."
  (interactive)
  (if (eq system-type 'windows-nt)
      (start-process-shell-command "diffuse" "*diffuse*" "diffuse -m")
    (start-process-shell-command "meld" "*meld*" "meld .")))

(defun ots-magit-enable ()
  "Enable magit."
  (require 'magit)
  (add-hook 'magit-mode-hook 'ots-magit-set-properties t)
  (global-set-key (kbd "C-ö") 'magit-status))

(defun ots-magit-enable-maybe ()
  "Enable magit if in a git repository."
  (let ((parent (file-name-directory (buffer-file-name))))
    (dotimes (i 10)
      (if (file-exists-p (concat parent "/.git/"))
          (ots-magit-enable))
      (setq parent (ots-util-parent-directory parent)))))

(defun ots-magit-set-properties ()
  "Set properties for Magit buffers."
  (local-set-key (kbd "C-w") 'magit-mode-bury-buffer)
  (local-set-key (kbd "<C-tab>") 'ots-util-next-window)
  (local-set-key (kbd "<S-tab>") 'ots-util-previous-window)
  (local-set-key (kbd "<S-iso-lefttab>") 'ots-util-previous-window)
  (local-set-key (kbd "<f8>") 'ots-magit-diff-external))

(add-hook 'find-file-hook 'ots-magit-enable-maybe)
(modify-coding-system-alist 'file "COMMIT_EDITMSG\\'" 'utf-8)
(global-git-commit-mode)

(provide 'ots-magit)
;;; ots-magit.el ends here
