;;; -*- coding: utf-8-unix -*-

(setq debug-on-error (and (getenv "DEBUG")
                          (not (string-empty-p (getenv "DEBUG")))))

;; Use straight.el instead.
;; https://github.com/raxod502/straight.el
(setq package-enable-at-startup nil)
