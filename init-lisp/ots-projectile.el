;;; -*- coding: utf-8 -*-
;;; ots-projectile.el

(use-package projectile
  :config

  (add-to-list 'projectile-globally-ignored-directories ".cache")
  (add-to-list 'projectile-globally-ignored-directories ".pytest_cache")
  (add-to-list 'projectile-globally-ignored-directories "__pycache__")
  (add-to-list 'projectile-globally-ignored-directories "build")
  (add-to-list 'projectile-globally-ignored-directories "dist")
  (add-to-list 'projectile-globally-ignored-directories "docsets")
  (add-to-list 'projectile-globally-ignored-directories "eln-cache")
  (add-to-list 'projectile-globally-ignored-directories "elpa")
  (add-to-list 'projectile-globally-ignored-directories "man")
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "venv")

  (add-to-list 'projectile-globally-ignored-file-suffixes ".elc")
  (add-to-list 'projectile-globally-ignored-file-suffixes ".ico")
  (add-to-list 'projectile-globally-ignored-file-suffixes ".min.css")
  (add-to-list 'projectile-globally-ignored-file-suffixes ".min.js")
  (add-to-list 'projectile-globally-ignored-file-suffixes ".png")
  (add-to-list 'projectile-globally-ignored-file-suffixes ".pyc")
  (add-to-list 'projectile-globally-ignored-file-suffixes ".Rd")
  (add-to-list 'projectile-globally-ignored-file-suffixes ".svg")
  (add-to-list 'projectile-globally-ignored-file-suffixes "~")

  (projectile-global-mode))

(provide 'ots-projectile)
;;; ots-projectile.el ends here
