;;; -*- coding: utf-8 -*-
;;; ots-tab-line.el

(defun ots-tab-line-buffer-p (buffer)
  "Return non-nil if BUFFER should be shown as a tab."
  (or (eq (current-buffer) buffer)
      (ots-tab-line-show-buffer-p buffer)))

(defun ots-tab-line-show-buffer-p (buffer)
  "Return non-nil if BUFFER should be shown as a tab."
  (let ((name (buffer-name buffer)))
    (or (string-match-p "^[^* ]" name) ;; Regular file buffers
        (string-match-p "^\\*\\(ansi-term\\|ielm\\|js\\|man\\|Python\\|R\\|shell\\|term\\|vterm\\)" name))))

(defun ots-tab-line-skip-buffer (_window buffer _bury-or-kill)
  "Skip hidden buffers when switching buffers after a kill or bury."
  (not (ots-tab-line-show-buffer-p buffer)))

(defun ots-tab-line-buffers ()
  "Return a list of buffers to show as tabs, sorted by filename."
  (sort (seq-filter #'ots-tab-line-buffer-p (buffer-list))
        (lambda (a b)
          (string-lessp (ots-tab-line-sort-key a)
                        (ots-tab-line-sort-key b)))))

(defun ots-tab-line-sort-key (buffer)
  "Return a sort key for BUFFER, placing unit test files after the main file."
  (let ((name (buffer-name buffer)))
    (if (string-match "^test_" name)
        (concat (substring name 5) ".test")
      name)))

(defun ots-tab-line-tab-name (buffer &optional _buffers)
  "Return a padded, shortened tab label for BUFFER."
  (let ((name (buffer-name buffer)))
    (format "  %s  "
            (if (> (length name) 24)
                (truncate-string-to-width name 24 nil nil t)
              name))))

(use-package tab-line
  :config
  (setq switch-to-prev-buffer-skip #'ots-tab-line-skip-buffer)
  (setq tab-line-close-button-show nil)
  (setq tab-line-new-button-show nil)
  (setq tab-line-separator "")
  (setq tab-line-tab-face-functions '(tab-line-tab-face-modified))
  (setq tab-line-tab-name-function #'ots-tab-line-tab-name)
  (setq tab-line-tabs-function #'ots-tab-line-buffers)
  (add-to-list 'tab-line-exclude-modes 'neotree-mode)
  (global-tab-line-mode 1))

(provide 'ots-tab-line)
;;; ots-tab-line.el ends here
