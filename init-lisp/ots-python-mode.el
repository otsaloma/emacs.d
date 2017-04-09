;;; -*- coding: utf-8 -*-
;;; ots-python-mode.el

(require 'ots-comint-mode)
(require 'ots-util)

(setenv "PYTHONPATH" ".")
(setenv "PYTHONSTARTUP" "")

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
  "Run the current buffer with python."
  (interactive)
  (compile (ots-util-expand-command "python3 -u %s")))

(defun ots-python-mode-set-default-directory ()
  "Set the default directory to the source tree root."
  ;; We need to have the current package at the beginning of PYTHONPATH,
  ;; which is easiest done by changing the working directory.
  (while (file-exists-p (concat default-directory "__init__.py"))
    (cd "..")))

(defun ots-python-mode-set-docsets ()
  "Load helm-dash docsets based on buffer imports."
  (let ((docsets '("Python")))
    (if (ots-util-buffer-contains "gi.repository")
        (nconc docsets '("GDK" "Gio" "GLib" "GObject" "GTK+" "Pango")))
    (if (ots-util-buffer-contains "import flask")
        (nconc docsets '("Flask")))
    (if (ots-util-buffer-contains "import numpy")
        (nconc docsets '("NumPy")))
    (if (ots-util-buffer-contains "import pandas")
        (nconc docsets '("Pandas")))
    (if (ots-util-buffer-contains "import requests")
        (nconc docsets '("Requests")))
    (setq-local helm-dash-docsets docsets)))

(defun ots-python-mode-set-faces ()
  "Set faces for editing Python files."
  (font-lock-add-keywords
   nil '(("\\<\\([0-9.]+\\)\\>" 1 font-lock-constant-face)
         ("\\<\\(self\\)\\>" 1 font-lock-variable-name-face))))

(defun ots-python-mode-set-keys ()
  "Set keybindings for editing Python files."
  (local-set-key (kbd "C-S-o") 'ots-util-find-unit-test-file)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f6>") 'ots-python-mode-run)
  (local-set-key (kbd "<f8>") 'python-shell-send-buffer)
  (local-set-key (kbd "<f9>") 'ots-python-mode-pyflakes)
  (local-set-key (kbd "<S-f9>") 'ots-python-mode-py-test)
  (local-set-key (kbd "<C-S-f9>") 'ots-python-mode-nosetests-run))

(defun ots-python-mode-set-properties ()
  "Set properties for editing Python files."
  (hs-minor-mode 1)
  (modify-syntax-entry ?_ "w")
  (setq fill-column 79)
  (setq indent-tabs-mode nil)
  (setq python-shell-interpreter "python3")
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(defun ots-python-mode-start ()
  "Start or associate a process for the buffer."
  (run-python "python3 -i" nil nil))

(add-hook 'python-mode-hook 'ots-python-mode-set-default-directory)
(add-hook 'python-mode-hook 'ots-python-mode-set-docsets)
(add-hook 'python-mode-hook 'ots-python-mode-set-faces)
(add-hook 'python-mode-hook 'ots-python-mode-set-keys)
(add-hook 'python-mode-hook 'ots-python-mode-set-properties)
(add-hook 'python-mode-hook 'ots-python-mode-anaconda t)
(modify-coding-system-alist 'file "\\.py\\'" 'utf-8)

(provide 'ots-python-mode)
;;; ots-python-mode.el ends here
