;;; -*- coding: utf-8-unix -*-
;;; ots-wcheck-mode.el

(autoload 'wcheck-mode "wcheck-mode" "Toggle wcheck-mode." t)
(autoload 'wcheck-change-language "wcheck-mode" "Switch language." t)
(autoload 'wcheck-actions "wcheck-mode" "Open actions menu." t)

(setq wcheck-language "fi")
(setq
 wcheck-language-data
 (if (eq system-type 'windows-nt)
     '(("en"
        (program . "c:\\cygwin\\bin\\enchant.exe")
        (args "-l" "-d" "en")
        (action-program . "c:\\cygwin\\bin\\enchant.exe")
        (action-args "-a" "-d" "en")
        (action-parser . wcheck-parser-ispell-suggestions))
       ("fi"
        (program . "c:\\cygwin\\bin\\enchant.exe")
        (args "-l" "-d" "fi")
        (action-program . "c:\\cygwin\\bin\\enchant.exe")
        (action-args "-a" "-d" "fi")
        (action-parser . wcheck-parser-ispell-suggestions)))
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
      (action-parser . wcheck-parser-ispell-suggestions)))))

(setq wcheck-language-data-defaults
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
          font-lock-type-face))))

(global-set-key (kbd "<f7>") 'wcheck-mode)
(global-set-key (kbd "<S-f7>") 'wcheck-change-language)

(provide 'ots-wcheck-mode)
;;; ots-wcheck-mode.el ends here
