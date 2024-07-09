;;; init.el --- Angel's Emacs Config
;;; Author: Angel Campbell
;;; Commentary:
;;;  This is not a good advertisement
;;;  for me as a serious person
;;; ------------------------------------------

;;; Code:

;;; PACKAGE
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)


;;; SETTINGS
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'alt)
  (global-set-key [kp-delete] 'delete-char)) ;; sets fn-delete to be right-delete
 
(setq-default fill-column 80)
(setq
 browse-url-browser-function 'eww-browse-url
 confirm-kill-emacs 'yes-or-no-p
 enable-recursive-minibuffers t
 tramp-default-method "ssh" ;; faster tramp with ssh
 auto-save-default nil ;; don't autosave
 make-backup-files nil ;; no backup files
 backup-directory-alist '(("." . "/tmp")) ;; send backups to hell
 auto-save-default nil
 custom-file "~/.emacs.d/emacs-custom.el"
 ring-bell-function 'ignore
 visible-bell 1
) ;; don't make noise

(add-hook 'prog-mode-hook 'column-number-mode) ;; columns
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; lines
(add-hook 'prog-mode-hook 'auto-fill-mode) ;; word wrap
(electric-pair-mode 1) ;; birds of a feather
(electric-indent-mode 1)
(fset 'yes-or-no-p 'y-or-n-p) ;; i'm lazy
(menu-bar-mode -1) ;; no gui
(recentf-mode 1) ;; what was i doing?
(set-frame-font "FiraCode Nerd Font 20" nil t)  ;; granny-coded
(show-paren-mode 1) ;; i believe in symmetry
(toggle-scroll-bar -1) ;; no gui
(tool-bar-mode -1) ;; no gui
(global-eldoc-mode 1) ;; documentation
(global-set-key (kbd "C-c k") 'eldoc-print-current-symbol-info)
(windmove-default-keybindings)
(ffap-bindings)

;; WM
;; (use-package 'exwm)
;; (require 'exwm-config)
;; (require 'exwm-randr)
;; (exwm-randr-enable)
;; (exwm-config-ido)
;; (exwm-init)

;; UTIL 🔧
(use-package magit)
(use-package vterm)
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

;; CHECKING ✅
(add-hook 'prog-mode-hook 'flymake-mode) ;; checker
(global-set-key (kbd "M-p") 'flymake-goto-prev-error)
(global-set-key (kbd "M-n") 'flymake-goto-next-error)

;; DISCOVERY 🔍
(use-package which-key
  :config
  (which-key-mode 1)) ;; keybinds
(use-package discover
  :init
  (setq  which-key-show-early-on-C-h t
	 which-key-idle-delay 0.5)
  :config
  (global-discover-mode 1))

;; PRETTY 💖
(use-package emojify)
(use-package nerd-icons)
(use-package rainbow-delimiters
  :config
  (rainbow-delimiters-mode 1))
(load-theme 'wombat)


;; NAVIGATION 🗺️

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

(use-package vertico
  :config
  (vertico-mode))
;; (use-package counsel
;;   :config
;;   (setq ivy-use-virtual-buffers t)
;;   (setq ivy-count-format "(%d/%d) ")
;;   (ivy-mode 1)
;;   (counsel-mode 1))

;; (global-set-key (kbd "C-s") 'swiper-isearch)

(use-package ace-window)
(global-set-key (kbd "M-o") 'ace-window)

;; INTERNET 🌐
;; ???

;; COMPLETION 🧩
(use-package company
  :config
  (global-company-mode 1)) ;; replace with complete?

;; EVIL (until i repent) 😈
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (global-set-key (kbd "M-<return>") 'evil-mode))

;; ORG 📆
(use-package org
  :init
  (setq org-default-notes-file "~/org/inbox.org"
      org-agenda-files '("~/org/inbox.org")
      org-capture-templates
      '(("t" "Todo" entry (file "~/org/inbox.org") "* TODO %?")
	("j" "Journal" entry (file+datetree "~/org/journal.org") "%?")))
  :config
  (global-set-key (kbd "C-c o a") #'org-agenda)
  (global-set-key (kbd "C-c o c") #'org-capture))

;; LANG 📕
(use-package handlebars-mode)
(use-package geiser-guile)
(use-package rust-ts-mode
  :mode ("\\.rs\\'" . rust-ts-mode)
  :hook ((rust-ts-mode . eglot-ensure)))
(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

;; OPS 💻
(use-package kubernetes)

;; LSP
(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
	     '(handlebars-mode "ember-language-server")))

(add-hook 'typescript-ts-mode-hook 'eglot-ensure)

;; AMEN
(provide 'init)
;;; init.el ends here
