;;; -*- coding: utf-8 -*-
;;; ots-qml-mode.el

(autoload 'ots-qml-mode "qml" "Edit QML files." t)
(let ((modes '(("\\.qml$" . ots-qml-mode))))
  (setq auto-mode-alist (append modes auto-mode-alist)))

(define-derived-mode ots-qml-mode js-mode "QML"
  "Mode for editing QML files."
  (setq major-mode 'ots-qml-mode mode-name "QML")
  (run-hooks 'ots-qml-mode-hook))

(defun ots-qml-mode-set-faces ()
  "Set faces for editing QML files."
  (font-lock-add-keywords
   nil
   '(;; Keywords
     ("\\<\\(as\\|break\\|case\\|catch\\|continue\\|default\\|delete\\|do\\|else\\|finally\\|for\\|function\\|if\\|import\\|in\\|instanceof\\|new\\|parent\\|property\\|switch\\|throw\\|try\\|typeof\\|void\\|while\\|with\\)\\>"
      1 font-lock-keyword-face)
     (" \\([:?]\\) "
      1 font-lock-keyword-face)
     ;; Types
     ("\\<\\(alias\\|bool\\|double\\|int\\|real\\|string\\|var\\)\\>"
      1 font-lock-type-face)
     ;; Strings
     ("\\<\\([0-9.]+\\)\\>"
      1 font-lock-string-face)
     ("\\<\\(false\\|null\\|this\\|true\\|undefined\\)\\>"
      1 font-lock-constant-face)
     ;; Functions
     ("\\<\\([A-Z][a-zA-Z0-9_]+\\)\\> +{"
      1 font-lock-function-name-face)
     ("\\<function +\\([a-zA-Z0-9_]*\\)\\>"
      1 font-lock-function-name-face)
     ;; Built-ins
     ("\\<\\(console.log\\|debugger\\|return\\)\\>"
      1 font-lock-builtin-face)
     ;; Variables
     ("\\<\\([a-zA-Z0-9_.]+\\):"
      1 font-lock-variable-name-face)
     ("\\<var +\\([a-zA-Z0-9_.]+\\)\\>"
      1 font-lock-variable-name-face)
     )))

(defun ots-qml-mode-set-properties ()
  "Set properties for editing QML files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (setq fill-column 100)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("JavaScript" "QML" "Silica"))
  (turn-on-auto-fill)
  (hs-minor-mode 1))

(add-hook 'ots-qml-mode-hook 'ots-qml-mode-set-faces)
(add-hook 'ots-qml-mode-hook 'ots-qml-mode-set-properties)

(provide 'ots-qml-mode)
;;; ots-qml-mode.el ends here
