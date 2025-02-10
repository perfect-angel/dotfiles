;;; init --- Angel's init.el
;;; Commentary:
;;; this is not a good endorsement of me as a serious person
;;; Code:

;;				YOU ARE *LOVED*
;;			 YOU ARE *WORTHY* OF THAT LOVE
;;			    YOU ARE *NOT* IN TROUBLE
;;				 DRINK *WATER*

;; Settings
(setq inhibit-startup-message t) ; no startup message
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)            ; Disable the menu bar
(global-auto-revert-mode 1) ; Auto revert changed buffers
(setq make-backup-files nil) ; Stop creating ~ backup files
(setq auto-save-default nil) ; Stop creating # auto save files
(setq visible-bell t) ; Set up the visible bell
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Make ESC quit prompts
(setq custom-file "~/.emacs-custom.el") ; Use non-source managed custom file
(fset 'yes-or-no-p 'y-or-n-p) ; 2 lazy 2 type yes
(recentf-mode 1) ; what was i doing?
(global-eldoc-mode 1) ; global documentation
(add-hook 'prog-mode-hook 'hs-minor-mode) ; code folding
(add-hook 'prog-mode-hook 'electric-indent-mode) ; auto indent
(add-hook 'prog-mode-hook 'electric-pair-mode) ; auto pairs
(flymake-mode 1) ; syntax checking
(keymap-set prog-mode-map "C-c e n" #'flymake-goto-next-error)
(keymap-set prog-mode-map "C-c e p" #'flymake-goto-prev-error)
(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 200) ; font
(load-theme 'adwaita) ; theme

;; Line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))

;; More hooks


;; Mac os specific settings
(when (eq system-type 'darwin) ; mac specific settings
  (global-set-key [kp-delete] 'delete-char)) ; fix mac delete

;; Packages

;; Initialize package
(require 'package)

;;; Setup Emacs Lisp Package Archives (ELPAs)
;; where to get packages to install
(when (version< emacs-version "28")
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(add-to-list 'package-archives '("stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; General purpose packages
(use-package magit) ; git gud
(use-package vterm) ; better terminal

;; set path to shellpath
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; save command history
(use-package savehist
  :config
  (savehist-mode))

;; snippets
(use-package yasnippet
  :config
  (setq yasnippet-snippet-dirs '("~/dotfiles/snippets/"))
  (yas-global-mode 1)
  (global-set-key (kbd "C-x C-y") 'company-yasnippet))
(use-package yasnippet-snippets)

;; modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Cute icons
;; note: run all-the-icons-install-fonts
(use-package all-the-icons)

;; breadcrumbs 
(use-package breadcrumb
  :init (breadcrumb-mode))

(use-package elisp-demos)

(use-package emojify)
(use-package rainbow-delimiters ; colored parens
  :hook (prog-mode . rainbow-delimiters-mode)) 

;; language support
(use-package markdown-mode)
(use-package geiser-guile)


;; org mode
(use-package org-appear)

;; completion
;;; Vertico
(use-package vertico
  :config
  (require 'vertico-directory)
  ;; Cycle back to top/bottom result when the edge is reached
  (customize-set-variable 'vertico-cycle t)

  ;; Start Vertico
  (vertico-mode 1)

  ;; Turn off the built-in fido-vertical-mode and icomplete-vertical-mode, if
  (fido-mode -1)
  (fido-vertical-mode -1)
  (icomplete-mode -1)
  (icomplete-vertical-mode -1))


;;; Marginalia
(use-package marginalia
  :init
  ;; Configure Marginalia
  (customize-set-variable 'marginalia-annotators
                          '(marginalia-annotators-heavy
                            marginalia-annotators-light
                            nil))
  :config
  (marginalia-mode 1))

;;; Orderless
(use-package orderless
  :init
  ;; Set up Orderless for better fuzzy matching
  (customize-set-variable 'completion-styles '(orderless basic))
  (customize-set-variable 'completion-category-overrides
                          '((file (styles . (partial-completion))))))

;;; Corfu
(use-package corfu
  :init
  ;; Setup corfu for popup like completion
  (customize-set-variable 'corfu-cycle t)        ; Allows cycling through candidates
  (customize-set-variable 'corfu-auto t)         ; Enable auto completion
  (customize-set-variable 'corfu-auto-prefix 2)  ; Complete with less prefix keys
  :config
  (global-corfu-mode 1)
  (when (require 'corfu-popupinfo nil :noerror)
    (corfu-popupinfo-mode 1)
    (eldoc-add-command #'corfu-insert)
    (keymap-set corfu-map "M-p" #'corfu-popupinfo-scroll-down)
    (keymap-set corfu-map "M-n" #'corfu-popupinfo-scroll-up)
    (keymap-set corfu-map "M-d" #'corfu-popupinfo-toggle)))


;;; Cape
(use-package cape
  :init
  ;; Add useful defaults completion sources from cape
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)

  ;; Silence the pcomplete capf, no errors or messages!
  ;; Important for corfu
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)

  ;; Ensure that pcomplete does not write to the buffer
  ;; and behaves as a pure `completion-at-point-function'.
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify))

;; LSP
(use-package eglot)
(use-package tree-sitter)
(use-package tree-sitter-indent)
(use-package tree-sitter-ispell)
(use-package tree-sitter-langs)
(use-package treesit-auto)
(add-hook 'js-ts-mode-hook 'eglot-ensure)
(add-hook 'rust-ts-mode 'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'eglot-ensure)
(add-hook 'terraform-mode-hook 'eglot-ensure)

;; amen
(provide 'init)
;;; init.el ends here
