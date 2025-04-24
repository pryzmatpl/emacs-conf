;;; init.el --- Emacs initialization -*- lexical-binding: t -*-

;; Increase garbage collection threshold during startup
(setq gc-cons-threshold 80000000)

;; Load custom files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'packages)
(require 'ui)
(require 'lang)
(require 'keybindings)

;; Custom file for machine-specific settings
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Reset garbage collection threshold after startup
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold 800000)))

(provide 'init)
;;; init.el ends here 