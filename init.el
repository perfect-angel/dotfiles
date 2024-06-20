;; init.el
;; author: Angel Campbell
;; description: This is not a
;;     good advertisement for
;;           me as a serious person
;; ------------------------------------------

;; BOOTSTRAP
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
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'alt)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

(setq-default fill-column 80)
(setq
 browse-url-browser-function 'eww-browse-url
 confirm-kill-emacs 'yes-or-no-p 
 enable-recursive-minibuffers t
 mastodon-active-user "perfect_angel"
 mastodon-instance-url "https://mastodon.social"
 org-directory "~/org"
 org-default-notes-file "~/org/inbox.org"
 org-capture-templates
      '(("t" "Todo" entry (file "~/org/inbox.org")
         "* TODO %?\n  %t")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?"))
 org-agenda-files '("~/org/inbox.org"
		    "~/org/someday.org")
 org-refile-targets '(("notes.org" :maxlevel . 2) ;; org refiles
		      ("someday.org" :maxlevel . 2))
 tramp-default-method "ssh" ;; faster tramp with ssh
 auto-save-default nil ;; don't autosave
 make-backup-files nil ;; no backup files 
 backup-directory-alist '(("." . "/tmp")) ;; send backups to hell
 ring-bell-function 'ignore
 rcirc-server-alist
      '(("irc.libera.chat" ; Hostname
       :port 6697          ; Standard port for secure IRC
       :nick "perfect-angel"       ; Your nickname
       :encryption tls     ; Specify to use encryption
       :channels ("#guix")))
 which-key-show-early-on-C-h t
 which-key-idle-delay 0.3
 visible-bell 1) ;; don't make noise

(add-hook 'prog-mode-hook 'column-number-mode) ;; columns
(add-hook 'prog-mode-hook 'line-number-mode) ;; lines
(add-hook 'prog-mode-hook 'auto-fill-mode) ;; word wrap
(electric-pair-mode 1) ;; birds of a feather
(electric-indent-mode 1)
(fset 'yes-or-no-p 'y-or-n-p) ;; i'm lazy
(menu-bar-mode -1) ;; no gui
(recentf-mode 1) ;; what was i doing?
(set-frame-font "Inconsolata Nerd Font Mono 28") ;; granny-coded
(show-paren-mode 1) ;; i believe in symmetry 
(toggle-scroll-bar -1) ;; no gui
(tool-bar-mode -1) ;; no gui

;; WM
;; (straight-use-package 'exwm) 
;; (require 'exwm-config)
;; (require 'exwm-randr)
;; (exwm-randr-enable)
;; (exwm-config-ido)
;; (exwm-init)

;; UTIL
(straight-use-package 'magit) ;; magic git
(straight-use-package 'vterm) ;; erm? idk
(straight-use-package 'doom-themes)
(straight-use-package 'emojify)
(straight-use-package 'exec-path-from-shell) ;; set path to shellpath
(straight-use-package 'nerd-icons)
(straight-use-package 'doom-modeline)
(straight-use-package 'writeroom-mode)
(straight-use-package 'iedit) ;; exec?
(straight-use-package 'rainbow-delimiters) ;; pretty 
(straight-use-package 'discover) ;; learn betterer
(straight-use-package 'which-key) ;; keybinds
(straight-use-package 'lingva) ;; translate

(global-discover-mode 1)
(exec-path-from-shell-initialize)
(doom-modeline-mode)
(rainbow-delimiters-mode 1)

(load-theme 'doom-solarized-dark t)

;; NAVIGATION 🗺️
(straight-use-package 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; INTERNET 🌐
(straight-use-package 'mastodon)

(require 'mastodon-discover)
(with-eval-after-load 'mastodon (mastodon-discover))

;; COMPLETION 🧩
(straight-use-package 'company) ;; replace with complete?
(global-company-mode 1)

;; EVIL (until i repent) 😈
(straight-use-package 'evil)

(global-set-key (kbd "M-<return>") 'evil-mode)

;; ORG 📆
(straight-use-package 'org)

(global-set-key (kbd "C-c o a") #'org-agenda)
(global-set-key (kbd "C-c o c") #'org-capture)

;; LANG 📕
(straight-use-package 'handlebars-mode)
(straight-use-package 'geiser-guile)

;; OPS 💻
(straight-use-package 'kubernetes)

;; LSP 
(straight-use-package 'lsp-mode)

;; HYPER 🤪
(global-set-key (kbd "A-C-M-a") 'vterm)
(global-set-key (kbd "A-C-M-e") 'emoji-insert)

