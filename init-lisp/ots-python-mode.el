;;; -*- coding: utf-8 -*-
;;; ots-python-mode.el

(require 's)

(defvar ots-python-quote-char ""
  "The default quote character to use.")

(defun ots-python-mode-insert-dict-key ()
  "Insert a dict key at point."
  (interactive)
  (when (string= ots-python-quote-char "")
    (ots-python-mode-update-quote-char))
  (insert "[")
  (insert ots-python-quote-char)
  (insert ots-python-quote-char)
  (insert "]")
  (backward-char 2))

(defun ots-python-mode-jedi ()
  "Set auto-completion via jedi."
  (require 'company-dict)
  ;; sudo pip3 install -U python-language-server
  ;; https://github.com/palantir/python-language-server
  (require 'company-lsp)
  (require 'lsp-clients)
  (require 'lsp-mode)
  (setq-local company-lsp-cache-candidates nil)
  (setq-local company-lsp-enable-snippet nil)
  (setq-local lsp-auto-configure nil)
  (setq-local lsp-auto-guess-root t)
  (setq-local lsp-eldoc-render-all nil)
  (setq-local lsp-enable-completion-at-point t)
  (setq-local lsp-enable-snippet nil)
  (setq-local lsp-signature-render-all nil)
  (lsp)
  ;; (require 'anaconda-mode)
  ;; (require 'company-anaconda)
  ;; (setq-local anaconda-mode-eldoc-as-single-line t)
  ;; (setq-local company-anaconda-case-insensitive nil)
  ;; (anaconda-mode)
  ;; (anaconda-eldoc-mode)
  (setq-local company-backends '((company-lsp
                                  :separate
                                  company-keywords
                                  company-dict
                                  company-dabbrev-code
                                  company-dabbrev))))

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
  "Load helm-dash docsets based on buffer contents."
  (setq-local dash-docs-docsets '("Python"))
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
  (local-set-key (kbd "C-ö") 'ots-python-mode-insert-dict-key)
  (local-set-key (kbd "<backspace>") 'python-indent-dedent-line-backspace)
  (ots-util-bind-key-compile (kbd "<f5>") "python3 -u %s")
  (ots-util-bind-key-compile (kbd "<S-f5>") "python3 -ui %s")
  (local-set-key (kbd "<f6>") 'ots-python-mode-send-region)
  (ots-util-bind-key-compile (kbd "<f8>") "flake8 %s")
  (ots-util-bind-key-compile (kbd "<f9>") "py.test -xs %t")
  (ots-util-bind-key-compile (kbd "<f10>") "nosetests-run -xs %t")
  (local-set-key (kbd "<M-left>") 'xref-pop-marker-stack)
  (local-set-key (kbd "<M-right>") 'lsp-find-definition))

(defun ots-python-mode-set-properties ()
  "Set properties for editing Python files."
  (setq-local fill-column 79)
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
