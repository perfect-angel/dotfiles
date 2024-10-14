;;; init.el --- Angel's Emacs Config
;;; Author: Angel Campbell
;;; Commentary:
;;; ------------------------------------------
;;; ANGEL CAMPBELL'S WONDERFUL HORRIBLE EMACS CONFIG
;;; note: this is not a good endorsement
;;;       of me as a serious person
;;;
;;;----------------------------------------------------------
;;; > YOU ARE LOVED
;;; > YOU ARE WORTHY OF THAT LOVE
;;; > YOU ARE NOT IN TROUBLE
;;; > DRINK WATER
;;;----------------------------------------------------------

;;; Code:

;;; BOOTSTRAP
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

;;; SETTINGS
(use-package emacs
  :custom
  (browse-url-browser-function 'eww-browse-url)
  (confirm-kill-emacs 'yes-or-no-p)
  (enable-recursive-minibuffers t)
  (tramp-default-method "ssh") ;; faster tramp with ssh
  (auto-save-default nil) ;; don't autosave
  (make-backup-files nil) ;; no backup files
  (backup-directory-alist '(("." . "/tmp"))) ;; send backups to hell
  (auto-save-default nil)
  (custom-file "~/.emacs.d/emacs-custom.el") ;; custom custom
  (ring-bell-function 'ignore) ;; no sounds
  (visible-bell 1) ;; no sounds

  :hook ((prog-mode . column-number-mode) ;; columns
	 (prog-mode . display-line-numbers-mode) ;; lines
	 (prog-mode . flymake-mode) ;; checker
	 ((prog-mode text-mode) . hs-minor-mode) ;; folding
	 (prog-mode . auto-fill-mode));; word wrap

  :config
  (setq-default fill-column 80)
  (when (eq system-type 'darwin) ;; mac specific settings
    (setq mac-option-modifier 'alt)
    (setq mac-command-modifier 'meta)
    (global-set-key [kp-delete] 'delete-char)) ;; sets fn-delete to be right-delete
  (electric-pair-mode 1) ;; birds of a feather
  (electric-indent-mode 1)
  (fset 'yes-or-no-p 'y-or-n-p) ;; i'm lazy
  (menu-bar-mode -1) ;; no gui
  (recentf-mode 1) ;; what was i doing?
  (set-frame-font "FiraCode Nerd Font 16" nil t)  ;; granny-coded
  (show-paren-mode 1) ;; i believe in symmetry
  (toggle-scroll-bar -1) ;; no gui
  (tool-bar-mode -1) ;; no gui
  (global-eldoc-mode 1) ;; documentation
  (global-set-key (kbd "C-c k") 'eldoc-print-current-symbol-info)
  (windmove-default-keybindings)
  (ffap-bindings))

;;; PACKAGES

(use-package evil ; evil
  :custom
  (evil-want-integration t)
  (evil-want-integration t)
  (evil-want-C-u-scroll 1)
  (evil-undo-system 'undo-redo)

  :config
  (evil-mode 1)
  (evil-set-leader nil (kbd "SPC"))
  (evil-set-leader nil "," t)
  (evil-define-key 'normal 'global
    ;; (kbd "C-j") 'windmove-down
    ;; (kbd "C-k") 'windmove-up
    ;; (kbd "C-h") 'windmove-left
    ;; (kbd "C-l") 'windmove-right

    (kbd "<up>") 'shrink-window
    (kbd "<down>") 'enlarge-window
    (kbd "<left>") 'shrink-window-horizontally
    (kbd "<right>") 'enlarge-window-horizontally

    (kbd "H") 'tab-previous
    (kbd "L") 'tab-next

    (kbd "K") 'eldoc-print-current-symbol-info

    (kbd "<localleader>f") 'eglot-format-buffer
    (kbd "<localleader>r") 'eglot-rename
    (kbd "<localleader>a") 'eglot-code-actions

    (kbd "!") 'execute-extended-command
    (kbd "-") 'dired

    (kbd "<leader>/") 'counsel-rg
    (kbd "<leader>,") 'counsel-M-x
    (kbd "<leader>a") 'term
    (kbd "<leader>b") 'switch-to-buffer
    (kbd "<leader>d") 'project-dired
    (kbd "<leader>e") 'counsel-find-file
    (kbd "<leader>f") 'project-find-file
    (kbd "<leader>g") 'magit
    (kbd "<leader>h") 'counsel-describe-symbol
    (kbd "<leader>jc") 'org-capture
    (kbd "<leader>ja") 'org-agenda
    (kbd "<leader>k") 'delete-window
    (kbd "<leader>ll") 'flymake-show-buffer-diagnostics
    (kbd "<leader>lp") 'flymake-goto-prev-error
    (kbd "<leader>ln") 'flymake-goto-next-error
    (kbd "<leader>m") 'counsel-recentf
    (kbd "<leader>n") 'tab-new
    (kbd "<leader>q") 'quit
    (kbd "<leader>sh") 'split-window-horizontally
    (kbd "<leader>sj") 'split-window-below
    (kbd "<leader>sk") 'split-window-vertically
    (kbd "<leader>sl") 'split-window-right
    (kbd "<leader>t") 'test-approximate
    (kbd "<leader>vv") (lambda () (interactive) (find-file "~/dotfiles/init.el"))
    (kbd "<leader>w") 'save-some-buffers
    (kbd "<leader>y") 'yas-visit-snippet-file
    (kbd "<leader>zc") 'hs-hide-all
    (kbd "<leader>zo") 'hs-show-all))
(use-package evil-commentary
  :config
  (evil-commentary-mode))
(use-package evil-snipe
  :config
  (setq evil-snipe-scope 'buffer)
  (evil-snipe-mode 1)
  (evil-snipe-override-mode 1))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :config
  (savehist-mode))

;; WM (one day)
;; (use-package 'exwm)
;; (require 'exwm-config)
;; (require 'exwm-randr)
;; (exwm-randr-enable)
;; (exwm-config-ido)
;; (exwm-init)

;; UTIL 🔧
(use-package magit)
(use-package iedit)
(use-package lingva)
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (global-set-key (kbd "C-x C-y") 'company-yasnippet))
(use-package yasnippet-snippets)

(use-package exec-path-from-shell ;; set path to shellpath
  :config
  (exec-path-from-shell-initialize))


;; DISCOVERY 🔍
(use-package which-key
  :config
  (which-key-mode 1))
(use-package discover
  :init
  (setq which-key-show-early-on-C-h t
        which-key-idle-delay 0.5)
  :config
  (global-discover-mode 1))

;; PRETTY 💖
(use-package mood-line
  ;; Enable mood-line
  :config
  (mood-line-mode)
  :custom
  (mood-line-glyph-alist mood-line-glyphs-fira-code))

(use-package emojify)
(use-package nerd-icons)
(use-package rainbow-delimiters
  :config
  (rainbow-delimiters-mode 1))
(use-package soft-morning-theme)
(load-theme 'soft-morning 1)

;; NAVIGATION 🗺️
(use-package counsel
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1)
  (counsel-mode 1))

;; COMPLETION 🧩
(use-package company
  :config
  (global-company-mode 1)) ;; replace with complete?

;; ORG 📆
(use-package org
  :custom
  (org-default-notes-file "~/org/refile.org")
  (org-agenda-files '("~/org/refile.org"))
  (org-capture-templates
   '(("t" "Todo" entry (file "~/org/refile.org") "* TODO %?")
     ("j" "Journal" entry (file+olp+datetree "~/org/journal.org") "%?"))))

;; LANG 📕
(use-package handlebars-mode)
(use-package geiser-guile)
(use-package rust-ts-mode
  :mode ("\\.rs\\'" . rust-ts-mode))
(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

;; OPS 💻
(use-package kubernetes)

;; LSP
(use-package eglot
  :hook ((typescript-ts-mode  . eglot-ensure)
	 (rust-ts-mode  . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
	       '(handlebars-mode "ember-language-server")))

;; AMEN
(provide 'init)
;;; init.el ends here
