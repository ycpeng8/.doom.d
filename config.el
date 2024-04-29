(setq user-full-name "ycpeng"
      user-mail-address "ycpeng@bu.edu")

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-frame-parameter nil 'alpha 90)
(add-to-list 'default-frame-alist '(alpha. 90))

(setq doom-theme 'doom-challenger-deep)

(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))

(setq org-directory "~/org/")

(setq confirm-kill-emacs nil)

(setq display-line-numbers-type 'relative)

(setq doom-font (font-spec :family "Iosevka Nerd Font Mono" :size 14))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package dirvish
  :init
  (dirvish-override-dired-mode)
  :config
  (setq dirvish-hide-details nil)
  (setq dirvish-attributes
        '(vc-state all-the-icons subtree-state file-size))
  (setq dirvish-preview-dispatchers
      (cl-substitute 'pdf-preface 'pdf dirvish-preview-dispatchers)))

(use-package all-the-icons
  :if (display-graphic-p))
