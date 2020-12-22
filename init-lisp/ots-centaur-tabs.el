;;; -*- coding: utf-8 -*-
;;; ots-centaur-tabs.el

(require 'centaur-tabs)

(defun centaur-tabs-buffer-groups ()
  "Return list of groups that buffer belongs to."
  (let ((name (buffer-name)))
    (if (and (string-match "^\\*" name)
             (not (string-match "^\\*ansi-term" name))
             (not (string-match "^\\*ielm" name))
             (not (string-match "^\\*js" name))
             (not (string-match "^\\*man" name))
             (not (string-match "^\\*Octave" name))
             (not (string-match "^\\*Python" name))
             (not (string-match "^\\*R" name))
             (not (string-match "^\\*shell" name))
             (not (string-match "^\\*term" name)))
        (list "Hidden")
      (list "Normal"))))

(defun ots-centaur-tabs-set-properties ()
  "Set properties of Centaur tabs."
  (centaur-tabs-enable-buffer-alphabetical-reordering)
  (global-set-key (kbd "<C-next>") 'centaur-tabs-forward)
  (global-set-key (kbd "<C-prior>") 'centaur-tabs-backward)
  (setq centaur-tabs-adjust-buffer-order t)
  (setq centaur-tabs-cycle-scope 'tabs)
  (setq centaur-tabs-height 36)
  (setq centaur-tabs-modified-marker "*")
  (setq centaur-tabs-set-close-button nil)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-style "bar"))

(centaur-tabs-mode t)
(ots-centaur-tabs-set-properties)

(provide 'ots-centaur-tabs)
;;; ots-centaur-tabs.el ends here
