;;; -*- coding: utf-8 -*-
;;; ots-auto-complete.el

(require 'ots-normal)

(defun ots-auto-complete-enable-maybe ()
  "Enable auto-complete if in a normal mode."
  (let ((use-ac nil))
    (dolist (mode ots-normal-modes)
      (if (derived-mode-p mode)
          (setq use-ac t)))
    (when use-ac
      ;; ac-source-filename can be insanely slow on network drives.
      (setq ac-sources (remq 'ac-source-filename ac-sources))
      (add-to-list 'ac-modes 'major-mode)
      (auto-complete-mode 1))))

(ac-config-default)
(add-hook 'after-change-major-mode-hook 'ots-auto-complete-enable-maybe t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(define-key ac-complete-mode-map (kbd "<return>") nil)
(define-key ac-complete-mode-map (kbd "<tab>") 'ac-complete)

(setq ac-auto-show-menu 1)
(setq ac-auto-start 2)
(setq ac-candidate-limit 8)
(setq ac-comphist-file "/dev/null")
(setq ac-delay 0.01)
(setq ac-disable-faces nil)
(setq ac-ignore-case nil)
(setq ac-menu-height 8)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 30)
(setq ac-quick-help-prefer-pos-tip nil)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-use-dictionary-as-stop-words nil)
(setq ac-use-quick-help t)

(provide 'ots-auto-complete)
;;; ots-auto-complete.el ends here
