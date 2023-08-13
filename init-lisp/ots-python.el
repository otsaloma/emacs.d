;;; -*- coding: utf-8 -*-
;;; ots-python.el

(defvar ots-python-quote-char ""
  "The default quote character to use.")

(defun ots-python-flake8 ()
  "Run flake8 with either project or general configuration."
  (interactive)
  (let* ((has-config (ots-util-file-above default-directory ".flake8"))
         (fallback (expand-file-name "~/.config/flake8"))
         (command (if has-config
                      "flake8 %s"
                    (format "flake8 --config=%s %%s" fallback))))
    (compile (ots-util-expand-command command) t)))

(defun ots-python-insert-dict-key ()
  "Insert a string dict key at point."
  (interactive)
  (when (string= ots-python-quote-char "")
    (ots-python-update-quote-char))
  (insert "[")
  (insert ots-python-quote-char)
  (insert ots-python-quote-char)
  (insert "]")
  (backward-char 2))

(defun ots-python-send-region ()
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

(defun ots-python-set-default-directory ()
  "Set the default directory to the source tree root."
  ;; XXX: This confuses git-gutter.
  ;; We need to have the current package at the beginning of PYTHONPATH,
  ;; which is easiest done by changing the working directory.
  ;; (while (file-exists-p (concat default-directory "__init__.py"))
  ;;   (cd ".."))
  )

(defun ots-python-set-docsets ()
  "Load dash docsets based on buffer contents."
  (ots-util-add-docset "." "Python")
  (ots-util-add-docset "\\(from\\|import\\) dataiter" "Dataiter")
  (ots-util-add-docset "\\(from\\|import\\) django" "Django")
  (ots-util-add-docset "\\(from\\|import\\) flask" "Flask")
  (ots-util-add-docset "\\(from\\|import\\) numpy" "NumPy")
  (ots-util-add-docset "\\(from\\|import\\) pandas" "Pandas")
  (ots-util-add-docset "\\(from\\|import\\) peewee" "Peewee")
  (ots-util-add-docset "\\(from\\|import\\) requests" "Requests")
  (ots-util-add-docset "\\(from\\|import\\) sklearn" "Scikit-Learn")
  (let ((gtk3 (ots-util-file-above default-directory ".gtk3"))
        (gtk4 (ots-util-file-above default-directory ".gtk4")))
    (if gtk3 (ots-util-add-docset "\\(from\\|import\\) gi.repository" "PyGObject"))
    (if gtk4 (ots-util-add-docset "\\(from\\|import\\) gi.repository" "GTK4"))))

(defun ots-python-set-eglot ()
  "Set autocompletion etc. via eglot and a language server."
  ;; https://github.com/pappasam/jedi-language-server
  (eglot-ensure)
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

(defun ots-python-set-flycheck ()
  "Set flake8 linting via flycheck."
  (if (not (ots-util-file-above default-directory ".flake8"))
      (setq flycheck-flake8rc "~/.config/flake8"))
  (flycheck-mode 1))

(defun ots-python-set-keys ()
  "Set keybindings for editing Python files."
  (local-set-key (kbd "C-S-o") 'ots-util-find-unit-test-file)
  (local-set-key (kbd "C-ö") 'ots-python-insert-dict-key)
  (local-set-key (kbd "<backspace>") 'python-indent-dedent-line-backspace)
  (ots-util-bind-key-compile (kbd "<f5>") "python3 -u %s")
  (ots-util-bind-key-compile (kbd "<S-f5>") "python3 -ui %s")
  (local-set-key (kbd "<f6>") 'ots-python-send-region)
  (local-set-key (kbd "<f8>") 'ots-python-flake8)
  (ots-util-bind-key-compile (kbd "<f9>") "py.test -xs %t")
  (ots-util-bind-key-compile (kbd "<f10>") "nosetests-run -xs %t"))

(defun ots-python-set-properties ()
  "Set properties for editing Python files."
  (add-hook 'after-save-hook 'ots-python-set-docsets t t)
  (add-hook 'after-save-hook 'ots-python-update-quote-char t t)
  (setq-local fill-column 79)
  (setq-local imenu-create-index-function #'python-imenu-create-flat-index)
  ;; XXX: These are probably not used at all by python-ts-mode.
  (setq-local python-fill-docstring-style 'django)
  (setq-local python-indent-offset 4)
  (setq-local python-shell-completion-native nil)
  (setq-local python-shell-completion-native-disabled-interpreters '("python3"))
  (setq-local python-shell-interpreter "python3"))

(defun ots-python-update-quote-char ()
  "Update value of the default quote character to use."
  (require 's)
  (if (> (s-count-matches "'" (buffer-string))
         (s-count-matches "\"" (buffer-string)))
      (setq ots-python-quote-char "'")
    (setq ots-python-quote-char "\"")))

(use-package python
  :defer t
  :config
  (add-hook 'python-base-mode-hook 'ots-python-set-default-directory)
  (add-hook 'python-base-mode-hook 'ots-python-set-docsets t)
  (add-hook 'python-base-mode-hook 'ots-python-set-eglot t)
  (add-hook 'python-base-mode-hook 'ots-python-set-flycheck)
  (add-hook 'python-base-mode-hook 'ots-python-set-keys)
  (add-hook 'python-base-mode-hook 'ots-python-set-properties))

(provide 'ots-python)
;;; ots-python.el ends here
