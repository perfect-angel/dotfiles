;; -*- lexical-binding: t; -*-

;;; init --- Angel's init.el
;;; Commentary:
;;; this is not a good endorsement
;;;   of me as a serious person

;;; Code:

;;	     YOU ARE *LOVED*
;;     YOU ARE *WORTHY* OF THAT LOVE
;;        YOU ARE *NOT* IN TROUBLE
;;             DRINK *WATER*

;;; Settings:
(column-number-mode 1)      ; Column numbers
(global-auto-revert-mode 1) ; Auto revert changed buffers
(global-eldoc-mode 1)       ; global documentation
(menu-bar-mode -1)          ; Disable the menu bar
(recentf-mode 1)            ; what was i doing?
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(global-visual-line-mode 1) ; Wrap lines
(set-fill-column 80)        ; TTY length

;;; Variables:
(setq user-full-name "Angel Campbell")
(setq user-mail-address "angel@acidburn.tech")
(setq-default fill-column 80)                       ; tty width
(setq auto-save-default nil)                        ; stop creating # auto save files
(setq custom-file "~/.emacs.d/emacs-custom.el")     ; customization
(setq inhibit-startup-message t) ; no startup message
(setq make-backup-files nil) ; stop creating ~ backup files
(setq y-or-n-p-use-read-key t) ; for embark
(setq use-short-answers t)                ; 2 lazy 2 type yes
(setq visible-bell t) ; set up the visible bell
(set-face-attribute 'default nil ; font
		    :font "NotoMono Nerd Font Mono"
		    :height 150)
;; keybinds


;;; Hooks:
(add-hook 'prog-mode-hook 'electric-indent-mode) ; auto indent
(add-hook 'prog-mode-hook 'flymake-mode) ; syntax checking
(add-hook 'prog-mode-hook 'electric-pair-mode) ; auto pairs
(add-hook 'prog-mode-hook 'outline-minor-mode) ; code folding (maybe use hs-minor-mode again)
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; line numbers

;;; Mac os specific settings:
(when (eq system-type 'darwin) ; mac specific settings
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char)) ; fix mac delete

;;; Packages:
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

;;; Discovery:
(use-package elisp-demos) ; examples in help
(use-package marginalia
  :init
  ;; Configure Marginalia
  (customize-set-variable 'marginalia-annotators
                          '(marginalia-annotators-heavy
                            marginalia-annotators-light
                            nil))
  :config
  (marginalia-mode 1))

;;; Cosmetic:
(load-theme 'modus-vivendi-tinted)
(use-package doom-modeline ; modeline
  :init (doom-modeline-mode 1))
(use-package breadcrumb
  :init (breadcrumb-mode))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)) 
(use-package all-the-icons) ; Cute icons
(use-package spray ; speedreading
  :init
  (setq spray-wpm 500))

;;; Util:
;; (use-package exec-path-from-shell ; set path to shellpath
;;   :config
;;   (exec-path-from-shell-initialize))
(use-package savehist ; save command history
  :init
  (savehist-mode))
(use-package visual-fill-column) ;zen mode
(use-package eat  ; terminal
  :bind
  (:map eat-mode-map
	("M-o" . ace-window)))
(use-package emmet-mode) ; html snippets

;;; Snippets:
(use-package yasnippet
  :config
  (setq yasnippet-snippet-dirs '("~/dotfiles/snippets/"))
  (yas-global-mode 1))
(use-package yasnippet-snippets)

;;; Languages:
(use-package markdown-mode)
(use-package kubernetes)
(use-package geiser-guile)
(use-package rust-mode)

;;; Org: 
(use-package org
  :bind ("C-c c" . 'org-capture)
  :custom
  (org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
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
(use-package org-bullets
  :config
  (org-bullets-mode 1))

;; presentations
(defun me/org-present-start ()
  (interactive)
  (visual-fill-column-mode 1)
  (widen)
  (org-narrow-to-element))
(defalias 'ps 'me/org-present-start "org present")

(defun me/org-present-next ()
  (interactive)
  (widen)
  (org-next-visible-heading)
  (org-narrow-to-element))
(defalias 'pn 'me/org-present-next "org-present-next")

(defun me/org-present-previous()
  (interactive)
  (widen)
  (org-previous-visible-heading)
  (org-narrow-to-element))
(defalias 'pp 'me/org-present-previous "org present previous")

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

					;(autoload 'notmuch "notmuch" "notmuch mail" t) ;; email
					;(require 'notmuch)

;; calendar: org import (ics?)

;;; Navigation:
(use-package magit) ; git gud
(use-package ace-window :bind (("M-o" . ace-window)))
(use-package vertico
  :init
  ;; Prompt indicator for `completing-read-multiple'.
  (when (< emacs-major-version 31)
    (advice-add #'completing-read-multiple :filter-args
		(lambda (args)
                  (cons (format "[CRM%s] %s"
				(string-replace "[ \t]*" "" crm-separator)
				(car args))
			(cdr args)))))
  (setq vertico-cycle t)
  (vertico-mode))
(use-package consult
  :config (require 'consult)
  :bind (;; general
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-x M-:" . consult-complex-command)
         ("C-x b" . consult-buffer)
	 ("C-x B" . consult-buffer-other-tab)                
         ("M-y" . consult-yank-pop)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
	 ("C-s" . consult-line)
	 
         ;; goto         
         ("M-g f" . consult-flymake)               
         ("M-g g" . consult-goto-line)             
         ("M-g M-g" . consult-goto-line)           
         ("M-g o" . consult-outline)               
         ("M-g m" . consult-global-mark)
	 
         ;; search
         ("M-s d" . consult-find)                  
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line))
  :init 
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))
(use-package consult-eglot)

(use-package embark
  :config
  (keymap-global-set "<remap> <describe-bindings>" #'embark-bindings)
  (keymap-global-set "C-." 'embark-act)
  (keymap-global-set "C-;" 'embark-dwim)
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after embark
  :config 
  (add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))

(use-package consult-eglot-embark
  :config
  (consult-eglot-embark-mode))

;;; Completion:
(use-package corfu
  :custom
  (corfu-auto t)         ; Enable auto completion
  (corfu-auto-prefix 2)  ; Complete with less prefix keys
  :init
  (customize-set-variable 'corfu-cycle t)        ; Allows cycling through candidates
  
  (global-corfu-mode)
  (when (require 'corfu-popupinfo nil :noerror)
    (corfu-popupinfo-mode 1)
    (eldoc-add-command #'corfu-insert)))

(use-package orderless
  :init
  (customize-set-variable 'completion-styles '(orderless basic))
  (customize-set-variable 'completion-category-overrides
                          '((file (styles . (partial-completion))))))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify))

;;; Debugging
(use-package dap-mode ;; todo maybe replace with dape
  :config
  (setq dap-gdb-debug-program '("rust-gdb" "-i" "dap"))
  (require 'dap-gdb))

;;; LSP:
(use-package eglot
  :hook ((rust-ts-mode
	  rust-mode
	  typescript-ts-mode
	  javascript-ts-mode
	  elixir-ts-mode
	  terraform-ts-mode
	  terraform-mode) . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(elixir-ts-mode "~/lib/elixir-ls/language_server.sh")))

;; Treesitter
(use-package tree-sitter)
(use-package tree-sitter-indent)
(use-package tree-sitter-ispell)
(use-package tree-sitter-langs)
(use-package treesit-auto)

;;; AI:
(use-package gptel
  :config
  (setq gptel-backend (gptel-make-ollama "Ollama"
  			:host "localhost:11434"
  			:stream t
  			:models '(deepseek-coder-v2:latest))
        gptel-default-model 'deepseek-coder-v2:latest
        gptel-model 'deepseek-coder-v2:latest
        gptel-default-mode 'org-mode))

;;; Novelty
(use-package emms ;; music
  :custom
  (emms-player-list '(emms-player-vlc))
  (emms-info-functions '(emms-info-native))
  :config
  (emms-all))
(keymap-global-set "s-<delete>" ;; navi todo replace
 		   (lambda ()
 		     (interactive)
 		     (play-sound-file "~/dotfiles/listen.wav")))

;;; Amen
(server-start)

;; TODO:
;; - set certain packages to lazy to speed up load time
;; - ement.el matrix client - matrix maybe over
;; - mastodon.el
;; - bind <WakeUp>
;; - emms
;; - notmuch
;; - calendar
;; - https://github.com/hsingko/emacs-obsidian-excalidraw
