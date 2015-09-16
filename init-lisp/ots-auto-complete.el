;;; -*- coding: utf-8 -*-
;;; ots-auto-complete.el

(require 'auto-complete-config)
(ac-config-default)
(require 'ots-util)

(defvar ots-auto-complete-modes-more
  '(bibtex-mode
    c-mode
    conf-mode
    css-mode
    dos-mode
    emacs-lisp-mode
    ess-mode
    html-mode
    java-mode
    js-mode
    latex-mode
    makefile-mode
    ots-moinmoin-mode
    ots-qml-mode
    perl-mode
    php-mode
    po-mode
    python-mode
    sgml-xml-mode
    sh-mode
    text-mode
    )
  "Additional modes to use auto-complete with.")

(defun ots-auto-complete-mode-set-sources ()
  "Set sources to use with auto-complete mode."
  ;; ac-source-filename can be insanely slow on network drives.
  (setq ac-sources (remq 'ac-source-filename ac-sources)))

(add-hook 'auto-complete-mode-hook 'ots-auto-complete-mode-set-sources t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(define-key ac-complete-mode-map (kbd "<return>") nil)
(define-key ac-complete-mode-map (kbd "<tab>") 'ac-complete)
(setq ac-auto-show-menu 0)
(setq ac-auto-start 2)
(setq ac-candidate-limit nil)
(setq ac-delay 0)
(setq ac-disable-faces nil)
(setq ac-ignore-case nil)
(setq ac-menu-height 8)
(setq ac-modes (append ac-modes ots-auto-complete-modes-more))
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 30)
(setq ac-quick-help-prefer-pos-tip nil)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-use-dictionary-as-stop-words nil)
(setq ac-use-quick-help t)

(global-auto-complete-mode t)

(provide 'ots-auto-complete)
;;; ots-auto-complete.el ends here
