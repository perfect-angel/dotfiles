;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; SETTINGS
(set-frame-font "Fira Code 24") ;; granny-coded
(setq confirm-kill-emacs 'yes-or-no-p ;; don't accidentally leave
      visible-bell 1) ;; don't make noise
(add-hook 'prog-mode-hook 'linum-mode) 
(add-hook 'prog-mode-hook 'column-number-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(electric-pair-mode 1)
(recentf-mode 1)
(show-paren-mode 1)

;; WM
;; (straight-use-package 'exwm)
;; (require 'exwm-config)
;; (require 'exwm-randr)
;; (exwm-randr-enable)
;; (exwm-init)

;; UTIL
(straight-use-package 'which-key)
(which-key-mode)
(straight-use-package 'vterm)
(straight-use-package 'doom-themes)
(straight-use-package 'nerd-icons)
(load-theme 'doom-gruvbox t)
(straight-use-package 'doom-modeline)
(doom-modeline-mode)
(straight-use-package 'iedit)
(straight-use-package 'evil-iedit-state)

;; COMPLETION
(straight-use-package 'company)
(global-company-mode 1)

;; NAVIGATION
(straight-use-package 'projectile)
(straight-use-package 'ivy)
(straight-use-package 'counsel)
(ivy-mode 1)
(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))
(counsel-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq search-default-mode #'char-fold-to-regexp)

(projectile-mode 1)

;; EVIL
(straight-use-package 'evil)
(straight-use-package 'evil-surround)
(straight-use-package 'evil-commentary)
(straight-use-package 'evil-snipe)
(evil-commentary-mode 1)
(evil-surround-mode 1)
(evil-mode 1)
(setq evil-snipe-scope 'buffer)
(evil-snipe-mode 1)
(evil-snipe-override-mode 1)
(evil-global-set-key 'normal "H" 'tab-next)
(evil-global-set-key 'normal "L" 'tab-previous)

;; LEADER
(straight-use-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "/" 'swiper
  "a" 'vterm
  "b" 'switch-to-buffer
  "e" 'find-file
  "f" 'dired-jump-other-window
  "h" 'counsel-apropos
  "k" 'kill-buffer
  "m" 'recentf-open-files
  "oa" 'org-agenda
  "oc" 'org-capture
  "sh" 'split-window-horizontally
  "sl" (lambda () (interactive) (split-window-horizontally) (windmove-right))
  "sk" 'split-window-vertically
  "sj" (lambda () (interactive) (split-window-vertically) (windmove-down))
  "t" 'tabnew
  "u" 'eww
  "w" 'save-buffer
  "x" 'counsel-M-x)

;; ORG
(straight-use-package 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(setq org-refile-targets '(("gtd.org" :maxlevel . 2)
			   ("someday.org" :maxlevel . 2)))
;; LANG
(straight-use-package 'rainbow-delimiters)
(rainbow-delimiters-mode 1)
