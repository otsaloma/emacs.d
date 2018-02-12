;;; -*- coding: utf-8 -*-
;;; ots-python-mode.el

(defun ots-python-mode-anaconda ()
  "Start anaconda-mode and it's completion via company-mode."
  (require 'company-dict)
  (require 'ots-python-completion)
  (when (eq system-type 'windows-nt)
    (setq python-shell-interpreter "C:/Python33/python.exe"))
  (anaconda-mode)
  (anaconda-eldoc-mode)
  (setq-local company-backends
   '((company-anaconda :with company-anaconda-dabbrev company-anaconda-dict)
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
  (ots-util-add-docset "gi.repository"  "GDK")
  (ots-util-add-docset "gi.repository"  "Gio")
  (ots-util-add-docset "gi.repository"  "GLib")
  (ots-util-add-docset "gi.repository"  "GObject")
  (ots-util-add-docset "gi.repository"  "GTK+")
  (ots-util-add-docset "gi.repository"  "Pango")
  (ots-util-add-docset "\\<flask\\>"    "Flask")
  (ots-util-add-docset "\\<numpy\\>"    "NumPy")
  (ots-util-add-docset "\\<pandas\\>"   "Pandas")
  (ots-util-add-docset "\\<requests\\>" "Requests"))

(defun ots-python-mode-set-faces ()
  "Set faces for editing Python files."
  (font-lock-add-keywords
   nil '(("\\(=\\)" 1 font-lock-keyword-face)
         ("\\<\\([0-9.]+\\)\\>" 1 font-lock-constant-face)
         ("\\<\\(self\\)\\>" 1 font-lock-variable-name-face))))

(defun ots-python-mode-set-keys ()
  "Set keybindings for editing Python files."
  (local-set-key (kbd "C-S-o") 'ots-util-find-unit-test-file)
  (local-set-key (kbd "<backspace>") 'python-indent-dedent-line-backspace)
  (ots-util-bind-key-compile (kbd "<f6>") "python3 -u %s")
  (local-set-key (kbd "<S-f6>") 'ots-python-mode-start)
  (ots-util-bind-key-compile (kbd "<f9>") "pyflakes %s")
  (ots-util-bind-key-compile (kbd "<S-f9>") "py.test -xs %t")
  (ots-util-bind-key-compile (kbd "<C-S-f9>") "nosetests-run -xs %t"))

(defun ots-python-mode-set-properties ()
  "Set properties for editing Python files."
  (setq-local fill-column 79)
  (setq-local python-indent-offset 4)
  (setq-local python-shell-completion-native nil)
  (setq-local python-shell-completion-native-disabled-interpreters '("python3"))
  (setq-local python-shell-interpreter "python3"))

(defun ots-python-mode-start ()
  "Start a global, interactive Python shell."
  (interactive)
  (if (not (get-buffer "*Python*"))
      (run-python "python3 -i" nil t))
  (python-shell-switch-to-shell))

(add-hook 'python-mode-hook 'ots-python-mode-anaconda t)
(add-hook 'python-mode-hook 'ots-python-mode-set-default-directory)
(add-hook 'python-mode-hook 'ots-python-mode-set-docsets t)
(add-hook 'python-mode-hook 'ots-python-mode-set-faces)
(add-hook 'python-mode-hook 'ots-python-mode-set-keys)
(add-hook 'python-mode-hook 'ots-python-mode-set-properties)
(add-to-list 'interpreter-mode-alist '("python2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))
(modify-coding-system-alist 'file "\\.py\\'" 'utf-8)
(setenv "PYTHONPATH" ".")

(provide 'ots-python-mode)
;;; ots-python-mode.el ends here
