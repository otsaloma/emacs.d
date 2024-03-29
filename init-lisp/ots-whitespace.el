;;; -*- coding: utf-8 -*-
;;; ots-whitespace.el

(defun ots-whitespace-enable-maybe ()
  "Turn whitespace-mode on if in a normal buffer."
  (if (derived-mode-p 'conf-mode 'prog-mode 'text-mode)
      (whitespace-mode 1)))

(use-package whitespace
  :defer t
  :init
  (add-hook 'after-change-major-mode-hook 'ots-whitespace-enable-maybe)
  :config
  (setq whitespace-style
        (quote (face tabs indentation space-after-tab
                     space-before-tab tab-mark)))
  ;; Unicode characters in decimal, see M-x insert-char.
  (setq whitespace-display-mappings
        '((space-mark 32 [183] [46]) (tab-mark 9 [62 9]))))

(provide 'ots-whitespace)
;;; ots-whitespace.el ends here
