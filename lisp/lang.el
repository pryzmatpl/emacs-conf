;;; lang.el --- Language support -*- lexical-binding: t -*-

;; LSP
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((c-mode c++-mode rust-mode python-mode php-mode java-mode
          js-mode typescript-mode web-mode) . lsp-deferred)
  :config
  (setq lsp-idle-delay 0.5
        lsp-log-io nil
        lsp-enable-snippet t
        lsp-auto-guess-root t
        lsp-completion-provider :capf)
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'bottom
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-hover t))

(use-package lsp-ivy
  :after (lsp-mode ivy)
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :after (lsp-mode treemacs)
  :commands lsp-treemacs-errors-list)

;; Autocomplete
(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t))

;; Syntax checking
(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

;; Snippets
(use-package yasnippet
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all))

(use-package yasnippet-snippets
  :after yasnippet)

;; Comment code
(use-package comment-dwim-2
  :after org
  :bind ("M-/" . comment-dwim-2))

;; C/C++
(use-package cc-mode
  :ensure nil
  :hook ((c-mode c++-mode) . lsp-deferred))

(use-package modern-cpp-font-lock
  :hook (c++-mode . modern-c++-font-lock-mode))

(use-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

;; Rust
(use-package rust-mode
  :hook (rust-mode . lsp-deferred))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

;; Python
(use-package python
  :ensure nil
  :hook (python-mode . lsp-deferred)
  :config
  (setq python-shell-interpreter "python3"))

(use-package pyvenv
  :hook (python-mode . pyvenv-mode)
  :config
  (require 'wid-edit)) ; Fix widget-related warnings

;; Java
(use-package lsp-java
  :after lsp-mode
  :hook (java-mode . lsp-deferred)
  :config
  (setq lsp-java-vmargs
        (list "-noverify" "-Xmx1G" "-XX:+UseG1GC")))

;; JavaScript/TypeScript
(use-package js2-mode
  :mode "\\.js\\'"
  :hook (js2-mode . lsp-deferred))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred))

;; Web (React, Vue)
(use-package web-mode
  :mode ("\\.html?\\'" "\\.css\\'" "\\.jsx\\'" "\\.tsx\\'" "\\.vue\\'")
  :hook (web-mode . lsp-deferred)
  :config
  (require 'sgml-mode) ; Fix sgml-indent-line warning
  (setq web-mode-enable-auto-quoting nil
        web-mode-enable-current-element-highlight t
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

(use-package vue-mode
  :mode "\\.vue\\'"
  :after web-mode
  :config
  (add-hook 'vue-mode-hook #'lsp-deferred))

;; PHP
(use-package php-mode
  :hook (php-mode . lsp-deferred))

;; DAP for debugging
(use-package dap-mode
  :after lsp-mode
  :config
  (require 'dap-python)
  (require 'dap-lldb) ; For C/C++/Rust
  (require 'dap-java)
  (require 'dap-node) ; For JavaScript/TypeScript
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (dap-auto-configure-mode 1))

(provide 'lang)
;;; lang.el ends here 