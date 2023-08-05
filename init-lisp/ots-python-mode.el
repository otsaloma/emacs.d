;;; -*- coding: utf-8 -*-
;;; ots-python-mode.el

(require 's)

(defvar ots-python-quote-char ""
  "The default quote character to use.")

(defun ots-python-mode-flake8 ()
  "Run flake8 with either project or general configuration."
  (interactive)
  (let* ((has-config (ots-util-file-above-in-tree default-directory ".flake8"))
         (fallback (expand-file-name "~/.config/flake8"))
         (command (if has-config "flake8 %s" (format "flake8 --config=%s %%s" fallback))))
    (compile (ots-util-expand-command command) t)))

(defun ots-python-mode-insert-dict-key ()
  "Insert a string dict key at point."
  (interactive)
  (when (string= ots-python-quote-char "")
    (ots-python-mode-update-quote-char))
  (insert "[")
  (insert ots-python-quote-char)
  (insert ots-python-quote-char)
  (insert "]")
  (backward-char 2))

(defun ots-python-mode-send-region ()
  "Run the current line or region in the Python shell."
  (interactive)
  (when (get-buffer "*compilation*")
    (let* ((start (if (use-region-p) (region-beginning) (line-beginning-position)))
           (end (if (use-region-p) (region-end) (line-end-position)))
           (text (buffer-substring start end))
           (lines (split-string text "\n")))
      (switch-to-buffer "*compilation*")
      (goto-char (point-max))
      (when (looking-back "^>>> *")
        (dolist (line lines)
          (if (> (length line) 0)
              (ots-util-comint-send line))))
      (switch-to-buffer nil))))

(defun ots-python-mode-set-default-directory ()
  "Set the default directory to the source tree root."
  ;; We need to have the current package at the beginning of PYTHONPATH,
  ;; which is easiest done by changing the working directory.
  (while (file-exists-p (concat default-directory "__init__.py"))
    (cd "..")))

(defun ots-python-mode-set-docsets ()
  "Load dash docsets based on buffer contents."
  (setq-local dash-docs-docsets '("Python"))
  (ots-util-add-docset "\\(from\\|import\\) dataiter" "Dataiter")
  (ots-util-add-docset "\\(from\\|import\\) django" "Django")
  (ots-util-add-docset "\\(from\\|import\\) flask" "Flask")
  (ots-util-add-docset "\\(from\\|import\\) numpy" "NumPy")
  (ots-util-add-docset "\\(from\\|import\\) pandas" "Pandas")
  (ots-util-add-docset "\\(from\\|import\\) peewee" "Peewee")
  (ots-util-add-docset "\\(from\\|import\\) requests" "Requests")
  (ots-util-add-docset "\\(from\\|import\\) sklearn" "Scikit-Learn")
  (if (string= (getenv "GTK_VERSION") "4")
      (ots-util-add-docset "\\(from\\|import\\) gi.repository" "GTK4")
    (ots-util-add-docset "\\(from\\|import\\) gi.repository" "PyGObject")))

(defun ots-python-mode-set-eglot ()
  "Set autocompletion etc. via eglot and a language server."
  ;; https://github.com/pappasam/jedi-language-server (better)
  ;; https://github.com/python-lsp/python-lsp-server
  (require 'company-dict)
  (require 'eglot)
  (eglot-ensure)
  (local-set-key (kbd "<M-left>") 'xref-pop-marker-stack)
  (local-set-key (kbd "<M-right>") 'xref-find-definitions)
  (setq-local eglot-ignored-server-capabilities '(:colorProvider
                                                  :documentHighlightProvider
                                                  :documentLinkProvider
                                                  :hoverProvider))

  (setq-local eglot-stay-out-of '(flymake))
  (setq-local company-backends '((company-capf
                                  :separate
                                  company-keywords
                                  company-dict
                                  company-dabbrev-code
                                  company-dabbrev))))

(defun ots-python-mode-set-flycheck ()
  "Set flycheck's flake8 to either project or general configuration."
  (if (not (ots-util-file-above-in-tree default-directory ".flake8"))
      (setq flycheck-flake8rc "~/.config/flake8")))

(defun ots-python-mode-set-keys ()
  "Set keybindings for editing Python files."
  (local-set-key (kbd "C-S-o") 'ots-util-find-unit-test-file)
  (local-set-key (kbd "C-ö") 'ots-python-mode-insert-dict-key)
  (local-set-key (kbd "<backspace>") 'python-indent-dedent-line-backspace)
  (ots-util-bind-key-compile (kbd "<f5>") "python3 -u %s")
  (ots-util-bind-key-compile (kbd "<S-f5>") "python3 -ui %s")
  (local-set-key (kbd "<f6>") 'ots-python-mode-send-region)
  (local-set-key (kbd "<f8>") 'ots-python-mode-flake8)
  (ots-util-bind-key-compile (kbd "<f9>") "py.test -xs %t")
  (ots-util-bind-key-compile (kbd "<f10>") "nosetests-run -xs %t"))

(defun ots-python-mode-set-properties ()
  "Set properties for editing Python files."
  (setq-local fill-column 79)
  (setq-local imenu-create-index-function #'python-imenu-create-flat-index)
  ;; Some of these are ignore by python-ts-mode.
  (setq-local python-fill-docstring-style 'django)
  (setq-local python-indent-offset 4)
  (setq-local python-shell-completion-native nil)
  (setq-local python-shell-completion-native-disabled-interpreters '("python3"))
  (setq-local python-shell-interpreter "python3"))

(defun ots-python-mode-update-quote-char ()
  "Update value of the default quote character to use."
  (if (> (s-count-matches "'" (buffer-string))
         (s-count-matches "\"" (buffer-string)))
      (setq ots-python-quote-char "'")
    (setq ots-python-quote-char "\"")))

(add-hook 'after-save-hook 'ots-python-mode-set-docsets t)
(add-hook 'after-save-hook 'ots-python-mode-update-quote-char t)
(add-hook 'python-base-mode-hook 'ots-python-mode-set-default-directory)
(add-hook 'python-base-mode-hook 'ots-python-mode-set-docsets t)
(add-hook 'python-base-mode-hook 'ots-python-mode-set-eglot t)
(add-hook 'python-base-mode-hook 'ots-python-mode-set-flycheck)
(add-hook 'python-base-mode-hook 'ots-python-mode-set-keys)
(add-hook 'python-base-mode-hook 'ots-python-mode-set-properties)
(add-to-list 'interpreter-mode-alist '("python2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))
(modify-coding-system-alist 'file "\\.py\\'" 'utf-8)

(setq-default
 eglot-workspace-configuration
 ;; https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
 '((pylsp (plugins (flake8      (enabled . :json-false))
                   (mccabe      (enabled . :json-false))
                   (pycodestyle (enabled . :json-false))
                   (pydocstyle  (enabled . :json-false))
                   (pyflakes    (enabled . :json-false))
                   (pylint      (enabled . :json-false))
                   (yapf        (enabled . :json-false))))))

(provide 'ots-python-mode)
;;; ots-python-mode.el ends here
