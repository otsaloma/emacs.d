;;; -*- coding: utf-8-unix -*-
;;; ots-wcheck-mode.el

(autoload 'wcheck-actions "wcheck-mode" "Open actions menu." t)
(autoload 'wcheck-change-language "wcheck-mode" "Switch language." t)
(autoload 'wcheck-mode "wcheck-mode" "Toggle wcheck-mode." t)

(defvar enchant-program
  (if (eq system-type 'windows-nt)
      "c:\\cygwin\\bin\\enchant.exe"
    "/usr/bin/enchant")
  "Path to the enchant executable.")

(defun enchant-add-to-dictionary (marked-text)
  "Add word from marked-text to user's dictionary."
  (let* ((word (aref marked-text 0))
         (lang (aref marked-text 4))
         (file (format "~/.config/enchant/%s.dic" lang)))
    (when (and file (file-writable-p file))
      (write-region (concat "\n" word) nil file 'append)
      (message "Added word \"%s\" to the %s.dic" word lang))))

(defun enchant-suggestions-menu (marked-text)
  "Add to suggestions menu an action to add word to user's dictionary."
  (cons (cons "[Add]" 'enchant-add-to-dictionary)
        (wcheck-parser-ispell-suggestions)))

(defun enchant-wcheck-entry (lang)
  "Construct a wcheck-language-data alist entry for enchant."
  (let ((out (list lang)))
    (add-to-list 'out `(program . ,enchant-program) t)
    (add-to-list 'out `(args "-l" "-d" ,lang) t)
    (add-to-list 'out `(action-program . ,enchant-program) t)
    (add-to-list 'out `(action-args "-a" "-d" ,lang) t)
    (add-to-list 'out `(action-parser . enchant-suggestions-menu) t)
    out))

(setq wcheck-language "fi")
(add-to-list 'wcheck-language-data (enchant-wcheck-entry "en") t)
(add-to-list 'wcheck-language-data (enchant-wcheck-entry "fi") t)
(setq wcheck-language-data-defaults
      '((read-or-skip-faces
         (latex-mode read
                     nil ; normal text
                     font-latex-bold-face
                     font-latex-italic-face
                     font-latex-sectioning-0-face
                     font-latex-sectioning-1-face
                     font-latex-sectioning-2-face
                     font-latex-sectioning-3-face
                     font-latex-sectioning-4-face
                     font-latex-sectioning-5-face
                     font-latex-slide-title-face
                     font-lock-type-face
                     ))))

(global-set-key (kbd "<f7>") 'wcheck-mode)
(global-set-key (kbd "<S-f7>") 'wcheck-change-language)

(provide 'ots-wcheck-mode)
;;; ots-wcheck-mode.el ends here
