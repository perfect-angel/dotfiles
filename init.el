;; init.el
;; author: Angel Campbell
;; description: This is not a good advertisement for me as a serious person
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
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

(setq
 browse-url-browser-function 'eww-browse-url
 confirm-kill-emacs 'yes-or-no-p 
 enable-recursive-minibuffers t
 org-directory "~/org"
 org-default-notes-file "~/org/inbox.org"
 org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/inbox.org")
         "* TODO %?\n  %t")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U"))
 org-agenda-files '("~/org/inbox.org"
		    "~/org/someday.org")
 org-refile-targets '(("notes.org" :maxlevel . 2) ;; org refiles
		      ("someday.org" :maxlevel . 2))
 tramp-default-method "ssh" ;; faster tramp with ssh
 auto-save-default nil ;; don't autosave
 make-backup-files nil ;; no backup files 
 backup-directory-alist '(("." . "/tmp")) ;; send backups to hell
 ring-bell-function 'ignore
 which-key-show-early-on-C-h t
 which-key-idle-delay 0.1
 visible-bell 1) ;; don't make noise

(add-hook 'prog-mode-hook 'column-number-mode) ;; columns
(add-hook 'prog-mode-hook 'line-number-mode) ;; lines
(electric-pair-mode 1) ;; birds of a feather
(electric-indent-mode 1)
(fset 'yes-or-no-p 'y-or-n-p) ;; i'm lazy
(menu-bar-mode -1) ;; no gui
(recentf-mode 1) ;; what was i doing?
(set-frame-font "Inconsolata Nerd Font Mono 30") ;; granny-coded
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
(straight-use-package 'which-key) ;; keep forgetting my binds
(which-key-mode)
(straight-use-package 'rainbow-delimiters)
(rainbow-delimiters-mode 1)
(straight-use-package 'vterm) ;; erm? idk
(straight-use-package 'doom-themes)
(straight-use-package 'exec-path-from-shell) ;; set path to shellpath
(straight-use-package 'nerd-icons)
(load-theme 'doom-horizon t)
(straight-use-package 'doom-modeline)
(straight-use-package 'zen-mode)
(doom-modeline-mode)
(exec-path-from-shell-initialize)
(rainbow-delimiters-mode 1)
(straight-use-package 'iedit) ;; yagni?
(which-key-mode)

;; NAVIGATION
(straight-use-package 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;; COMPLETION
(straight-use-package 'company) ;; replace with complete?
(global-company-mode 1)

;; EVIL (until i repent)
(straight-use-package 'evil)

(global-set-key (kbd "M-<return>") 'evil-mode)

;; ORG
(require 'org)

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; LEADER (false idol)
;; (straight-use-package 'evil-leader)
;; (global-evil-leader-mode)
;; (evil-leader/set-leader "<SPC>")
;; (evil-leader/set-key
;;  "/" 'isearch
;;  "a" 'term
;;  "b" 'display-buffer
;;  "e" 'find-file
;;  "f" 'dired
;;  "ha" 'apropos
;;  "hf" 'describe-function
;;  "hi" 'info-lookup-symbol
;;  "hp" 'info-display-manual
;;  "hv" 'describe-variable
;;  "hw" 'helm-man-woman
;;  "k" 'kill-buffer-and-window
;;  "m" 'recentf
;;  ;; "o" 'unused
;;  ;; "p" 'unused
;;  "oa" 'org-agenda
;;  "oc" 'org-capture
;;  "of" 'org-agenda-files
;;  "sh" 'split-window-horizontally
;;  "sl" (lambda () (interactive) (split-window-horizontally) (windmove-right))
;;  "sk" 'split-window-vertically
;;  "sj" (lambda () (interactive) (split-window-vertically) (windmove-down))
;;  "t" 'tab-new
;;  "u" 'eww
;;  "w" 'save-buffer
;;  "x" 'helm-M-x
;;  "z" 'writeroom-mode)

;; LANG
(straight-use-package 'handlebars-mode)
(straight-use-package 'geiser-guile)

;; LSP
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
      '(handlebars-mode . ("node",
   "/home/angel/.emacs.d/ember-language-server/lib/start-server.js"
   "--stdio"))))
