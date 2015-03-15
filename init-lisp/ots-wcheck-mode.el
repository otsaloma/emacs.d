;;; -*- coding: utf-8-unix -*-
;;; ots-wcheck-mode.el

(autoload 'wcheck-mode "wcheck-mode"
  "Toggle wcheck-mode." t)

(autoload 'wcheck-change-language "wcheck-mode"
  "Switch wcheck-mode languages." t)

(autoload 'wcheck-actions "wcheck-mode"
  "Open actions menu." t)

(autoload 'wcheck-jump-forward "wcheck-mode"
  "Move point forward to next marked text area." t)

(autoload 'wcheck-jump-backward "wcheck-mode"
  "Move point backward to previous marked text area." t)

(defvar ots-wcheck-mode-language-data-unix
  '(("en"
     (program . "/usr/bin/enchant")
     (args "-l" "-d" "en")
     (action-program . "/usr/bin/enchant")
     (action-args "-a" "-d" "en")
     (action-parser . wcheck-parser-ispell-suggestions))
    ("fi"
     (program . "/usr/bin/enchant")
     (args "-l" "-d" "fi")
     (action-program . "/usr/bin/enchant")
     (action-args "-a" "-d" "fi")
     (action-parser . wcheck-parser-ispell-suggestions)))
  "Programs and arguments for word checks on Unix.")

(defvar ots-wcheck-mode-language-data-windows
  ;; http://lists.puimula.org/pipermail/voikko/2010-April/001305.html
  '(("fi"
     (program . "c:\\voikko\\bin\\voikkospell.exe")
     (args "-t")))
  "Programs and arguments for word checks on Windows.")

(defvar wcheck-language "fi"
  "Default language for word checks.")

(defvar wcheck-language-data
  (if (eq system-type 'windows-nt)
      ots-wcheck-mode-language-data-windows
    ots-wcheck-mode-language-data-unix)
  "Programs and arguments for different language word checks.")

(defvar wcheck-language-data-defaults
  '((read-or-skip-faces
     (latex-mode
      read
      nil
      font-latex-bold-face
      font-latex-italic-face
      font-latex-sectioning-0-face
      font-latex-sectioning-1-face
      font-latex-sectioning-2-face
      font-latex-sectioning-3-face
      font-latex-sectioning-4-face
      font-latex-sectioning-5-face
      font-latex-slide-title-face
      font-lock-type-face)))
  "Which faces to read and which to skip.")

(global-set-key (kbd "<f7>") 'wcheck-mode)
(global-set-key (kbd "<S-f7>") 'wcheck-change-language)

(provide 'ots-wcheck-mode)
;;; ots-wcheck-mode.el ends here
