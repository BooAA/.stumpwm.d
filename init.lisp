(in-package :stumpwm)

(require :slynk)
(slynk:create-server :port 4004 :dont-close t)

(set-prefix-key (kbd "s-x"))
(let* ((root (merge-pathnames ".stumpwm.d/" (user-homedir-pathname)))
       (modules (merge-pathnames "modules/" root))
       (lisp (merge-pathnames "lisp/" root)))
  (set-module-dir modules)
  (load (merge-pathnames "init-ui.lisp" lisp))
  (load (merge-pathnames "init-window.lisp" lisp))
  (load (merge-pathnames "init-frame.lisp" lisp))
  (load (merge-pathnames "init-group.lisp" lisp))
  (load (merge-pathnames "init-desktop.lisp" lisp))
  (load (merge-pathnames "init-misc.lisp" lisp)))
