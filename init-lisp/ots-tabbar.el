;;; -*- coding: utf-8 -*-
;;; ots-tabbar.el

(require 'tabbar)

(defun ots-tabbar-buffer-groups ()
  "Return list of groups that buffer belongs to."
  (list "All Buffers"))

(defun ots-tabbar-buffer-list ()
  "Return list of buffers to show in tabs in no particular order."
  (seq-filter 'ots-tabbar-buffer-list-p (buffer-list)))

(defun ots-tabbar-buffer-list-p (buffer)
  "Return true if buffer should be shown in the list of buffers."
  (let ((name (buffer-name buffer)))
    (or (eq (current-buffer) buffer)
        (string-match "^[^* ]" name) ; regular buffers
        (string-match "^\\*\\(ansi-term\\|ielm\\|js\\|man\\|Octave\\|Python\\|R\\|shell\\|term\\)" name))))

(defun ots-tabbar-set-buttons ()
  "Set button pixmaps to use in tabbar buttons."
  (setq tabbar-buffer-home-button '(("") ""))
  (setq tabbar-home-button '(("") ""))
  (setq tabbar-scroll-left-button '(("") ""))
  (setq tabbar-scroll-right-button '(("") "")))

(defun ots-tabbar-set-functions ()
  "Set custom functions to modify tabbar behaviour."
  (setq tabbar-buffer-groups-function 'ots-tabbar-buffer-groups)
  (setq tabbar-buffer-list-function 'ots-tabbar-buffer-list)
  (setq tabbar-tab-label-function 'ots-tabbar-tab-label))

(defun ots-tabbar-set-keys ()
  "Set keybindings to use to navigate the tabbar."
  (global-set-key (kbd "<C-next>") 'tabbar-forward-tab)
  (global-set-key (kbd "<C-prior>") 'tabbar-backward-tab))

(defun ots-tabbar-sort (x y)
  "Return string sort value for tabs x and y."
  (string-lessp (ots-tabbar-label-sort-key x)
                (ots-tabbar-label-sort-key y)))

(defun ots-tabbar-label-sort-key (tab)
  "Return a sort key for the label of tab."
  ;; Sort unit test files to the right of the main file.
  (let ((label (tabbar-buffer-tab-label tab)))
    (if (string-match "^test_" label)
        (concat (substring label 5) ".test")
      label)))

(defun ots-tabbar-tab-label (tab)
  "Return string shortened from filename to use as tab label."
  (format " %s " (tabbar-shorten (format "%s" (tabbar-tab-value tab)) 24)))

(defun tabbar-add-tab (tabset object &optional append)
  "Add to tabset a tab with value object if there isn't one there yet.
  Override the default tabbar behaviour of appending the tab if append is true
  and rather insert the new tab so that alphabetical order is maintained."
  (let ((tabs (tabbar-tabs tabset)))
    (if (tabbar-get-tab object tabset) tabs
      (let ((tab (tabbar-make-tab object tabset)))
        (tabbar-set-template tabset nil)
        (setq tabs (append tabs (list tab))))
      (set tabset (sort tabs 'ots-tabbar-sort)))))

(tabbar-mode t)
(ots-tabbar-set-buttons)
(ots-tabbar-set-functions)
(ots-tabbar-set-keys)

(provide 'ots-tabbar)
;;; ots-tabbar.el ends here
