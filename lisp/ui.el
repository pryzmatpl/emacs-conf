;;; ui.el --- UI configuration -*- lexical-binding: t -*-

;; Theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))

;; Modeline
(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 25
        doom-modeline-bar-width 4))

;; Ivy for completion
(use-package ivy
  :diminish
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "))

(use-package counsel
  :diminish
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file))
  :config
  (counsel-mode 1))

;; Project management
(use-package projectile
  :diminish
  :config
  (projectile-mode +1)
  :bind-keymap ("C-c p" . projectile-command-map))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode +1))

;; Treemacs
(use-package treemacs
  :defer t
  :bind (("C-c t" . treemacs)))

;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Line numbers
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(provide 'ui)
;;; ui.el ends here 