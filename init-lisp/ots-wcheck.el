;;; -*- coding: utf-8-unix -*-
;;; ots-wcheck.el

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

(use-package wcheck-mode
  :defer t
  :config
  (add-to-list 'wcheck-language-data (enchant-wcheck-entry "en") t)
  (add-to-list 'wcheck-language-data (enchant-wcheck-entry "fi") t)
  (setq wcheck-language "en")
  (wcheck-change-language "en" t)
  (setq wcheck-language-data-defaults
        '((read-or-skip-faces ((gfm-mode markdown-mode) skip
                               font-lock-keyword-face
                               markdown-code-face
                               markdown-pre-face
                               markdown-reference-face
                               markdown-url-face)))))

(provide 'ots-wcheck)
;;; ots-wcheck.el ends here
