(in-package :stumpwm)

(require :slynk)
(slynk:create-server :port 4004 :dont-close t)

(setf *message-window-gravity* :top
      *input-window-gravity* :top
      *message-window-input-gravity* :top-right
      *window-border-style* :thin)

(setf *input-completion-style* (make-input-completion-style-unambiguous))

(setf *mouse-focus-policy* :click)
(setf *float-window-modifier* :super)

(setf *shell-program* "/usr/bin/bash")

(set-prefix-key (kbd "s-x"))
(define-key *root-map* (kbd "0") "remove-split")
(define-key *root-map* (kbd "1") "only")
(define-key *root-map* (kbd "2") "vsplit")
(define-key *root-map* (kbd "3") "hsplit")
(define-key *root-map* (kbd "o") "fnext")
(define-key *root-map* (kbd "O") "fprev")
(define-key *root-map* (kbd "b") "pull-from-windowlist")
(define-key *root-map* (kbd "k") "delete")
(define-key *root-map* (kbd "Left") "prev")
(define-key *root-map* (kbd "Right") "next")
(define-key *root-map* (kbd "s-c") "quit-confirm")
(define-key *root-map* (kbd "s-z") "exec systemctl suspend")
(define-key *root-map* (kbd ";") "colon")
(define-key *root-map* (kbd ":") "eval")
(define-key *root-map* (kbd "!") "exec")

(define-key *root-map* (kbd "t") '*groups-map*)
(define-key *groups-map* (kbd "0") "gkill")
(define-key *groups-map* (kbd "1") "gkill-other")
(define-key *groups-map* (kbd "2") "gnew")
(define-key *groups-map* (kbd "o") "gnext")
(define-key *groups-map* (kbd "r") "gnrename")
(define-key *groups-map* (kbd "RET") "gselect")

(define-key *top-map* (kbd "s-h") '*help-map*)
(define-key *help-map* (kbd "v") "describe-variable")
(define-key *help-map* (kbd "f") "describe-function")
(define-key *help-map* (kbd "k") "describe-key")
(define-key *help-map* (kbd "b") "where-is")
(define-key *help-map* (kbd "x") "describe-command")

(define-key *top-map* (kbd "s-Up") "move-focus up")
(define-key *top-map* (kbd "s-Down") "move-focus down")
(define-key *top-map* (kbd "s-Left") "move-focus left")
(define-key *top-map* (kbd "s-Right") "move-focus right")

(define-key *top-map* (kbd "s-S-Up") "exchange-direction up")
(define-key *top-map* (kbd "s-S-Down") "exchange-direction down")
(define-key *top-map* (kbd "s-S-Left") "exchange-direction left")
(define-key *top-map* (kbd "s-S-Right") "exchange-direction right")

(define-key *top-map* (kbd "s-1") "gselect 1")
(define-key *top-map* (kbd "s-2") "gselect 2")
(define-key *top-map* (kbd "s-3") "gselect 3")
(define-key *top-map* (kbd "s-4") "gselect 4")
(define-key *top-map* (kbd "s-5") "gselect 5")
(define-key *top-map* (kbd "s-6") "gselect 6")
(define-key *top-map* (kbd "s-7") "gselect 7")
(define-key *top-map* (kbd "s-8") "gselect 8")
(define-key *top-map* (kbd "s-9") "gselect 9")

(define-key *top-map* (kbd "s-!") "gmove 1")
(define-key *top-map* (kbd "s-@") "gmove 2")
(define-key *top-map* (kbd "s-#") "gmove 3")
(define-key *top-map* (kbd "s-$") "gmove 4")
(define-key *top-map* (kbd "s-%") "gmove 5")
(define-key *top-map* (kbd "s-^") "gmove 6")
(define-key *top-map* (kbd "s-&") "gmove 7")
(define-key *top-map* (kbd "s-*") "gmove 8")
(define-key *top-map* (kbd "s-(") "gmove 9")

(define-key *top-map* (kbd "s-s") "exec rofi -show-icons -combi-modi window,drun,run -show combi")
(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-:") "eval")
(define-key *top-map* (kbd "s-w") "exec jumpapp firefox")
(define-key *top-map* (kbd "s-t") "exec jumpapp alacritty")
(define-key *top-map* (kbd "s-e") "exec jumpapp emacs")
(define-key *top-map* (kbd "s-f") "exec jumpapp thunar")
(define-key *top-map* (kbd "s-TAB") "next")
(define-key *top-map* (kbd "s-ISO_Left_Tab") "prev")
(define-key *top-map* (kbd "Print") "exec xfce4-screenshooter")

(load-module "battery-portable")
(load-module "pamixer")
(load-module "net")
(load-module "globalwindows")
(define-key *top-map* (kbd "s-F1") "pamixer-toggle-mute")
(define-key *top-map* (kbd "s-F2") "pamixer-volume-down")
(define-key *top-map* (kbd "s-F3") "pamixer-volume-up")

(run-shell-command "xrandr --output eDP-1 --off")
(run-shell-command "xset r rate 200 70")
(run-shell-command "picom")
(setf *mode-line-timeout* 2
      *time-modeline-string* "%a %b %e %k:%M"
      *screen-mode-line-format* '("[%n] %W ^> %l %P [%B] [%d]"))
