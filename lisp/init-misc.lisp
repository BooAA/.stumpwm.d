(in-package :stumpwm)

(load-module "command-history")
(load-module "shell-command-history")

(setf *shell-program* "/usr/bin/bash")

(define-key *top-map* (kbd "s-h") '*help-map*)
(define-key *help-map* (kbd "v") "describe-variable")
(define-key *help-map* (kbd "f") "describe-function")
(define-key *help-map* (kbd "k") "describe-key")
(define-key *help-map* (kbd "b") "where-is")
(define-key *help-map* (kbd "x") "describe-command")
(define-key *help-map* (kbd "e") "lastmsg")
