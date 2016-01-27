;;; -*- coding: utf-8 -*-
;;; ots-magit.el

(defun ots-magit-set-properties ()
  "Set properties for Magit buffers."
  (local-set-key (kbd "C-w") 'magit-mode-bury-buffer)
  (local-set-key (kbd "<C-tab>") 'ots-util-next-window)
  (local-set-key (kbd "<S-tab>") 'ots-util-previous-window)
  (local-set-key (kbd "<S-iso-lefttab>") 'ots-util-previous-window))

(add-hook 'magit-mode-hook 'ots-magit-set-properties t)
(global-set-key (kbd "C-ö") 'magit-status)

(provide 'ots-magit)
;;; ots-magit.el ends here
