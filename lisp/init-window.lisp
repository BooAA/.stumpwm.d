(in-package :stumpwm)

(load-module "globalwindows")

(define-key *root-map* (kbd "b") "global-pull-windowlist")
(define-key *root-map* (kbd "k") "delete")
(define-key *root-map* (kbd "Left") "prev")
(define-key *root-map* (kbd "Right") "next")

(setf *float-window-modifier* :super)
