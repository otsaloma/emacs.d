;;; -*- coding: utf-8 -*-
;;; ots-conf-mode.el

(defun ots-conf-mode-set-properties ()
  "Set properties for editing configuration files."
  (conf-quote-normal nil)
  (setq-local fill-column 72)
  (when (string-match-p "\\.git" (buffer-file-name))
    (setq-local indent-tabs-mode t)
    (setq-local tab-width 2)))

(add-hook 'conf-mode-hook 'ots-conf-mode-set-properties)
(add-to-list 'auto-mode-alist '("\\.flake8\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.git/config\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.gitmodules\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.theme\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.thumbnailer\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("requirements.*\\.txt\\'" . conf-mode))

(provide 'ots-conf-mode)
;;; ots-conf-mode.el ends here
