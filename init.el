;;; init --- Angel's init.el
;;; Commentary:
;;; this is not a good endorsement of me as a serious person
;;; Code:
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-initialize)


(require 'use-package)
(setq use-package-always-ensure t)

(org-babel-load-file "~/dotfiles/config.org")

(provide 'init)
;;; init.el ends here
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
