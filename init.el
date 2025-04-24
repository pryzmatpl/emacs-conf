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
;; Set default font
(set-face-attribute 'default nil
                    :font "Noto Sans Mono-12")
;; Fallback font for symbols
(set-fontset-font t 'unicode "Symbola" nil 'prepend)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;;; init.el ends here 
