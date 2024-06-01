(setq user-full-name "ycpeng"
      user-mail-address "ycpeng@bu.edu")

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;(set-frame-parameter nil 'alpha 90)
;;(add-to-list 'default-frame-alist '(alpha. 90))

;; (setq doom-theme 'doom-plain-dark)
(setq doom-theme 'spacemacs-dark)

(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))

(setq org-directory "~/")

(setq confirm-kill-emacs nil)

(setq display-line-numbers-type 'relative)

;; (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))
;; (setq doom-font (font-spec :family "BigBlueTerm437 Nerd Font Mono" :size 14))
;; (setq doom-font (font-spec :family "GohuFont uni14 Nerd Font Mono" :size 14))
(setq doom-font (font-spec :family "MesloLGS Nerd Font Mono" :size 14))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package dirvish
 :init
 (dirvish-override-dired-mode)
 :config
 (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
 (setq dirvish-mode-line-height 10)
 (setq dirvish-hide-details nil)
 (setq dirvish-attributes
       '(vc-state nerd-icons subtree-state file-size file-time))
 (setq dirvish-preview-dispatchers
     (cl-substitute 'pdf-preface 'pdf dirvish-preview-dispatchers))
 (setq dirvish-subtree-state-style 'nerd)
 (setq delete-by-moving-to-trash t)
 (setq dirvish-path-separators (list
                                (format "  %s " (nerd-icons-codicon "nf-cod-home"))
                                (format "  %s " (nerd-icons-codicon "nf-cod-root_folder"))
                                (format " %s " (nerd-icons-faicon "nf-fa-angle_right"))))
 (setq dired-listing-switches
       "-l --almost-all --human-readable --group-directories-first --no-group")
 (dirvish-peek-mode) ; Preview files in minibuffer
 (dirvish-side-follow-mode)) ; similar to `treemacs-follow-mode'

;; (use-package all-the-icons
;;   :if
;;   (display-graphic-p)
;;   :config
;;   (set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'append)
;;   (set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'append)
;;   (set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'append)
;;   (set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'append)
;;   (set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'append)
;;   (set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'append))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (page-break-lines-mode)
  :custom
  (dashboard-center-content t)
  (dashboard-vertically-center-content t)
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
;;  (dashboard-startup-banner 'logo)
  (dashboard-startup-banner "~/.doom.d/assets/ycpeng.txt")
  (dashboard-set-file-icons t)
;;  (dashboard-page-separator "\n\f\n")
  (dashboard-projects-backend 'projectile)
  (dashboard-items '((recents   . 5)
                          (bookmarks . 5)
                          (projects  . 5)
                          (agenda    . 5)))
  (dashboard-banner-logo-title "Welcome to ycpeng's Emacs~")
  (dashboard-footer-messages '("While any text editor can save your files, only Emacs can save your soul.")))

(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))

(use-package nerd-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode)
  :config
  (setq nerd-icons-ibuffer-icon t)
  (setq nerd-icons-ibuffer-color-icon t))

(projectile-mode +1)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Recommended keymap prefix on Windows/Linux
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic))))
