(in-package :stumpwm)

(load-module "swm-gaps")
(load-module "ttf-fonts")

(set-bg-color "#3F3F3F")
(set-fg-color "#DCDCCC")
(set-focus-color "#9FC59F")
(set-unfocus-color "#5F7F5F")

(let ((font-cache (merge-pathnames ".fonts/font-cache.sexp"
                                   (user-homedir-pathname))))
  (when (not (probe-file font-cache))
    (clx-truetype::cache-fonts)))

(set-font (remove nil `(,(ignore-errors (make-instance 'xft:font
                                                       :family "Noto Sans Mono CJK TC"
                                                       :subfamily "Book"
                                                       :size 10
                                                       :antialias t))
                        ,(ignore-errors (make-instance 'xft:font
                                                       :family "Hack"
                                                       :subfamily "Regular"
                                                       :size 10
                                                       :antialias t))
                        "7x14")))

(setf *input-window-gravity* :top
      *message-window-gravity* :top
      *message-window-input-gravity* :top-right
      *window-border-style* :none
      *message-window-padding* 5)

(setf *input-completion-style* (make-input-completion-style-unambiguous))

(setf *mouse-focus-policy* :click)

(setf swm-gaps:*head-gaps-size* 2
      swm-gaps:*inner-gaps-size* 2
      swm-gaps:*outer-gaps-size* 2)

(swm-gaps:toggle-gaps-on)
