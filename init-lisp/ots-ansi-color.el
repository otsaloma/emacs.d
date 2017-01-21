;;; -*- coding: utf-8 -*-
;;; ots-ansi-color.el

(require 'ots-theme)

(defvar ots-ansi-color-values
  ["#2e3436"
   "#cc6666"
   "#90b078"
   "#b0a678"
   "#84a3c2"
   "#b294bb"
   "#8abeb7"
   "#d3d7cf"]
  "Vector of ANSI color values in shell output.")

(setq ansi-color-names-vector ots-ansi-color-values)
(setq ansi-color-map (ansi-color-make-color-map))
(ansi-color-for-comint-mode-on)

(provide 'ots-ansi-color)
;;; ots-ansi-color.el ends here
