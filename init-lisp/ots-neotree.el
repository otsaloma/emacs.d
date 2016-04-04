;;; -*- coding: utf-8 -*-
;;; ots-neotree.el

(defun ots-neotree-update-width ()
  "Update neotree width to be relative to total frame width."
  (let ((width (window-total-width (frame-root-window))))
    (setq neo-window-width (floor (* 0.3 width)))))

(add-hook 'window-configuration-change-hook 'ots-neotree-update-width t)
(global-set-key (kbd "<S-f4>") 'neotree-toggle)
(global-set-key (kbd "<C-S-f4>") 'neotree-find)

(provide 'ots-neotree)
;;; ots-neotree.el ends here
