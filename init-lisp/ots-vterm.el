;;; -*- coding: utf-8 -*-
;;; ots-vterm.el

(require 'vterm)

(defun ots-vterm-set-properties ()
  (local-set-key (kbd "C-S-c") 'vterm-copy-mode)
  (local-set-key (kbd "C-S-v") 'vterm-yank)
  (define-key vterm-copy-mode-map (kbd "<return>") 'vterm-copy-mode-done)
  (define-key vterm-copy-mode-map (kbd "<kp-enter>") 'vterm-copy-mode-done)
  (setq vterm-max-scrollback 10000))

(add-hook 'vterm-mode-hook 'ots-vterm-set-properties)

(provide 'ots-vterm)
;;; ots-vterm.el ends here
