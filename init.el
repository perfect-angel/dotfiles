;; -*- lexical-binding: t; -*-

;;; init --- Angel's init.el
;;; Commentary:
;;; this is not a good endorsement of me as a serious person
;;; Code:

;;				YOU ARE *LOVED*
;;			 YOU ARE *WORTHY* OF THAT LOVE
;;			    YOU ARE *NOT* IN TROUBLE
;;				 DRINK *WATER*

;;; Settings:
(column-number-mode 1)               ; Column numbers
(flymake-mode-on)                    ; syntax checking
(fset 'yes-or-no-p 'y-or-n-p)        ; 2 lazy 2 type yes
(global-auto-revert-mode 1)          ; Auto revert changed buffers
(global-eldoc-mode 1)                ; global documentation
(menu-bar-mode -1)                   ; Disable the menu bar
(recentf-mode 1)                     ; what was i doing?
(scroll-bar-mode -1)                 ; Disable visible scrollbar
(tool-bar-mode -1)                   ; Disable the toolbar
(tooltip-mode -1)                    ; Disable tooltips
(global-visual-line-mode 1)          ; Wrap lines
(set-fill-column 80)                 ; TTY length

;;; Variables:
(setq user-full-name "Angel")
(setq user-mail-address "angel@acidburn.tech")
(setq-default fill-column 80) ; tty width
(setq auto-save-default nil) ; Stop creating # auto save files
(setq custom-file "~/.emacs.d/emacs-custom.el") ; Use non-source managed custom file
(setq inhibit-startup-message t) ; no startup message
(setq make-backup-files nil) ; Stop creating ~ backup files
(setq y-or-n-p-use-read-key t) ; for embark
(setq visible-bell t) ; Set up the visible bell
(setq org-babel-load-languages
      '((emacs-lisp . t)
	(shell . t)
	(python . t)
	(js . t)))
(setq org-directory "~/org")
(setq org-default-notes-file "refile.org")
(setq org-agenda-files '("today.org" "refile.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file "~/org/refile.org") "* TODO %?")
        ("j" "Journal" entry (file+olp+datetree "~/org/journal.org") "* %?")))
(set-face-attribute 'default nil :font "Mononoki Nerd Font" :height 200) ; font

;;; Keymaps:
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Make ESC quit prompts

;;; Hooks:
(add-hook 'prog-mode-hook 'electric-indent-mode) ; auto indent
(add-hook 'prog-mode-hook 'electric-pair-mode) ; auto pairs
(add-hook 'prog-mode-hook 'hs-minor-mode) ; code folding
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode) ; line numbers

;;; Mac os specific settings:
(when (eq system-type 'darwin) ; mac specific settings
   (setq mac-command-modifier 'meta)
    (global-set-key [kp-delete] 'delete-char)) ; fix mac delete

;;; Packages:
(require 'package)
(when (version< emacs-version "28")
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(add-to-list 'package-archives '("stable" . "https://stable.melpa.org/packages/"))
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
(load-theme 'wombat)
(use-package doom-modeline ; modeline
  :init (doom-modeline-mode 1))
(use-package breadcrumb
  :init (breadcrumb-mode))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)) 
(use-package all-the-icons) ; Cute icons
(use-package emojify) ; 😀
(use-package spray ; speedreading
  :init
  (setq spray-wpm 500))

;;; Util:
(use-package exec-path-from-shell ; set path to shellpath
  :config
  (exec-path-from-shell-initialize))
(use-package savehist ; save command history
  :config
  (savehist-mode))
(use-package visual-fill-column
  :init
  (setq visual-fill-column-center-text t))

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
(use-package rust-mode
  :init
  (setq rust-mode-treesitter-derive t))

;;; Org:
(use-package org-appear
  :config
  (add-hook 'org-mode-hook 'org-appear-mode))
(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/org/words/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture))
  :config
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

;;; Internet:
(setq rcirc-default-nick "perfect_angel" ; yapper
      rcirc-track-minor-mode 1
      rcirc-server-alist
      '(("irc.libera.chat"
  	 :channels ("#emacs" "##rust")
  	 :nick "perfect_angel"
  	 :port 6697
  	 :encryption tls)))
(use-package elfeed)
(use-package mu4e
  :config

  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Maildir")
  (setq
   message-send-mail-function   'smtpmail-send-it
   smtpmail-smtp-service        465
   smtpmail-stream-type         'ssl
   smtpmail-smtp-server         "smtp.fastmail.com"))

;;; Navigation:
(use-package magit) ; git gud
(use-package ace-window
  :bind
  (("M-o" . ace-window)))
(use-package vertico
  :config
  (require 'vertico-directory)
  (setq vertico-cycle t)
  (vertico-mode 1))
(use-package consult
  :bind (;; stolen from consult, todo clean this
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)
         ("C-x b" . consult-buffer)                
         ("C-x 4 b" . consult-buffer-other-window) 
         ("C-x 5 b" . consult-buffer-other-frame)  
         ("C-x t b" . consult-buffer-other-tab)    
         ("C-x r b" . consult-bookmark)            
         ("C-x p b" . consult-project-buffer)      
         
         ("M-y" . consult-yank-pop)                
	 ("C-s" . consult-line)
         
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               
         ("M-g g" . consult-goto-line)             
         ("M-g M-g" . consult-goto-line)           
         ("M-g o" . consult-outline)               
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         
         ("M-s d" . consult-find)                  
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         
         ("M-s e" . consult-isearch-history)       
         ("M-s l" . consult-line)                  
         ("M-s L" . consult-line-multi)            
         
         :map minibuffer-local-map
         ("M-s" . consult-history)                 
         ("M-r" . consult-history))
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
  :init
  (customize-set-variable 'corfu-cycle t)        ; Allows cycling through candidates
  (customize-set-variable 'corfu-auto t)         ; Enable auto completion
  (customize-set-variable 'corfu-auto-prefix 2)  ; Complete with less prefix keys
  :config
  (global-corfu-mode 1)
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
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify))

;;; Debugging
(use-package dap-mode
  :config
  (setq dap-gdb-debug-program '("rust-gdb" "-i" "dap"))
  (require 'dap-gdb))
;;; LSP:
(use-package eglot
  :hook ((rust-ts-mode
	  rust-mode
	  typescript-ts-mode
	  javascript-ts-mode
	  terraform-mode) . eglot-ensure))

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


(provide 'init)

;; TODO:
;; - set certain packages to lazy to speed up load time
;; - ement matrix client
;; - mastodon
