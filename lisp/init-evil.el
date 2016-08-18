(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :bind (:map evil-normal-state-map
         ("C-w o" . toggle-maximize-buffer)
         ("C-o" . previous-buffer)
         ("C-i" . next-buffer)
         ("C-h" . evil-window-left)
         ("C-j" . evil-window-down)
         ("C-k" . evil-window-up)
         ("C-l" . evil-window-right)
         :map evil-insert-state-map
         ("C-n" . evil-next-line)
         ("C-p" . evil-previous-line)))
(evil-mode t)
;; Tabs
(elscreen-start)
(use-package elscreen-persist
  :config
  (elscreen-persist-mode t)
  (setq desktop-files-not-to-save ""))
(use-package evil-tabs
  :init (global-evil-tabs-mode t)
  :bind (:map evil-normal-state-map
         ("M-h" . elscreen-previous)
         ("M-l" . evil-tabs-goto-tab)
         :map evil-emacs-state-map
         ("M-h" . elscreen-previous)
         ("M-l" . evil-tabs-goto-tab)))

(defun cool/leader-init ()
  (bind-map leader-map
    :keys ("M-u")
    :evil-keys ("SPC")
    :evil-states (normal motion visual))
  (which-key-declare-prefixes
    "SPC p" "Projects"
    "SPC s" "split"
    "SPC h" "Help"
    "SPC m" "Bookmark"
    "SPC o" "Org"
    "SPC y" "Yasnippet"
    "SPC oo" "gtd file"
    "SPC oo" "journal file"
    "SPC z" "Browser")
  (bind-map-set-keys leader-map
    "a" 'org-agenda
    "b" 'helm-mini
    "c" 'org-capture
    "f" 'helm-find-files
    "g" 'magit-status
    "ha" 'helm-apropos
    "hf" 'describe-function
    "hh" 'dash-at-point
    "hk" 'describe-key
    "hv" 'describe-variable
    "i" 'helm-imenu
    "k" 'evil-tab-sensitive-quit
    "mk" 'bookmark-delete
    "mc" 'bookmark-set
    "mm" 'helm-bookmarks
    "n" 'elscreen-create
    "oo" (lambda () (interactive) (find-file "~/org/gtd.org"))
    "oj" (lambda () (interactive) (find-file "~/org/journal.org"))
    "oa" 'org-agenda
    ;; Projects
    "pp" 'helm-projectile-switch-project
    "pf" 'helm-projectile-find-file
    "pt" 'projectile-regenerate-tags
    "p;" 'neotree-projectile-action
    "sh" 'split-window-vertically
    "sv" 'split-window-horizontally
    "t" 'multi-term
    "v" 'evil-iedit-state/iedit-mode
    "w" 'save-buffer
    "x" 'dired-jump
    "yf" 'yas-visit-snippet-file
    "yy" 'yas-new-snippet
    "zh" 'cool/goto-hacker-news
    "zz" 'w3m-search
    ":" 'helm-M-x
    "/" 'helm-projectile-ag
    "<SPC>" 'ace-jump-char-mode))


(defun leader-for-mode (mode key def &rest bindings)
  "Sets a series of bindings to be set to the major leader (',') for a particular MODE"
  (setq leadermap (make-symbol (concat (symbol-name mode) "-leader")))
  (eval
   `(bind-map ,leadermap
      :major-modes (,mode)
      :keys ("M-m")
      :evil-keys (",")
      :evil-states (normal motion visual)))
  (while key
    (define-key (symbol-value leadermap) (kbd key) def)
    (setq key (pop bindings) def (pop bindings))))

(use-package bind-map :config (cool/leader-init))
(use-package evil-surround :config (global-evil-surround-mode 1))
(use-package evil-commentary :config (evil-commentary-mode))

;;;;;;;;;;;;;;;;;;;TERM;;;;;;;;;;;;;;;;;

(use-package multi-term
  :bind (:map term-raw-map
         ("M-x" . helm-M-x)
         ("<tab>" . cool/term-send-tab)
         ("C-h" . nil)
         ("C-h" . multi-term-prev)
         ("C-l" . multi-term-next)
         ("C-y" . term-paste)
         ("M-N" . multi-term)))
(eval-after-load 'evil-vars
  '(evil-set-initial-state 'term-mode 'emacs))
(defun cool/term-hook ()
  "colby's term hook"
  (yas-minor-mode nil)
  (linum-mode nil))
(add-hook 'term-mode-hook 'cool/term-hook)


;;;;;;;;;;;;;DIRED;;;;;;;;;;;;;;;;

(add-hook 'dired-mode-hook 'evil-mode)
(defun cool/dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file"
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)))

(evil-define-key 'normal dired-mode-map
  "h" 'cool/dired-up-directory
  "l" 'dired-find-alternate-file
  "v" 'dired-toggle-marks
  "c" 'dired-create-directory
  "n" 'evil-search-next
  "N" 'evil-search-previous
  "q" 'kill-this-buffer)


(provide 'init-evil)
