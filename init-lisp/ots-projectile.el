;;; -*- coding: utf-8 -*-
;;; ots-projectile.el

(require 'projectile)

(add-to-list 'projectile-globally-ignored-directories ".cache")
(add-to-list 'projectile-globally-ignored-directories "__pycache__")
(add-to-list 'projectile-globally-ignored-directories "build")
(add-to-list 'projectile-globally-ignored-directories "dist")
(add-to-list 'projectile-globally-ignored-directories "docsets")
(add-to-list 'projectile-globally-ignored-directories "elpa")
(add-to-list 'projectile-globally-ignored-directories "node_modules")

(add-to-list 'projectile-globally-ignored-file-suffixes ".elc")
(add-to-list 'projectile-globally-ignored-file-suffixes ".pyc")

(projectile-global-mode)

(provide 'ots-projectile)
;;; ots-projectile.el ends here
