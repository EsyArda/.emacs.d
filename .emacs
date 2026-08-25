;;; .emacs --- Emacs configuration file  -*- lexical-binding: t; -*-

;;; Commentary:
;; Emacs configuration file

;;; Code:

;; Melpa
;; https://melpa.org/partials/getting-started.html
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;;;;;;;;;;;;;;;;;;;
;; Theme
;;;;;;;;;;;;;;;;;;;;
(load-theme 'modus-vivendi)


;; Font
(use-package ligature
  :config
  ;; (set-face-attribute 'default nil :height 110) ;; font size
  (set-frame-font "Fira Code")
  ;; Enable the www ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                       ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                       "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                       "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                       "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                       "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                       "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                       "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                       "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                       "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
  (global-ligature-mode 't))


;;;;;;;;;;;;;;;;;;;;
;; Global configuration
;;;;;;;;;;;;;;;;;;;;

(use-package emacs
  :ensure nil
  :bind
  (("C-x C-b" . ibuffer))
  
  :custom
  (inhibit-startup-screen t) ; Désactive l’écran de démarrage
  (initial-scratch-message nil) ; Désactive le message de brouillon
  (use-short-answers t) ; y au lieu de yes
  (help-window-select t) ; Quitter l’aide avec 'q'
  (completions-detailed t)
  (visible-bell t) ; Alerte visuelle
  (scroll-margin 2) ; Laisser N lignes avant de scroller
  (column-number-mode t) ; Numéro de colonne
  (mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; scroll one line at a time
  (scroll-step 1) ; keyboard scroll one line at a time
  (mouse-yank-at-point t) ; yank at cursor position
  (vc-follow-symlinks t) ;; if visiting a symlink, version control follows it and visits the real file
  (backup-directory-alist `(("." . "~/.saves"))) ;; Fichiers de sauvegarde dans un dossier à part
  (backup-by-copying t) ;; Sauvegardes par copie
  (delete-old-versions t)
  (kept-new-versions 6)
  (kept-old-versions 2)
  (version-control t)
  (tramp-allow-unsafe-temporary-files t) ;; Accept autosave file on local temporary directory for root owned files over SSH
  (indent-tabs-mode nil) ;; Remplace les tabulations par des espaces
  (delete-by-moving-to-trash t) ;; Use the system's trash
  (ibuffer-human-readable-size t)
  (treesit-enabled-modes t)

  :init
  (repeat-mode 1)
  (tool-bar-mode -1) ; Désactive la avec les icônes d’outils
  (global-hl-line-mode t) ; Surligne la ligne active
  ;; Which key
  (which-key-mode)
  ;; Minibuffer completion
  (fido-vertical-mode)
  (winner-mode)
  (electric-pair-mode)

  )

;; Full path in the buffer name
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;;;;;;;;;;;;;;;;;;;;
;; Keyboard shortcuts
;;;;;;;;;;;;;;;;;;;;

;; (global-set-key (quote [M-down]) (quote scroll-up-line))
;; (global-set-key (quote [M-up]) (quote scroll-down-line))

;; https://www.emacswiki.org/emacs/WindMove
;; Move point from window to window using Shift and the arrow keys
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Buffer manipulation shortcuts for azerty afnor keyboard
;; (global-set-key (kbd "C-x à") 'delete-other-windows)
;; (global-set-key (kbd "C-x é") 'split-window-below)
;; (global-set-key (kbd "C-x è") 'split-window-right)
;; (global-set-key (kbd "C-x »") 'delete-window)


;; https://stackoverflow.com/a/23691365
;; Make C-c C-c behave like C-u C-c C-c in Python mode
;; (require 'python)
;; (define-key python-mode-map (kbd "C-c C-c")
;; 	    (lambda () (interactive) (python-shell-send-buffer t)))



;;;;;;;;;;;;;;;;;;;;
;; Modes
;;;;;;;;;;;;;;;;;;;;
;; Syntax highlighting
(add-to-list 'auto-mode-alist '("\\.\\(ovpn\\|service\\|timer\\|socket\\|path\\)\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.\\(prf\\|logrotate\\)\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.cron\\'" . crontab-mode))
(add-to-list 'auto-mode-alist '("\\.jsonl\\'" . jsonc-mode))
(add-to-list 'auto-mode-alist '("\\.log\\'" . log-view-mode))
(add-to-list 'auto-mode-alist '("\\.git/COMMIT_EDITMSG\\'" . diff-mode))
(add-to-list 'auto-mode-alist '("\\.jinja\\'" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.env\\'" . shell-script-mode))

;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;

;; Org mode
(use-package org
  :config
  (setq org-startup-truncated nil ; Réactive le retour à la ligne en org-mode
	org-export-backends '(ascii html icalendar latex man md odt)
	org-babel-python-command "/usr/bin/python3")
  ;; Allow org-mode to execute languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (shell . t)
     (calc . t))))

;; Auto completion
;; (use-package company
;;   :init (global-company-mode 1)
;;   :config
;;   (setq company-minimum-prefix-length 2
;; 	company-idle-delay 0.1)
;;   ;; Completion with tab
;;   (add-hook 'after-init-hook 'company-tng-mode))
(use-package completion-preview
  :config
  (global-completion-preview-mode t)
  (setq completion-preview-minimum-symbol-length 2))

;; LSP
;; (use-package eglot
;;   :config
;;   (with-eval-after-load 'eglot
;;     ;; Lua
;;     (add-to-list 'eglot-server-programs
;;                  '(lua-mode . ("/home/perso/.local/opt/lua-language-server/bin/lua-language-server")))
;;     ;; Python
;;     (setq eglot-server-programs
;;           (append eglot-server-programs '((python-mode . ("pylsp")))) ))
;;   (add-hook 'lua-mode-hook #'eglot-ensure)
;;   (add-hook 'python-mode-hook #'eglot-ensure))
(use-package eglot
  :hook ((python-ts-mode . eglot-ensure)
         (python-mode    . eglot-ensure)
         (lua-mode       . eglot-ensure)
         (lua-ts-mode    . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
               '(lua-mode
                 . ("/home/perso/.local/opt/lua-language-server/bin/lua-language-server"))))


;; Flycheck
;; https://www.flycheck.org/en/latest/
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; Undo fu
(use-package undo-fu
  :config
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

(use-package magit
  :ensure t)

(use-package realgud
  :after python
  :config
  (setq realgud:pdb-command-name "python3 -m pdb")
  (define-key python-mode-map (kbd "C-c g") #'realgud:pdb))

;; (use-package dockerfile-mode
;;   :ensure
;;   :config
;;   (setq dockerfile-build-progress "plain"))

;;;;;;;;;;;;;;;;;;;;
;; Custom functions
;;;;;;;;;;;;;;;;;;;;

(provide '.emacs)
;;; .emacs ends here
