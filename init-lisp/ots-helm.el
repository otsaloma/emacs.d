;;; -*- coding: utf-8 -*-
;;; ots-helm.el

(require 'helm-config)

(defun ots-helm-find-file ()
  "Find a file to open from common sources."
  (interactive)
  (require 'helm-ls-git)
  ;; We need to set up the git source ourselves.
  ;; Code adapted from function helm-ls-git-ls.
  ;; https://github.com/emacs-helm/helm-ls-git/issues/34
  (let ((sources '(helm-source-files-in-current-dir)))
    (unless (helm-ls-git-not-inside-git-repo)
      (setq helm-source-ls-git
            (helm-make-source "Git files" 'helm-ls-git-source
              :fuzzy-match helm-ls-git-fuzzy-match))
      (helm-set-local-variable
       'helm-ls-git--current-branch
       (helm-ls-git--branch))
      (add-to-list 'sources helm-source-ls-git))
    (helm :sources sources
          :ff-transformer-show-only-basename nil
          :buffer "*helm-find-file*")))

(global-set-key (kbd "C-å") 'ots-helm-find-file)
(setq helm-case-fold-search t)

(provide 'ots-helm)
;;; ots-helm.el ends here
