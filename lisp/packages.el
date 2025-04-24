;;; packages.el --- Package management -*- lexical-binding: t -*-

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Enable native compilation if available
(when (and (fboundp 'native-comp-available-p)
           (native-comp-available-p))
  (setq comp-deferred-compilation t
        package-native-compile t))

;; Core packages
(use-package diminish :ensure t) ; Hide minor modes from modeline

(use-package which-key
  :diminish
  :config
  (which-key-mode 1))

(use-package magit
  :defer t
  :bind ("C-x g" . magit-status))

(use-package git-gutter
  :diminish
  :hook (prog-mode . git-gutter-mode))

(provide 'packages)
;;; packages.el ends here 