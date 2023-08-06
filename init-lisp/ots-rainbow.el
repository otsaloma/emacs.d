;;; -*- coding: utf-8 -*-
;;; ots-rainbow.el

(defvar ots-rainbow-modes
  '(conf-mode css-mode emacs-lisp-mode ess-r-mode
    inferior-ess-r-mode json-mode latex-mode)
  "Modes in which to color color strings.")

(defun ots-rainbow-enable-maybe ()
  "Enable rainbow-mode to color color strings."
  ;; Skip submodes where buffer-file-name is nil.
  (if (and (buffer-file-name)
           (member major-mode ots-rainbow-modes))
      (rainbow-mode)))

(use-package rainbow-mode
  :config (add-hook 'after-change-major-mode-hook
                    'ots-rainbow-enable-maybe))

(provide 'ots-rainbow)
;;; ots-rainbow.el ends here
