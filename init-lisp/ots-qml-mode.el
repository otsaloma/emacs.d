;;; -*- coding: utf-8 -*-
;;; ots-qml-mode.el

(define-derived-mode ots-qml-mode js-mode "QML"
  "Mode for editing QML files."
  (setq major-mode 'ots-qml-mode mode-name "QML")
  (run-hooks 'ots-qml-mode-hook))

(defun ots-qml-mode-set-faces ()
  "Set faces for editing QML files."
  (font-lock-add-keywords
   nil '(("\\<\\(console.log\\|debugger\\|return\\)\\>"
          1 font-lock-builtin-face)
         ("\\<\\(false\\|null\\|this\\|true\\|undefined\\)\\>"
          1 font-lock-constant-face)
         ("\\<\\([0-9.]+\\)\\>"
          1 font-lock-constant-face)
         ("\\<\\([A-Z][a-zA-Z0-9_]+\\)\\> +{"
          1 font-lock-function-name-face)
         ("\\<function +\\([a-zA-Z0-9_]*\\)\\>"
          1 font-lock-function-name-face)
         ("\\<\\(as\\|break\\|case\\|catch\\|continue\\|default\\|delete\\|do\\|else\\|finally\\|for\\|function\\|if\\|import\\|in\\|instanceof\\|new\\|parent\\|property\\|signal\\|switch\\|throw\\|try\\|typeof\\|void\\|while\\|with\\)\\>"
          1 font-lock-keyword-face)
         (" \\([:?]\\) "
          1 font-lock-keyword-face)
         ("\\<\\(alias\\|bool\\|double\\|int\\|real\\|string\\|var\\)\\>"
          1 font-lock-type-face)
         ("\\<\\([a-zA-Z0-9_.]+\\):"
          1 font-lock-variable-name-face)
         ("\\<signal +\\([a-zA-Z0-9_.]+\\)\\>"
          1 font-lock-variable-name-face)
         ("\\<var +\\([a-zA-Z0-9_.]+\\)\\>"
          1 font-lock-variable-name-face))))

(defun ots-qml-mode-set-properties ()
  "Set properties for editing QML files."
  (require 'company-dict)
  (ots-util-add-imenu-expressions
   '((nil "^ +\\([^: ]+\\): +{" 1)
     (nil "^ +function +\\([^( ]+\\)(" 1)))
  (setq-local company-backends
   '((company-dict company-dabbrev)))
  (setq-local fill-column 100)
  (setq-local helm-dash-docsets '("JavaScript" "Silica" "QML")))

(autoload 'ots-qml-mode "qml" "QML" t)
(add-hook 'ots-qml-mode-hook 'ots-qml-mode-set-faces)
(add-hook 'ots-qml-mode-hook 'ots-qml-mode-set-properties)
(add-to-list 'auto-mode-alist '("\\.qml\\'" . ots-qml-mode))
(modify-coding-system-alist 'file "\\.qml\\'" 'utf-8)

(provide 'ots-qml-mode)
;;; ots-qml-mode.el ends here
