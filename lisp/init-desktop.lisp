(in-package :stumpwm)

(load-module "battery-portable")
(load-module "pamixer")
(load-module "net")
(load-module "screenshot")
(load-module "notify")

(setf *mode-line-timeout* 3
      *time-modeline-string* "%a %b %e %k:%M"
      *screen-mode-line-format* '("[%n] %W ^> %l %P [%B] [%d]"))

(define-key *root-map* (kbd "s-c") "quit-confirm")
(define-key *root-map* (kbd "s-l") "exec dm-tool lock")
(define-key *root-map* (kbd "s-z") "exec systemctl suspend")

(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-s") "exec")
(define-key *top-map* (kbd "s-:") "eval")

(define-key *top-map* (kbd "s-RET") "exec alacritty")
(define-key *top-map* (kbd "Print") "screenshot")
(define-key *top-map* (kbd "s-.") "screenshot-area")

(setf pamixer:*step* 2)
(define-key *top-map* (kbd "s-F1") "pamixer-toggle-mute")
(define-key *top-map* (kbd "s-F2") "pamixer-volume-down")
(define-key *top-map* (kbd "s-F3") "pamixer-volume-up")

(defprogram-shortcut chrome
  :command "google-chrome"
  :props '(:class "Google-chrome")
  :map *top-map*
  :key (kbd "s-w"))

(defprogram-shortcut alacritty
  :command "alacritty"
  :props '(:class "Alacritty")
  :map *top-map*
  :key (kbd "s-t"))

(defprogram-shortcut emacs
  :command "emacs"
  :props '(:class "Emacs")
  :map *top-map*
  :key (kbd "s-e"))

(defprogram-shortcut thunar
  :command "thunar"
  :props '(:class "Thunar")
  :map *top-map*
  :key (kbd "s-f"))

(defprogram-shortcut pavucontrol
  :command "pavucontrol"
  :props '(:class "Pavucontrol")
  :map *top-map*
  :key (kbd "s-v"))

(defprogram-shortcut telegram
  :command "telegram-desktop"
  :props '(:class "TelegramDesktop")
  :map *top-map*
  :key (kbd "s-c"))

(setf notify:*notify-server-title-color* "^3"
      notify:*notify-server-body-color* "^7")
(notify:notify-server-on)

(run-shell-command "xrandr --output eDP-1 --off")
(run-shell-command "xset r rate 200 70")

(run-shell-command "xinput set-prop \"DELL0A36:00 0488:101A Touchpad\" \"Tapping Enabled\" 1")
(run-shell-command "xinput set-prop \"DELL0A36:00 0488:101A Touchpad\" \"libinput Natural Scrolling Enabled\" 1")
(run-shell-command "xinput set-prop \"DELL0A36:00 0488:101A Touchpad\" \"libinput Accel Speed\" 0.6")

(run-shell-command "picom")
(run-shell-command "fcitx5")
(run-shell-command "~/.fehbg")
