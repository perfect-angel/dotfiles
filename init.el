;; -*- lexical-binding: t; -*-

;;; init --- Angel's init.el
;;; Commentary:
;;; this is not a good endorsement of me as a serious person
;;; Code:

;;				YOU ARE *LOVED*
;;			 YOU ARE *WORTHY* OF THAT LOVE
;;			    YOU ARE *NOT* IN TROUBLE
;;				 DRINK *WATER*

;; Settings
(column-number-mode 1)               ; Column numbers
(flymake-mode 1)                     ; syntax checking
(fset 'yes-or-no-p 'y-or-n-p)        ; 2 lazy 2 type yes
(global-auto-revert-mode 1)          ; Auto revert changed buffers
(global-eldoc-mode 1)                ; global documentation
(load-theme 'adwaita)                ; theme
(menu-bar-mode -1)                   ; Disable the menu bar
(recentf-mode 1)                     ; what was i doing?
(scroll-bar-mode -1)                 ; Disable visible scrollbar
(set-fringe-mode 10)                 ; Give some breathing room
(tool-bar-mode -1)                   ; Disable the toolbar
(tooltip-mode -1)                    ; Disable tooltips

;; Variables
(setq-default fill-column 80) ; tty width
(setq auto-save-default nil) ; Stop creating # auto save files
(setq custom-file "~/.emacs-custom.el") ; Use non-source managed custom file
(setq inhibit-startup-message t) ; no startup message
(setq make-backup-files nil) ; Stop creating ~ backup files
(setq rcirc-default-nick "perfect_angel" ; yapper
      rcirc-track-minor-mode 1
      rcirc-server-alist
      '(("irc.libera.chat"
  	 :channels ("#emacs" "##rust")
  	 :nick "perfect_angel"
  	 :port 6697
  	 :encryption tls)))
(setq visible-bell t) ; Set up the visible bell
(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 200) ; font

;; Keymaps
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Make ESC quit prompts

(keymap-set prog-mode-map "C-c e n" #'flymake-goto-next-error) 
(keymap-set prog-mode-map "C-c e p" #'flymake-goto-prev-error)

;; Hooks
(add-hook 'prog-mode-hook 'electric-indent-mode) ; auto indent
(add-hook 'prog-mode-hook 'electric-pair-mode) ; auto pairs
(add-hook 'prog-mode-hook 'hs-minor-mode) ; code folding
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; line numbers

;; Mac os specific settings
(when (eq system-type 'darwin) ; mac specific settings
  (global-set-key [kp-delete] 'delete-char)) ; fix mac delete

;; Packages

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

;; General purpose packages
(use-package magit) ; git gud
(use-package vterm) ; better terminal
(use-package kubernetes) ; k8s
(use-package elisp-demos)
(use-package emojify)

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
  (yas-global-mode 1))
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


(use-package rainbow-delimiters ; colored parens
  :hook (prog-mode . rainbow-delimiters-mode)) 

;; language support
(use-package markdown-mode)
(use-package geiser-guile)
(use-package rust-ts-mode
  :mode ("\\.rs\\'" . rust-ts-mode))

;; org mode
(use-package org-appear
  :config
  (add-hook 'org-mode-hook 'org-appear-mode))
(setq org-babel-load-languages
      '((emacs-lisp . t)
       (shell . t)
       (python . t)
       (clojure . t)
       (js . t)
       (ruby . t)))
(setq org-directory "~/org")
(setq org-default-notes-file "refile.org")
(setq org-agenda-files '("today.org" "refile.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file "~/org/refile.org") "* TODO %?")
        ("j" "Journal" entry (file+olp+datetree "~/org/journal.org") "* %?")))

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


;; Consult
(use-package consult
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))
  :init 
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

;; Embark
(use-package embark
  :config
  (keymap-global-set "<remap> <describe-bindings>" #'embark-bindings)
  (keymap-global-set "C-." 'embark-act)
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after embark
  :config
   (add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))

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
(use-package corfu-terminal)
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

;;; Cape TODO: add more cape stuff
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
(add-hook 'js-ts-mode-hook 'eglot-ensure)
(add-hook 'rust-ts-mode 'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'eglot-ensure)
(add-hook 'terraform-mode-hook 'eglot-ensure)

;; Treesitter
(use-package tree-sitter)
(use-package tree-sitter-indent)
(use-package tree-sitter-ispell)
(use-package tree-sitter-langs)
(use-package treesit-auto)

;; AI
(use-package gptel
  :config
  (setq gptel-backend (gptel-make-ollama "Ollama"
  					 :host "localhost:11434"
  					 :stream t
  					 :models '(deepseek-r1:latest))
        gptel-default-model 'deepseek-r1:latest
        gptel-model 'deepseek-r1:latest
        gptel-default-mode 'org-mode))

;; amen
(provide 'init)
;;; init.el ends here
