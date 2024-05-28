;; init.el
;; author: Angel Campbell
;; description: This is not a good advertisement for me as a serious person
;; ------------------------------------------

;; GAY
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
(setq confirm-kill-emacs 'yes-or-no-p ;; don't accidentally leave
      evil-want-C-u-scroll 1 ;; old fashioned evil
      ivy-use-virtual-buffers t ;; i dont know ivy shit ugh :FIXME:
      evil-want-keybinding nil ;; evil wants
      evil-want-integration t ;; what evil wants
      tramp-default-method "ssh" ;; faster tramp with ssh
      visible-bell 1) ;; don't make noise
(set-frame-font "Fira Code 26") ;; granny-coded
(add-hook 'prog-mode-hook 'line-number-mode) ;; lines
(add-hook 'prog-mode-hook 'column-number-mode) ;; columns
(fset 'yes-or-no-p 'y-or-n-p) ;; i'm lazy
(tool-bar-mode -1)     ;; no gui
(menu-bar-mode -1)     ;; no nothin
(toggle-scroll-bar -1) ;; no how
(electric-pair-mode 1) ;; birds of a feather
(recentf-mode 1) ;; what was i doing?
(show-paren-mode 1) ;; i believe in symmetry 

;; WM
(straight-use-package 'exwm) 
(require 'exwm-config)
(require 'exwm-randr)
(exwm-randr-enable)
(exwm-config-ido)
(exwm-init)

;; UTIL
(straight-use-package 'zen-mode)
(straight-use-package 'which-key)
(which-key-mode)
(straight-use-package 'vterm)
(straight-use-package 'doom-themes)
(straight-use-package 'nerd-icons)
(load-theme 'doom-badger t)
(straight-use-package 'doom-modeline)
(doom-modeline-mode)
(straight-use-package 'iedit)

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
(straight-use-package 'evil-iedit-state)
(straight-use-package 'evil-collection)
(evil-mode 1)
(evil-collection-init)
(evil-commentary-mode 1)
(evil-surround-mode 1)
(evil-global-set-key 'normal "H" 'tab-next)
(evil-global-set-key 'normal "L" 'tab-previous)

;; LEADER
(straight-use-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "/" 'swiper-isearch
  "a" 'vterm
  "b" 'ivy-switch-buffer
  "e" 'counsel-find-file
  "f" 'counsel-dired
  "hf" 'counsel-describe-function
  "hi" 'counsel-info-lookup-symbol
  "hl" 'counsel-find-library
  "hv" 'counsel-describe-variable
  "k" 'kill-buffer-and-window
  "m" 'counsel-recentf
  "p" 'counsel-yank-pop
  "oa" 'org-agenda
  "oc" 'org-capture
  "sh" 'split-window-horizontally
  "sl" (lambda () (interactive) (split-window-horizontally) (windmove-right))
  "sk" 'split-window-vertically
  "sj" (lambda () (interactive) (split-window-vertically) (windmove-down))
  "t" 'tab-new
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
