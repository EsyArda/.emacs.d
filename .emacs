(require 'package)
(add-to-list 'package-archives' ("melpa" . "http://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(ecb-options-version "2.40")
 '(global-ede-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages '(auto-complete))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
	kept-new-versions 2
	kept-old-versions 2
	version-control t)

;; Line number
(global-linum-mode t)

;; Disable toolbar menu
(tool-bar-mode -1)

;; Enable auto-complete
(global-auto-complete-mode t)

;; Selection
(setq transient-mark-mode t)

;; Column number
(setq column-number-mode t)

;; scroll one line at a time (less "jumpy" than defaults)
    
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Pixel scroll trop beau
(pixel-scroll-mode 1)

;; Laisser 3 lignes avant de scroller
(setq scroll-margin 3)

;; Custom key bindings
(global-set-key (kbd "<M-down>") 'scroll-up-line)
(global-set-key (kbd "<M-up>") 'scroll-down-line)
