;;; -*- coding: utf-8-unix -*-
;;; ots-wcheck-mode.el

(defun enchant-add-to-dictionary (marked-text)
  "Add word from marked-text to user's dictionary."
  (let* ((word (aref marked-text 0))
         (lang (aref marked-text 4))
         (file (format "~/.config/enchant/%s.dic" lang)))
    (when (and file (file-writable-p file))
      (write-region (concat "\n" word) nil file 'append)
      (message "Added word \"%s\" to %s.dic" word lang))))

(defun enchant-suggestions-menu (marked-text)
  "Add to suggestions menu an action to add word to user's dictionary."
  (cons (cons "[Add]" 'enchant-add-to-dictionary)
        (wcheck-parser-ispell-suggestions)))

(defun enchant-wcheck-entry (lang)
  "Construct a wcheck-language-data alist entry for enchant."
  (let ((out (list lang)))
    (add-to-list 'out `(program . ,"/usr/bin/enchant-2") t)
    (add-to-list 'out `(args "-l" "-d" ,lang) t)
    (add-to-list 'out `(action-program . ,"/usr/bin/enchant-2") t)
    (add-to-list 'out `(action-args "-a" "-d" ,lang) t)
    (add-to-list 'out `(action-parser . enchant-suggestions-menu) t)
    out))

(autoload 'wcheck-actions "wcheck-mode" "Open actions menu." t)
(autoload 'wcheck-change-language "wcheck-mode" "Switch language." t)
(autoload 'wcheck-mode "wcheck-mode" "Toggle wcheck-mode." t)

(add-to-list 'wcheck-language-data (enchant-wcheck-entry "en") t)
(add-to-list 'wcheck-language-data (enchant-wcheck-entry "fi") t)

(setq wcheck-language "en")
(setq wcheck-language-data-defaults
      '((read-or-skip-faces ((gfm-mode markdown-mode) skip
                             font-lock-keyword-face
                             markdown-code-face
                             markdown-pre-face
                             markdown-reference-face
                             markdown-url-face)
                            ((python-mode) read
                             font-lock-doc-face
                             font-lock-doc-string-face))))

(global-set-key (kbd "<f7>") 'wcheck-mode)
(global-set-key (kbd "<S-f7>") 'wcheck-change-language)

(provide 'ots-wcheck-mode)
;;; ots-wcheck-mode.el ends here
