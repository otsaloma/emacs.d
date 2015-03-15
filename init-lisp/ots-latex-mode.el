;;; -*- coding: utf-8 -*-
;;; ots-latex-mode.el

(require 'ots-util)
(require 'ots-wcheck-mode)

(defun ots-latex-mode-set-face-sectioning (level)
  "Set fonts and colors for section titles."
  (let ((face (format "font-latex-sectioning-%d-face" level)))
    (setq face (car (read-from-string face)))
    (set-face-attribute face nil :inherit 'default)
    (set-face-attribute face nil :height 1.0)
    (set-face-attribute face nil :weight 'bold)
    (ots-util-set-face face nil nil)))

(defun ots-latex-mode-set-faces ()
  "Set fonts and colors for editing LaTeX files."
  (font-latex-add-keywords '(("frametitle" "[{")) 'slide-title)
  (ots-latex-mode-set-faces-sectioning)
  (ots-latex-mode-set-faces-verbatim))

(defun ots-latex-mode-set-faces-sectioning ()
  "Set fonts and colors for section titles."
  (dotimes (i 6) (ots-latex-mode-set-face-sectioning i))
  (let ((face 'font-latex-slide-title-face))
    (set-face-attribute face nil :inherit 'default)
    (set-face-attribute face nil :height 1.0)
    (set-face-attribute face nil :weight 'bold)
    (ots-util-set-face face nil nil)))

(defun ots-latex-mode-set-faces-verbatim ()
  "Set fonts and colors for verbatim text."
  (make-local-variable 'LaTeX-verbatim-regexp)
  (setq LaTeX-verbatim-regexp (concat LaTeX-verbatim-regexp "\\|Verbatim"))
  (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
  (font-latex-set-syntactic-keywords))

(defun ots-latex-mode-set-properties ()
  "Set properties for editing LaTeX files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f8>") 'ots-latex-mode-view-pdf)
  (hs-minor-mode 1)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq LaTeX-indent-level 0)
  (setq LaTeX-item-indent 0)
  (setq tab-width 2)
  (setq TeX-electric-sub-and-superscript t)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("LaTeX"))
  (turn-on-auto-fill)
  (if (eq system-type 'windows-nt)
      (ots-util-set-compile-command "make pdf %s")
    (ots-util-set-compile-command "ostex pdf %s")))

(defun ots-latex-mode-view-pdf ()
  "Open the newest PDF-file in the current directory."
  (interactive)
  (let ((pdf-file "no-file"))
    (dolist (file (file-expand-wildcards "*.pdf"))
      (if (file-newer-than-file-p file pdf-file)
          (setq pdf-file file)))
    (message (format "Viewing %s..." pdf-file))
    ;; XXX: gnome-open and xdg-open don't seem to work here.
    (let ((program (if (eq system-type 'windows-nt) "start" "evince"))
          (arg (shell-quote-argument pdf-file)))
      (start-process-shell-command program
                                   (format "*%s*" program)
                                   (format "%s %s" program arg)))))

(add-hook 'LaTeX-mode-hook 'ots-latex-mode-set-faces)
(add-hook 'LaTeX-mode-hook 'ots-latex-mode-set-properties)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'plain-tex-mode-hook '(lambda() (latex-mode)))
(setq reftex-plug-into-AUCTeX t)

(provide 'ots-latex-mode)
;;; ots-latex-mode.el ends here
