;; config.el -- ANGEL D. CAMPBELL'S WONDERFUL HORRIBLE EMACS CONFIG. -*-lexical-binding: t-*-
;;
;; ⚠warning⚠: this is not a good endorsement of me as a serious person.
;;
;; © 2024-2025 angel d. campbell
;; licensed under a creative commons attribution 4.0 international license.
;; see http://creativecommons.org/licenses/by/4.0/
;;
;; author: angel d. campbell <https://angeldcampbell.com/>
;; maintainer: angel d. campbell
;; created: december  26, 2024
;; last edited: May 29, 2025
;;
;; this file is not part of gnu emacs.

;;                                    YOU ARE =LOVED=
;;                              YOU ARE =WORTHY= OF THAT LOVE
;;                                YOU ARE =NOT= IN TROUBLE
;;                                     DRINK =WATER=


;;; Packages
(require 'package)

(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;;; Settings
(column-number-mode 1)      ; Column numbers
(global-auto-revert-mode 1) ; Auto revert changed buffers
(global-eldoc-mode 1)       ; global documentation
(recentf-mode 1)            ; what was i doing?
(menu-bar-mode -1)          ; Disable the menu bar
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fill-column 80)        ; TTY length
(auto-fill-mode 1)          ; auto wrap lines
(global-visual-line-mode 1) ; visually wrap lines

(setq user-full-name "Angel D. Campbell")
(setq user-mail-address "angelcampbell@fastmail.com")
(setq-default fill-column 80) ; tty width
(setq auto-save-default nil)  ; stop creating # auto save files
(setq custom-file "~/dotfiles/emacs-custom.el")     ; customization
(setq inhibit-startup-message t) ; no startup message
(setq make-backup-files nil) ; stop creating ~ backup files
(setq word-wrap t)
(setq y-or-n-p-use-read-key t) ; for embark
(setq use-short-answers t)        ; 2 lazy 2 type yes
(setq visible-bell t) ; set up the visible bell
(set-face-attribute 'default nil ; font
  		    :font "NotoMono Nerd Font Mono"
  		    :height 200)

;; Apple specific settings
(when (eq system-type 'darwin) ; mac specific settings
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char)) ; fix mac delete

;;; Keybinds
(global-unset-key (kbd "M-z"))
(global-set-key (kbd "C-z") #'undo)
(bind-key "C-t" 'tab-new)


;; Leader 🫡
(defun me/find-config () (interactive) (find-file "~/dotfiles/config.org"))
(defun me/find-tasks () (interactive) (find-file "~/org/tasks.org"))
(bind-key "S-SPC /" 'consult-ripgrep) ;; M-s r
(bind-key "S-SPC a" 'vterm)
(bind-key "S-SPC b" 'consult-buffer)
(bind-key "S-SPC c" 'org-capture)
(bind-key "S-SPC d" #'dired-sidebar-toggle-sidebar)
(bind-key "S-SPC e" 'me/find-config)
(bind-key "S-SPC f" 'find-file)
(bind-key "S-SPC g" 'magit-status)
(bind-key "S-SPC i" 'avy-goto-char-2)
(bind-key "S-SPC l" 'visual-fill-column-mode)
(bind-key "S-SPC o" 'delete-other-windows)
(bind-key "S-SPC p" 'project-find-file)
(bind-key "S-SPC r" 'recentf)
(bind-key "S-SPC s" 'split-window-horizontally)
(bind-key "S-SPC t" 'me/find-tasks)
(bind-key "S-SPC v" 'split-window-vertically)
(bind-key "S-SPC h" 'hs-toggle-hiding)


;;; Hooks
(add-hook 'prog-mode-hook 'electric-indent-mode) ; auto indent
(add-hook 'prog-mode-hook 'flymake-mode) ; syntax checking
(add-hook 'prog-mode-hook 'electric-pair-mode) ; auto pairs
(add-hook 'prog-mode-hook 'hs-minor-mode) ; code folding
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; line numbers


;;; Utility
(use-package exec-path-from-shell ; set path to shellpath
  :config
  (exec-path-from-shell-initialize))
(use-package savehist ; save command history
  :init
  (savehist-mode))
(use-package visual-fill-column  ; zen mode
  :custom
  (visual-fill-column-center-text t))
(use-package vterm)  ; terminal
(use-package emmet-mode) ; html snippets
(use-package dired-sidebar) ; file tree
(use-package spray ; speedreading
  :init
  (setq spray-wpm 500))
(use-package magit) ; git gud
(use-package simple-httpd) ; HTTP server

;;; Discovery
(which-key-mode 1)
(use-package elisp-demos)                          ;; examples in help
(use-package marginalia :init (marginalia-mode 1)) ;; minibuffer margin help


;;; Navigation
(use-package ace-window :bind ("M-o" . ace-window))
(use-package counsel
  :init
  (counsel-mode)
  (keymap-global-set "C-s" #'swiper-isearch))
(use-package orderless
  :init
  (customize-set-variable 'completion-styles '(orderless basic))
  (customize-set-variable 'completion-category-overrides
                          '((file (styles . (partial-completion))))))

;;; Completion
(use-package corfu
  :custom
  (corfu-cycle t)
  (tab-always-indent 'complete)
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode))


;;; Cosmetic
(load-theme 'modus-vivendi)
(use-package doom-modeline
  :custom
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-buffer-modification-icon t)
  :init (doom-modeline-mode 1))
(use-package breadcrumb
  :init (breadcrumb-mode))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)) 
(use-package all-the-icons) ; don't forget to install
(use-package dashboard
  :custom
  (dashboard-items '((recents . 5)
  		     (projects . 5)
  		     (agenda . 5)))
  (dashboard-set-file-icons t)
  (dashboard-set-heading-icons t)
  (dashboard-center-text t)
  (dashboard-week-agenda t)
  (dashboard-vertically-center-content t)
  (dashboard-startup-banner "~/dotfiles/banner.png")
  (dashboard-banner-logo-title ; Thomas 10
   "I have cast fire upon the world, and see, I am guarding it until it blazes.")
  (dashboard-footer-messages '("drink water"))
  :config
  (dashboard-setup-startup-hook))


;;; Snippets
(use-package yasnippet
  :config
  (setq yasnippet-snippet-dirs '("~/dotfiles/snippets/"))
  (yas-global-mode 1))
(use-package yasnippet-snippets)

;;; Languages
(use-package markdown-mode)
(use-package kubernetes)
(use-package geiser-guile)
(use-package rust-mode)

;;; LSP
(use-package eglot
  :hook ((rust-mode
  	  typescript-mode
  	  js2-mode
  	  elixir-mode
  	  terraform-mode) . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(elixir-mode "~/lib/elixir-ls/language_server.sh")))


;;; Debugging
(use-package dap-mode ;; todo maybe replace with dape
  :config
  (setq dap-gdb-debug-program '("rust-gdb" "-i" "dap"))
  (require 'dap-gdb))


;;; Org
(use-package org
  :custom
  (org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     (clojure . t)
     (python . t)
     (js . t)))
  (org-directory "~/org")
  (org-agenda-files (list org-directory)) 
  (org-refile-targets
   '((org-agenda-files . (:maxlevel . 2))
     (nil . (:maxlevel . 2)))) 
  (org-default-notes-file "refile.org")
  (org-capture-templates
   '(("t" "Todo" entry (file "refile.org") "* TODO %?")
     ("j" "Journal" entry (file+olp+datetree "journal.org") "* %?"))))


;;; Internet
(setq rcirc-default-nick "perfect_angel" ;; irc
      rcirc-track-minor-mode 1
      rcirc-server-alist
      '(("irc.libera.chat"
    	 :channels ("#emacs" "##rust")
    	 :nick "perfect_angel"
    	 :port 6697
    	 :encryption tls)))

(use-package elfeed ;; RSS
  :config
  (setq elfeed-feeds
        '("https://www.404media.co/rss"
  	"https://news.ycombinator.com/rss")))

(autoload 'notmuch "notmuch" "notmuch mail" t) ;; email
(require 'notmuch nil t)


;;; Novelty
(keymap-global-set "s-<delete>" ;; navi todo replace
   		   (lambda ()
   		     (interactive)
   		     (play-sound-file "~/dotfiles/listen.wav")))



;;; Amen
;;;  🙏
