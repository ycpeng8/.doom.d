(setq user-full-name "ycpeng"
      user-mail-address "ycpeng@bu.edu")

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-to-list 'default-frame-alist '(alpha . 90))

(setq doom-theme 'doom-challenger-deep)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))

(setq org-directory "~/org/")

(setq confirm-kill-emacs nil)

(setq display-line-numbers-type 'relative)

(setq doom-font (font-spec :family "Iosevka Nerd Font Mono" :size 14))
