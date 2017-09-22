;;; -*- coding: utf-8 -*-
;;; ots-python-completion.el

(require 'cl-lib)

;; If company-anaconda is the first completion backend to try, company is not
;; able to fall back to other backends, e.g. dabbrev, in places where anaconda
;; could theoretically complete but practically cannot, e.g. due to not being
;; able to detect the type of the object. This is due to the prefixes being
;; different, e.g. 'os.path.abs' vs. 'abs'. We can hack in the fallback
;; behaviour by making backends that appear to work with the anaconda-style
;; prefixes, but actually act like their normal counterparts. This is ugly,
;; might fail in some corner cases and might break with future updates.

;; https://emacs.stackexchange.com/a/15251

(defun company-anaconda-dabbrev (command &optional arg &rest ignored)
  "company-dabbrev with a prefix that matches company-anaconda."
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-anaconda-dabbrev))
    (prefix (company-anaconda-prefix))
    (candidates (company-anaconda-dabbrev-candidates arg))))

(defun company-anaconda-dabbrev-candidates (prefix)
  "Return company-dabbrev completions given anaconda-style prefix."
  (let* ((word-prefix (company-dabbrev--prefix))
         (regexp (company-dabbrev-code--make-regexp word-prefix))
         (words (company-dabbrev--search regexp)))
    (ots-python-completion-concat words prefix word-prefix)))

(defun company-anaconda-dict (command &optional arg &rest ignored)
  "company-dict with a prefix that matches company-anaconda."
  (interactive (list 'interactive))
  (mapc 'company-dict--init (company-dict--relevant-modes))
  (cl-case command
    (interactive (company-begin-backend 'company-anaconda-dict))
    (prefix (company-anaconda-prefix))
    (candidates (company-anaconda-dict-candidates arg))
    (annotation (company-dict--annotation arg))
    (meta (company-dict--meta arg))))

(defun company-anaconda-dict-candidates (prefix)
  "Return company-dict completions given anaconda-style prefix."
  (let* ((word-prefix (company-dabbrev--prefix))
         (words (company-dict--relevant-dicts))
         (filter (lambda (x) (string-prefix-p word-prefix x))))
    (setq words (cl-remove-if-not filter words))
    (ots-python-completion-concat words prefix word-prefix)))

(defun ots-python-completion-concat (words prefix word-prefix)
  "Return words with full anaconda-style prefix added if missing."
  (let ((head (replace-regexp-in-string "\\.[a-zA-Z0-9_]*$" "." prefix)))
    (if (< (string-width word-prefix) 3) nil
      (if (not (string-match-p "\\." prefix)) words
        (mapcar (lambda (x) (concat head x)) words)))))

(provide 'ots-python-completion)
;;; ots-python-completion.el ends here
