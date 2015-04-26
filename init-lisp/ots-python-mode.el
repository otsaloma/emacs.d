;;; -*- coding: utf-8 -*-
;;; ots-python-mode.el

(require 'ots-comint-mode)
(require 'ots-util)
(require 'python)

(setenv "PYTHONPATH" ".")
(setenv "PYTHONSTARTUP" "")

(add-to-list 'interpreter-mode-alist '("python2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))

(defun ots-python-mode-find-unit-test-file ()
  "Open the unit test file testing the current buffer."
  (interactive)
  (find-file (ots-python-mode-unit-test-file)))

(defun ots-python-mode-nosetests-run ()
  "Run interactive unit tests with nosetests for the current buffer."
  (interactive)
  (let ((file-name (ots-python-mode-unit-test-argument)))
    (compile (format "nosetests-run -xs %s" file-name))))

(defun ots-python-mode-py-test ()
  "Run unit tests with py.test for the current buffer."
  (interactive)
  (let ((file-name (ots-python-mode-unit-test-argument)))
    (compile (format "py.test-3 -xs %s" file-name))))

(defun ots-python-mode-py-test-coverage ()
  "Run unit tests with py.test and coverage for the current buffer."
  (interactive)
  (let ((file-name (ots-python-mode-unit-test-argument)))
    (compile (format "py.test-coverage -xs %s" file-name))))

(defun ots-python-mode-pyflakes ()
  "Check the current buffer with pyflakes."
  (interactive)
  (compile (ots-util-expand-command "pyflakes3 %s")))

(defun ots-python-mode-run ()
  "Run python file with python."
  (interactive)
  (compile (ots-util-expand-command "python3 -u %s")))

(defun ots-python-mode-set-default-directory ()
  "Set the default directory to the source tree root."
  ;; We need to have the current package at the beginning of PYTHONPATH,
  ;; which is easiest done by changing the working directory.
  (while (file-exists-p (concat default-directory "__init__.py"))
    (cd ".."))
  (let ((directory default-directory)
        (parent (file-name-as-directory ".."))
        (dotgit (file-name-as-directory ".git")))
    (dotimes (i 10)
      (if (file-exists-p (concat directory parent dotgit))
          (cd (concat directory parent))
        (setq directory (concat directory parent))))))

(defun ots-python-mode-set-faces ()
  "Set faces for editing Python files."
  (font-lock-add-keywords
   nil
   '(("\\<\\([0-9.]+\\)\\>"
      1 font-lock-constant-face)
     ("\\<\\(False\\|None\\|True\\)\\>"
      1 font-lock-constant-face)
     ("\\<\\(self\\)\\>"
      1 font-lock-preprocessor-face)
     ("\\<\\([a-zA-Z0-9_]+\\)="
      1 font-lock-variable-name-face)
     )))

(defun ots-python-mode-set-keys ()
  "Set keybindings for editing Python files."
  (local-set-key (kbd "C-S-o") 'ots-python-mode-find-unit-test-file)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f6>") 'ots-python-mode-run)
  (local-set-key (kbd "<f8>") 'python-shell-send-buffer)
  (local-set-key (kbd "<f9>") 'ots-python-mode-pyflakes)
  (local-set-key (kbd "<f10>") 'ots-python-mode-py-test)
  (local-set-key (kbd "<S-f10>") 'ots-python-mode-py-test-coverage)
  (local-set-key (kbd "<C-S-f10>") 'ots-python-mode-nosetests-run))

(defun ots-python-mode-set-properties ()
  "Set properties for editing Python code."
  (eldoc-mode 1)
  (hs-minor-mode 1)
  (modify-syntax-entry ?_ "w")
  (setq ac-use-quick-help nil)
  (setq fill-column 79)
  (setq indent-tabs-mode nil)
  (setq python-shell-interpreter "python3")
  (setq tab-width 4)
  (setq truncate-lines t)
  (if (ots-util-buffer-contains "gi.repository")
      ;; Only load GNOME documentation if in a file
      ;; that imports from GI.
      (setq-local
       helm-dash-docsets
       '("GDK" "Gio" "GLib" "GObject" "GTK+" "Pango" "Python"))
    (setq-local helm-dash-docsets '("Python")))
  (turn-on-auto-fill))

(defun ots-python-mode-start ()
  "Start or associate a process for the buffer."
  (run-python "python3 -i" nil nil)
  (set-process-query-on-exit-flag (get-process "Python") nil))

(defun ots-python-mode-unit-test-argument ()
  "Return unit test filename argument for unit test programs."
  (let ((file-name (buffer-file-name)))
    (if (string= (substring (file-name-nondirectory file-name) 0 5) "test_")
        (shell-quote-argument (ots-util-buffer-file-name))
      (shell-quote-argument (ots-python-mode-unit-test-file)))))

(defun ots-python-mode-unit-test-file ()
  "Return path of the unit test file for the current buffer."
  (let ((directory (file-name-directory (ots-util-buffer-file-name)))
        (file-name (file-name-nondirectory (ots-util-buffer-file-name))))
    (concat directory "test/test_" file-name)))

(add-hook 'python-mode-hook 'ots-python-mode-set-default-directory)
(add-hook 'python-mode-hook 'ots-python-mode-set-faces)
(add-hook 'python-mode-hook 'ots-python-mode-set-keys)
(add-hook 'python-mode-hook 'ots-python-mode-set-properties)
(add-hook 'python-mode-hook 'ots-python-mode-start t)

(unless (eq system-type 'windows-nt)
  ;; TODO: Figure out how to install Jedi on Windows.
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))

(provide 'ots-python-mode)
;;; ots-python-mode.el ends here
