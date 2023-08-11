;;; -*- coding: utf-8 -*-
;;; ots-conf.el

(defun ots-conf-set-properties ()
  "Set properties for editing configuration files."
  (conf-quote-normal nil)
  (setq-local fill-column 72)
  (when (string-match-p "\\.git" (buffer-file-name))
    (setq-local indent-tabs-mode t)
    (setq-local tab-width 2)))

(use-package conf-mode
  :mode (("\\.flake8\\'"            . conf-mode)
         ("\\.git/config\\'"        . conf-mode)
         ("\\.gitconfig\\'"         . conf-mode)
         ("\\.gitmodules\\'"        . conf-mode)
         ("\\.theme\\'"             . conf-mode)
         ("\\.thumbnailer\\'"       . conf-mode)
         ("requirements.*\\.txt\\'" . conf-mode))

  :config
  (add-hook 'conf-mode-hook 'ots-conf-set-properties))

(provide 'ots-conf)
;;; ots-conf.el ends here
