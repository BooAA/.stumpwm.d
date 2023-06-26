(in-package :stumpwm)

(load-module "winner-mode")

(add-hook *post-command-hook*
          (lambda (command)
            (when (member command winner-mode:*default-commands*)
              (winner-mode:dump-group-to-file))))

(define-key *root-map* (kbd "s-Left") "winner-undo")
(define-key *root-map* (kbd "s-Right") "winner-redo")

(define-key *root-map* (kbd "0") "remove-split")
(define-key *root-map* (kbd "1") "only")
(define-key *root-map* (kbd "2") "vsplit")
(define-key *root-map* (kbd "3") "hsplit")
(define-key *root-map* (kbd "o") "fnext")
(define-key *root-map* (kbd "O") "fprev")
(define-key *root-map* (kbd "^") "iresize")
(define-key *root-map* (kbd "x") '*exchange-window-map*)

(dolist (dir '("up" "down" "left" "right"))
  (let ((s-dir (kbd (format nil "s-~a" (string-capitalize dir))))
        (s-S-dir (kbd (format nil "s-S-~a" (string-capitalize dir))))
        (move-focus-dir (format nil "move-focus ~a" dir))
        (move-window-dir (format nil "move-window ~a" dir)))
    (define-key *top-map* s-dir move-focus-dir)
    (define-key *top-map* s-S-dir move-window-dir)))

