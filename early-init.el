;;; early-init.el --- Early initialization -*- lexical-binding: t -*-

;; Increase garbage collection threshold during startup
(setq gc-cons-threshold 80000000)

;; Disable package.el at startup for faster loading
(setq package-enable-at-startup nil)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable UI elements early in the startup process
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(provide 'early-init)
;;; early-init.el ends here 