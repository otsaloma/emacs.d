;;; -*- coding: utf-8-unix -*-
;;; ots-woman.el

(defun ots-woman-rename-buffer ()
  "Rename woman buffer according to the man page name."
  (let ((name (buffer-name)))
    (if (string-match-p "WoMan [0-9]+" name)
        (rename-buffer (format "*man %s" (car (last (split-string name))))))))

(use-package woman
  :defer t
  :config
  (add-hook 'woman-mode-hook 'ots-woman-rename-buffer t)
  (setq-default woman-use-own-frame nil))

(provide 'ots-woman)
;;; ots-woman.el ends here
