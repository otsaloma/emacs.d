;;; -*- coding: utf-8 -*-
;;; ots-helm.el

(require 'helm-config)
(require 'helm-for-files)

(defun ots-helm-find-file ()
  "Find a file to open from common sources."
  (interactive)
  (require 'helm-projectile)
  (helm :sources '(helm-source-projectile-files-list
                   helm-source-files-in-current-dir)
        :ff-transformer-show-only-basename nil
        :buffer "*helm-find-file*"))

(global-set-key (kbd "C-o") 'ots-helm-find-file)
(setq helm-case-fold-search t)
(setq helm-split-window-default-side 'below)
(setq helm-split-window-in-side-p t)

(provide 'ots-helm)
;;; ots-helm.el ends here
