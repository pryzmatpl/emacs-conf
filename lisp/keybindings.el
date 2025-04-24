;;; keybindings.el --- Keybindings -*- lexical-binding: t -*-

;; General text editing
(global-set-key (kbd "M-/") 'comment-dwim-2)
(global-set-key (kbd "C-c d") 'dap-debug)

;; Window management
(global-set-key (kbd "C-x 2") 'split-window-below)
(global-set-key (kbd "C-x 3") 'split-window-right)
(global-set-key (kbd "C-x o") 'other-window)

;; Buffer management
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; LSP keybindings
(with-eval-after-load 'lsp-mode
  (define-key lsp-mode-map (kbd "C-c l r") 'lsp-rename)
  (define-key lsp-mode-map (kbd "C-c l f") 'lsp-format-buffer)
  (define-key lsp-mode-map (kbd "C-c l a") 'lsp-execute-code-action)
  (define-key lsp-mode-map (kbd "C-c l d") 'lsp-find-definition)
  (define-key lsp-mode-map (kbd "C-c l i") 'lsp-find-implementation)
  (define-key lsp-mode-map (kbd "C-c l s") 'lsp-find-references))

;; DAP keybindings
(with-eval-after-load 'dap-mode
  (define-key dap-mode-map (kbd "C-c d b") 'dap-breakpoint-toggle)
  (define-key dap-mode-map (kbd "C-c d c") 'dap-continue)
  (define-key dap-mode-map (kbd "C-c d n") 'dap-next)
  (define-key dap-mode-map (kbd "C-c d s") 'dap-step-in)
  (define-key dap-mode-map (kbd "C-c d o") 'dap-step-out)
  (define-key dap-mode-map (kbd "C-c d r") 'dap-restart)
  (define-key dap-mode-map (kbd "C-c d q") 'dap-disconnect))

(provide 'keybindings)
;;; keybindings.el ends here 