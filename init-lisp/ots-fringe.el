;;; -*- coding: utf-8 -*-
;;; ots-fringe.el

;;; Bitmaps are defined as a vector, each element of which represents a row in
;;; the bitmap and the value of the row is a sum of all active column values.
;;;
;;;   -  -  -  -  -  -  -  -  0
;;;   -  -  -  -  @  -  -  -  8
;;;   -  -  -  -  -  @  -  -  4
;;;   -  @  @  @  @  @  @  -  126
;;;   -  -  -  -  -  @  -  -  4
;;;   -  -  -  -  @  -  -  -  8
;;;   -  -  -  -  -  -  -  -  0
;;;   -  -  -  -  -  -  -  -  0
;;; 128 64 32 16  8  4  2  1

(define-fringe-bitmap 'left-curly-arrow [0 64 72 68 126 4 8 0])
(define-fringe-bitmap 'right-curly-arrow [0 2 18 34 126 32 16 0])
(define-fringe-bitmap 'left-arrow [0 16 32 126 32 16 0 0])
(define-fringe-bitmap 'right-arrow [0 8 4 126 4 8 0 0])

(provide 'ots-fringe)
;;; ots-fringe.el ends here
