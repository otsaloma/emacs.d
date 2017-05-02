;;; -*- coding: utf-8 -*-
;;; ots-python-mode.el

(require 'ots-comint-mode)
(require 'ots-util)

(setenv "PYTHONPATH" ".")

(add-to-list 'interpreter-mode-alist '("python2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))

(defun ots-python-mode-anaconda ()
  "Start anaconda-mode and it's completion via company-mode."
  (when (eq system-type 'windows-nt)
    (setq python-shell-interpreter "C:/Python33/python.exe"))
  (anaconda-mode)
  (anaconda-eldoc-mode)
  (setq-local company-backends
   '((company-anaconda company-keywords company-dabbrev-code)
     (company-dabbrev))))

(defun ots-python-mode-nosetests-run ()
  "Run interactive unit tests with nosetests for the current buffer."
  (interactive)
  (let ((file-name (ots-util-unit-test-argument)))
    (compile (format "nosetests-run -xs %s" file-name))))

(defun ots-python-mode-py-test ()
  "Run unit tests with py.test for the current buffer."
  (interactive)
  (let ((file-name (ots-util-unit-test-argument)))
    (compile (format "py.test -xs %s" file-name))))

(defun ots-python-mode-pyflakes ()
  "Check the current buffer with pyflakes."
  (interactive)
  (compile (ots-util-expand-command "pyflakes %s")))

(defun ots-python-mode-run ()
  "Run the current buffer with Python."
  (interactive)
  (compile (ots-util-expand-command "python3 -u %s")))

(defun ots-python-mode-run-in-shell ()
  "Run the current file in the Python shell."
  (interactive)
  (when (not (get-buffer "*Python*"))
    (run-python "python3 -i" nil t)
    (sleep-for 1))
  (let ((directory (expand-file-name default-directory))
        (file-name (file-relative-name (buffer-file-name))))
    (python-shell-switch-to-shell)
    (goto-char (point-max))
    (ots-util-comint-send "os.chdir('%s')" directory)
    (ots-util-comint-send "run('%s')" file-name)))

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
  "Load helm-dash docsets based on buffer imports."
  (let ((docsets '("Python"))
        (text (buffer-substring (point-min) (min (point-max) 8000))))
    (when (string-match-p "gi.repository" text)
      (dolist (docset '("GDK" "Gio" "GLib" "GObject" "GTK+" "Pango"))
        (add-to-list 'docsets docset)))
    (when (string-match-p "import flask" text)
      (add-to-list 'docsets "Flask"))
    (when (string-match-p "import numpy" text)
      (add-to-list 'docsets "NumPy"))
    (when (string-match-p "import pandas" text)
      (add-to-list 'docsets "Pandas"))
    (when (string-match-p "import requests" text)
      (add-to-list 'docsets "Requests"))
    (setq-local helm-dash-docsets docsets)))

(defun ots-python-mode-set-faces ()
  "Set faces for editing Python files."
  (font-lock-add-keywords
   nil '(("\\(=\\)" 1 font-lock-keyword-face)
         ("\\<\\([0-9.]+\\)\\>" 1 font-lock-constant-face)
         ("\\<\\(self\\)\\>" 1 font-lock-variable-name-face))))

(defun ots-python-mode-set-keys ()
  "Set keybindings for editing Python files."
  (local-set-key (kbd "C-S-o") 'ots-util-find-unit-test-file)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f6>") 'ots-python-mode-run)
  (local-set-key (kbd "<S-f6>") 'ots-python-mode-start)
  (local-set-key (kbd "<f8>") 'ots-python-mode-run-in-shell)
  (local-set-key (kbd "<S-f8>") 'ots-python-mode-send-region)
  (local-set-key (kbd "<f9>") 'ots-python-mode-pyflakes)
  (local-set-key (kbd "<S-f9>") 'ots-python-mode-py-test)
  (local-set-key (kbd "<C-S-f9>") 'ots-python-mode-nosetests-run))

(defun ots-python-mode-set-properties ()
  "Set properties for editing Python files."
  (hs-minor-mode 1)
  (modify-syntax-entry ?_ "w")
  (setq fill-column 79)
  (setq indent-tabs-mode nil)
  (setq python-shell-completion-native nil)
  (setq python-shell-completion-native-disabled-interpreters '("python3"))
  (setq python-shell-interpreter "python3")
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

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
(modify-coding-system-alist 'file "\\.py\\'" 'utf-8)

(provide 'ots-python-mode)
;;; ots-python-mode.el ends here
