;;; -*- coding: utf-8 -*-
;;; ots-python-mode.el

(defun ots-python-mode-jedi ()
  "Set auto-completion via jedi."
  ;; sudo pip3 install -U python-language-server
  ;; https://github.com/palantir/python-language-server
  (require 'anaconda-mode)
  (require 'lsp-mode)
  (require 'lsp-clients)
  (require 'company-dict)
  (require 'company-lsp)
  (setq-local lsp-auto-configure nil)
  (setq-local lsp-auto-guess-root t)
  (setq-local lsp-eldoc-hook '())
  (setq-local lsp-eldoc-render-all nil)
  (anaconda-mode)
  (anaconda-eldoc-mode)
  (lsp)
  (setq-local company-backends
   '((company-anaconda)
     (company-lsp)
     (company-keywords company-dict company-dabbrev-code)
     (company-dabbrev))))

(defun ots-python-mode-send-region ()
  "Run the current line or region in the Python shell."
  (interactive)
  (when (not (get-buffer "*Python*"))
    (run-python "python3 -i" nil t)
    (sleep-for 1))
  (let* ((start (if (use-region-p) (region-beginning) (line-beginning-position)))
         (end (if (use-region-p) (region-end) (line-end-position)))
         (text (buffer-substring start end))
         (lines (split-string text "\n")))
    (python-shell-switch-to-shell)
    (goto-char (point-max))
    (dolist (line lines)
      (if (> (length line) 0)
          (ots-util-comint-send line)))))

(defun ots-python-mode-set-default-directory ()
  "Set the default directory to the source tree root."
  ;; We need to have the current package at the beginning of PYTHONPATH,
  ;; which is easiest done by changing the working directory.
  (while (file-exists-p (concat default-directory "__init__.py"))
    (cd "..")))

(defun ots-python-mode-set-docsets ()
  "Load helm-dash docsets based on buffer contents."
  (setq-local helm-dash-docsets '("Python"))
  (ots-util-add-docset "\\(from\\|import\\) django" "Django")
  (ots-util-add-docset "\\(from\\|import\\) flask" "Flask")
  (ots-util-add-docset "\\(from\\|import\\) gi.repository" "GDK")
  (ots-util-add-docset "\\(from\\|import\\) gi.repository" "Gio")
  (ots-util-add-docset "\\(from\\|import\\) gi.repository" "GLib")
  (ots-util-add-docset "\\(from\\|import\\) gi.repository" "GObject")
  (ots-util-add-docset "\\(from\\|import\\) gi.repository" "GTK+")
  (ots-util-add-docset "\\(from\\|import\\) gi.repository" "Pango")
  (ots-util-add-docset "\\(from\\|import\\) numpy" "NumPy")
  (ots-util-add-docset "\\(from\\|import\\) pandas" "Pandas")
  (ots-util-add-docset "\\(from\\|import\\) requests" "Requests")
  (ots-util-add-docset "\\(from\\|import\\) scipy" "SciPy"))

(defun ots-python-mode-set-faces ()
  "Set faces for editing Python files."
  ;; Only color special variables via font-lock-preprocessor-face.
  (face-remap-add-relative 'font-lock-preprocessor-face :foreground (face-foreground 'font-lock-variable-name-face))
  (face-remap-add-relative 'font-lock-variable-name-face :foreground nil)
  (font-lock-add-keywords
   nil '(("\\(=\\)" 1 font-lock-keyword-face)
         ("\\<\\([0-9.]+\\)\\>" 1 font-lock-constant-face)
         ("\\<\\(cls\\|self\\)\\>" 1 font-lock-preprocessor-face)
         ("\\<\\([A-Z0-9_]+\\)\\> += " 1 font-lock-preprocessor-face))))

(defun ots-python-mode-set-keys ()
  "Set keybindings for editing Python files."
  (local-set-key (kbd "C-S-o") 'ots-util-find-unit-test-file)
  (local-set-key (kbd "<backspace>") 'python-indent-dedent-line-backspace)
  (ots-util-bind-key-compile (kbd "<f5>") "python3 -u %s")
  (ots-util-bind-key-compile (kbd "<S-f5>") "python3 -ui %s")
  (local-set-key (kbd "<f6>") 'ots-python-mode-send-region)
  (ots-util-bind-key-compile (kbd "<f8>") "flake8 %s")
  (ots-util-bind-key-compile (kbd "<f9>") "py.test -xs %t")
  (ots-util-bind-key-compile (kbd "<f10>") "nosetests-run -xs %t"))

(defun ots-python-mode-set-properties ()
  "Set properties for editing Python files."
  (setq-local fill-column 79)
  (setq-local python-indent-offset 4)
  (setq-local python-shell-completion-native nil)
  (setq-local python-shell-completion-native-disabled-interpreters '("python3"))
  (setq-local python-shell-interpreter "python3"))

(add-hook 'python-mode-hook 'ots-python-mode-jedi t)
(add-hook 'python-mode-hook 'ots-python-mode-set-default-directory)
(add-hook 'python-mode-hook 'ots-python-mode-set-docsets t)
(add-hook 'python-mode-hook 'ots-python-mode-set-faces)
(add-hook 'python-mode-hook 'ots-python-mode-set-keys)
(add-hook 'python-mode-hook 'ots-python-mode-set-properties)

(add-to-list 'interpreter-mode-alist '("python2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))
(modify-coding-system-alist 'file "\\.py\\'" 'utf-8)

(provide 'ots-python-mode)
;;; ots-python-mode.el ends here
