;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t) ;; Always ensure packages are installed

;; Better UI
(use-package doom-themes
  :config (load-theme 'doom-one t))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; Ivy/Counsel for completion
(use-package ivy
  :diminish
  :config (ivy-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)))

;; Project management
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

;; Git integration
(use-package magit)

;; Code completion
(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 1))

;; Syntax checking
(use-package flycheck
  :init (global-flycheck-mode))

;; LSP
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((c-mode . lsp)
         (c++-mode . lsp)
         (rust-mode . lsp)
         (python-mode . lsp)
         (php-mode . lsp)
         (java-mode . lsp)
         (js-mode . lsp)
         (typescript-mode . lsp)
         (web-mode . lsp))
  :commands lsp)

;; LSP UI enhancements
(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'bottom))

;; LSP with Ivy integration
(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

;; Treemacs for project sidebar
(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(use-package cc-mode
  :ensure nil  ;; Built-in
  :hook ((c-mode c++-mode) . lsp-deferred))

;; Modern C++ highlighting
(use-package modern-cpp-font-lock
  :hook (c++-mode . modern-c++-font-lock-mode))

;; CMake support
(use-package cmake-mode)

(use-package rust-mode
  :hook (rust-mode . lsp-deferred))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package python-mode
  :hook (python-mode . lsp-deferred)
  :custom
  (python-shell-interpreter "python3"))

(use-package pyvenv
  :config
  (pyvenv-mode 1))

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.css\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.vue\\'" . web-mode))
  :config
  (setq web-mode-enable-auto-quoting nil
        web-mode-enable-current-element-highlight t))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred))

(use-package js2-mode
  :mode "\\.js\\'"
  :hook (js2-mode . lsp-deferred))

;; Vue.js
(use-package vue-mode
  :mode "\\.vue\\'")

(use-package php-mode
  :hook (php-mode . lsp-deferred))

(use-package lsp-java
  :config (add-hook 'java-mode-hook 'lsp))

;; Snippets
(use-package yasnippet
  :hook (prog-mode . yas-minor-mode)
  :config (yas-reload-all))

(use-package yasnippet-snippets)

;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Git gutter
(use-package git-gutter
  :hook (prog-mode . git-gutter-mode))

;; Comment/uncomment lines
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))


evilnc-comment-or-uncomment-lines
;; Enable native compilation if available
(when (and (fboundp 'native-comp-available-p)
           (native-comp-available-p))
  (setq comp-deferred-compilation t
        package-native-compile t))
