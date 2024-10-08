;;; -*- coding: utf-8-unix -*-
;;; ots-util.el

(defun ots-util-add-docset (regexp docset &optional limit)
  "Add helm-dash docset if regexp found in buffer text."
  (if (not (local-variable-p 'dash-docs-docsets))
      (setq-local dash-docs-docsets '()))
  (when (not (member docset dash-docs-docsets))
    (when (ots-util-buffer-contains regexp limit)
      (add-to-list 'dash-docs-docsets docset t))))

(defun ots-util-add-imenu-expressions (expressions)
  "Set imenu index patterns for the current buffer."
  (setq-local imenu-generic-expression expressions)
  (setq-local imenu-create-index-function 'imenu-default-create-index-function))

(defun ots-util-backward-block ()
  "Move cursor to the beginning of the previous block."
  (interactive "^")
  (skip-chars-backward "\n\t ")
  (beginning-of-line)
  (while (progn
           (forward-line -1)
           (and (> (point) (point-min))
                (not (looking-at "^[\t ]*$")))))
  (ots-util-recenter))

(defun ots-util-beginning-of-defun ()
  "Move backward to the previous function."
  (interactive)
  (beginning-of-defun)
  (ots-util-recenter))

(defun ots-util-bind-key-compile (key command)
  "Bind key locally to a compile command."
  (local-set-key key `(lambda () (interactive)
                        (compile (ots-util-expand-command ',command) t))))

(defun ots-util-bind-key-compile-root (key command)
  "Bind key locally to a compile command run at project root (if applicable)."
  (local-set-key key `(lambda () (interactive)
                        (if (ots-util-project-p)
                            (let ((default-directory (projectile-project-root)))
                              (compile (ots-util-expand-command ',command) t))
                          (compile (ots-util-expand-command ',command) t)))))

(defun ots-util-browse-pypi ()
  "Browse the PyPI URL of the package on the current line of a requirements.txt file."
  (interactive)
  (let* ((start (line-beginning-position))
         (end (line-end-position))
         (line (buffer-substring start end))
         (package (car (split-string line "[=<>\\[]")))
         (url (format "https://pypi.org/project/%s/" package)))
    (browse-url url)))

(defun ots-util-buffer-contains (regexp &optional limit)
  "Return true if regexp found in buffer text."
  (setq limit (min (point-max) (or limit (point-max))))
  (let ((text (buffer-substring (point-min) limit)))
    (string-match-p regexp text)))

(defun ots-util-buffer-file-name ()
  "Return buffer-file-name relative to default-directory."
  (let ((directory (expand-file-name default-directory ""))
        (file-name (expand-file-name (buffer-file-name) "")))
    (substring file-name (length directory))))

(defun ots-util-buffer-file-name-quoted ()
  "Return shell-quoted current buffer's filename."
  (shell-quote-argument (ots-util-buffer-file-name)))

(defun ots-util-comint-send (command &optional args)
  "Format command and send as input in a comint buffer."
  (if args (setq command (format command args)))
  (insert command)
  (comint-send-input))

(defun ots-util-copy-open-file-names ()
  "Copy names of all open files to the kill ring."
  (interactive)
  (let ((buffers (delq nil (mapcar 'buffer-file-name (buffer-list)))))
    (setq buffers (sort buffers 'string<))
    (kill-new (mapconcat 'identity buffers "\n")))
  (message "Copied!"))

(defun ots-util-end-of-defun ()
  "Move forward to the next function."
  (interactive)
  (end-of-defun)
  (ots-util-recenter))

(defun ots-util-expand-command (command)
  "Return command with '%s's replaced with buffer filenames."
  (dotimes (i (or (string-match "%s" command) 0))
    (setq command (format command (ots-util-buffer-file-name-quoted))))
  ;; Allow using %t in command for the corresponding unit test file.
  (setq command (replace-regexp-in-string "%t" "%s" command))
  (dotimes (i (or (string-match "%s" command) 0))
    (setq command (format command (ots-util-unit-test-argument))))
  command)

(defun ots-util-file-above (path file-name)
  "Return file-path if file-name found in path or above in hierarchy."
  (if (member path '("/" nil)) nil
    (let ((candidate (concat path "/" file-name)))
      (if (file-exists-p candidate)
          candidate
        (ots-util-file-above
         (ots-util-parent-directory path)
         file-name)))))

(defun ots-util-find-unit-test-file ()
  "Open the unit test file testing the current buffer."
  (interactive)
  (find-file (ots-util-unit-test-file)))

(defun ots-util-forward-block ()
  "Move cursor to the beginning of the next block."
  (interactive "^")
  (re-search-forward "\n[\n\t ]*$" nil t)
  (ots-util-recenter))

(defun ots-util-getenv-true (name)
  "Return true if environment variable NAME is set to a true value."
  (let ((value (getenv name)))
    (and value (> (length value) 0))))

(defun ots-util-in-git-repo (path)
  "Return true if path is in a git repository"
  (if (member path '("/" nil)) nil
    (if (file-exists-p (concat path "/.git/")) t
      (ots-util-in-git-repo
       (ots-util-parent-directory path)))))

(defun ots-util-insert-tab ()
  "Insert one tab character at point."
  (interactive)
  (insert 9))

(defun ots-util-kill-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(defun ots-util-mark-to-beginning-of-defun ()
  "Mark from point to beginning of function."
  (interactive)
  (if (not mark-active)
      (push-mark (point) t t))
  (beginning-of-defun))

(defun ots-util-mark-to-beginning-of-sentence ()
  "Mark from point to beginning of sentence."
  (interactive)
  (if (not mark-active)
      (push-mark (point) t t))
  (backward-sentence))

(defun ots-util-mark-to-end-of-defun ()
  "Mark from point to end of function."
  (interactive)
  (if (not mark-active)
      (push-mark (point) t t))
  (end-of-defun))

(defun ots-util-mark-to-end-of-sentence ()
  "Mark from point to end of sentence."
  (interactive)
  (if (not mark-active)
      (push-mark (point) t t))
  (forward-sentence))

(defun ots-util-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert arg."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun ots-util-next-window ()
  "Select the next window."
  (interactive)
  (other-window 1))

(defun ots-util-parent-directory (path)
  "Return the parent directory of path."
  (file-name-directory (directory-file-name path)))

(defun ots-util-pixel-ratio ()
  "Return screen DPI relative to traditional."
  (let* ((monitor (car (display-monitor-attributes-list)))
         (geometry (assq 'geometry monitor))
         (width (nth 2 (cdr geometry))))
    (if (> width 2000) 2 1)))

(defun ots-util-pop-mark ()
  "Move point to the previous mark in the ring."
  (interactive)
  (set-mark-command t))

(defun ots-util-previous-window ()
  "Select the previous window."
  (interactive)
  (other-window -1))

(defun ots-util-project-p ()
  "Return TRUE if in a project, elsewhere FALSE."
  (and (fboundp 'projectile-project-p) (projectile-project-p)))

(defun ots-util-push-mark ()
  "Push point to the mark ring."
  (interactive)
  (push-mark (point) t nil)
  (message "Mark set"))

(defun ots-util-recenter ()
  "Scroll the text so that point is vertically centered."
  (if (and (not (bobp))
           (not (eobp))
           (or (< (ots-util-visible-pos) 0.25)
               (> (ots-util-visible-pos) 0.75)))
      (recenter)))

(defun ots-util-save-buffer ()
  "Save the current buffer whether or not it is changed."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(defun ots-util-smart-fill ()
  "Fill either paragraph at point or paragraphs in region."
  (interactive)
  (fill-paragraph nil))

(defun ots-util-smart-home (&optional count)
  "Go to either beginning of line or beginning of indentation."
  (interactive "^p")
  (if (bolp)
      (back-to-indentation)
    (move-beginning-of-line count)))

(defun ots-util-smart-kill-line (&optional arg)
  "Delete either the current line or the whole active region."
  (interactive)
  (let (kill-ring)
    (if mark-active
        (kill-region (region-beginning) (region-end))
      (kill-line arg))))

(defun ots-util-smart-kill-word (&optional arg)
  "Delete either the current word or the whole active region."
  (interactive)
  (let (kill-ring)
    (if mark-active
        (kill-region (region-beginning) (region-end))
      (kill-word arg))))

(defun ots-util-smart-tab ()
  "Indent or complete depending on circumstances."
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if mark-active
        (indent-region (region-beginning) (region-end))
      (indent-for-tab-command))))

(defun ots-util-start-external-terminal ()
  "Start an external terminal in directory of the current buffer."
  (interactive)
  (start-process "gnome-terminal" "*gnome-terminal*" "gnome-terminal"))

(defun ots-util-switch-to-other-buffer ()
  "Switch to the most recently selected buffer."
  (interactive)
  (switch-to-buffer nil))

(defun ots-util-unit-test-argument ()
  "Return unit test filename argument for unit test programs."
  (let ((file-name (buffer-file-name)))
    (if (string-match-p "^test[^a-z]" (file-name-nondirectory file-name))
        (shell-quote-argument (ots-util-buffer-file-name))
      (shell-quote-argument (ots-util-unit-test-file)))))

(defun ots-util-unit-test-file ()
  "Return path of the unit test file for the current buffer."
  (let ((directory (file-name-directory (ots-util-buffer-file-name)))
        (file-name (file-name-nondirectory (ots-util-buffer-file-name))))
    (concat directory "test/test_" file-name)))

(defun ots-util-visible-pos ()
  "Return the current position as fraction of the visible window."
  (/ (float (- (line-number-at-pos) (line-number-at-pos (window-start))))
     (float (- (line-number-at-pos (window-end)) (line-number-at-pos (window-start))))))

(defun ots-util-what-face (pos)
  "Print face at pos."
  ;; http://stackoverflow.com/a/1242366/653825
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face
        (message "Face: %s" face)
      (message "No face at %d" pos))))

(provide 'ots-util)
;;; ots-util.el ends here
