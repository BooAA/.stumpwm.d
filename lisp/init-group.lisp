(in-package :stumpwm)

(grename "DEFAULT")
(dolist (group '("TERM" "EMACS" "MISC"))
  (gnewbg group))

(define-key *root-map* (kbd "t") '*groups-map*)
(define-key *groups-map* (kbd "0") "gkill")
(define-key *groups-map* (kbd "1") "gkill-other")
(define-key *groups-map* (kbd "2") "gnew")
(define-key *groups-map* (kbd "o") "gnext")
(define-key *groups-map* (kbd "r") "grename")
(define-key *groups-map* (kbd "RET") "gselect")

(loop for i from 1 to 9
      do (let ((s-i (kbd (format nil "s-~a" i)))
               (gselect-i (format nil "gselect ~a" i)))
           (define-key *top-map* s-i gselect-i)))

(define-key *top-map* (kbd "s-!") "gmove 1")
(define-key *top-map* (kbd "s-@") "gmove 2")
(define-key *top-map* (kbd "s-#") "gmove 3")
(define-key *top-map* (kbd "s-$") "gmove 4")
(define-key *top-map* (kbd "s-%") "gmove 5")
(define-key *top-map* (kbd "s-^") "gmove 6")
(define-key *top-map* (kbd "s-&") "gmove 7")
(define-key *top-map* (kbd "s-*") "gmove 8")
(define-key *top-map* (kbd "s-(") "gmove 9")
