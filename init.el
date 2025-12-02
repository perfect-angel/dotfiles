;; init.el -- ANGEL D. CAMPBELL'S WONDERFUL HORRIBLE EMACS CONFIG -*-lexical-binding: t-*-
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
;; last edited: Oct 11, 2025
;;
;; this file is not part of gnu emacs.

;; YOU ARE =LOVED=
;; YOU ARE =WORTHY= OF THAT LOVE
;; YOU ARE =NOT= IN TROUBLE
;; DRINK =WATER=

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

;; Settings
(column-number-mode 1)        ; Column numbers
(display-line-numbers-mode 1) ; Line numbers
(global-auto-revert-mode 1)   ; Auto revert changed buffers
(global-eldoc-mode 1)         ; global documentation
(recentf-mode 1)              ; what was i doing?
(menu-bar-mode -1)            ; Disable the menu bar
(scroll-bar-mode -1)          ; Disable visible scrollbar
(tool-bar-mode -1)            ; Disable the toolbar
(tooltip-mode -1)             ; Disable tooltips
(set-fill-column 80)          ; TTY length
(auto-fill-mode 1)            ; auto wrap lines
(setq user-full-name "Angel D. Campbell")
(setq user-mail-address "angelcampbell@fastmail.com")
(setq-default fill-column 80) ; tty width
(setq-default truncate-lines t) ; truncate lines
(setq auto-save-default nil)  ; stop creating # auto save files
(setq custom-file "~/dotfiles/emacs-custom.el")     ; customization
(setq inhibit-startup-message t) ; no startup message
(setq make-backup-files nil)     ; stop creating ~ backup files
(setq word-wrap t)
(setq y-or-n-p-use-read-key t)   ; for embark
(setq use-short-answers t)       ; 2 lazy 2 type yes
(setq visible-bell t)            ; set up the visible bell
(set-face-attribute 'default nil ; font
  		  :font "Mononoki Nerd Font Mono"
  		  :height 200)
(when (eq system-type 'darwin)               ; mac specific settings
  (setq mac-command-modifier 'meta)          ; use command as meta
  (global-set-key [kp-delete] 'delete-char)) ; fix mac delete

;; Keybinds
(global-unset-key (kbd "M-z"))
(global-set-key (kbd "C-z") #'undo)
(bind-key "M-p d" #'dired-sidebar-toggle-sidebar)
(defun me/find-config () (interactive) (find-file "~/dotfiles/init.el"))
(bind-key "M-p e" 'me/find-config)
(bind-key "M-p f" 'find-file)
(bind-key "M-p g" 'magit-status)
(bind-key "M-p i" 'avy-goto-char-2)
(bind-key "M-p l" 'visual-fill-column-mode)
(bind-key "M-p p" 'project-find-file)
(bind-key "M-p r" 'recentf)
(bind-key "M-p s" 'split-window-horizontally)
(defun me/find-tasks () (interactive) (find-file "~/org/tasks.org"))
(bind-key "M-p t" 'me/find-tasks)
(bind-key "M-p v" 'split-window-vertically)
(bind-key "M-p h" 'hs-toggle-hiding)

;; Hooks
(add-hook 'prog-mode-hook 'electric-indent-mode) ; auto indent
(add-hook 'prog-mode-hook 'flymake-mode) ; syntax checking
(add-hook 'prog-mode-hook 'electric-pair-mode) ; auto pairs
(add-hook 'prog-mode-hook 'hs-minor-mode) ; code folding
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; line numbers

;; Utility
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

;; Discovery
(use-package elisp-demos)                          ;; Examples in help
(use-package marginalia :init (marginalia-mode 1)) ;; minibuffer margin help

;; Navigation
(use-package ace-window :bind ("M-o" . ace-window))
(use-package vertico
  :custom (vertico-cycle t)
  :init (vertico-mode))
(use-package embark-consult)
(use-package embark
  :init
  (keymap-global-set "<remap> <describe-bindings>" #'embark-bindings)
  (keymap-global-set "C-." 'embark-act)
  (keymap-global-set "C-;" 'embark-dwim)
  (setq prefix-help-command #'embark-prefix-help-command))
(use-package consult
  :bind (("C-c M-x" . consult-mode-command)
         ([remap Info-search] . consult-info)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x C-b" . consult-buffer)              ;; orig. switch-to-buffer
         ("C-s" . consult-line)
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ("M-s r" . consult-ripgrep))
  :init
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

;; Completion
(use-package corfu
  :custom
  (corfu-cycle t)
  (tab-always-indent 'complete)
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode))
(use-package orderless
  :init
  (customize-set-variable 'completion-styles '(orderless basic))
  (customize-set-variable 'completion-category-overrides
                          '((file (styles . (partial-completion))))))
(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

;; Cosmetic
(load-theme 'wombat)
(use-package breadcrumb
  :init (breadcrumb-mode))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)) 
(use-package all-the-icons) ; don't forget to install

;; Snippets
(use-package yasnippet
  :config
  (setq yasnippet-snippet-dirs '("~/dotfiles/snippets/"))
  (yas-global-mode 1))
(use-package yasnippet-snippets)

;; Languages
(use-package markdown-mode)
(use-package kubernetes)
(use-package geiser-guile)
(use-package rust-mode)

;; LSP
(use-package eglot
  :hook ((rust-mode
  	typescript-mode
  	js2-mode
  	elixir-mode
  	terraform-mode) . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(elixir-mode
					"~/lib/elixir-ls/language_server.sh")))

;; Org
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

;; Amen 🙏

(provide 'init)
;;; init.el ends here
