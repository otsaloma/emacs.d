;;; -*- coding: utf-8 -*-
;;; ots-pcre.el

(defun ots-pcre-query-replace-in-open-buffers (arg1 arg2)
  "Interactively search and replace in all open buffers."
  ;; https://stackoverflow.com/a/11691104/653825
  (interactive "s[PCRE] Query replace regexp: \nsQuery replace regexp with: ")
  (mapcar
   (lambda (x)
     (find-file x)
     (save-excursion
       (goto-char (point-min))
       ;; pcre-query-replace-regexp doesn't accept arguments.
       (query-replace-regexp (rxt-pcre-to-elisp arg1) arg2)))
   (delq
    nil
    (mapcar
     (lambda (x)
       (buffer-file-name x))
     (buffer-list)))))

;; Use PCRE for regular expressions in the minibuffer.
(add-hook 'after-change-major-mode-hook
          '(lambda () (pcre-mode 1)) t)

(provide 'ots-pcre)
;;; ots-pcre.el ends here
