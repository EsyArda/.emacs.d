;;; .emacs --- Emacs configuration file  -*- lexical-binding: t; -*-

;;; Commentary:
;; Emacs configuration file

;;; Code:

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;;;;;;;;;;;;;;;;;;;
;; Theme
;;;;;;;;;;;;;;;;;;;;
(load-theme 'modus-vivendi)

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
  ;; Minibuffer completion
  (fido-vertical-mode)
  (winner-mode)
  (electric-pair-mode)

  )

;; Full path in the buffer name
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;; https://www.emacswiki.org/emacs/WindMove
;; Move point from window to window using Shift and the arrow keys
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; https://stackoverflow.com/a/23691365
;; Make C-c C-c behave like C-u C-c C-c in Python mode
;; (require 'python)
;; (define-key python-mode-map (kbd "C-c C-c")
;; 	    (lambda () (interactive) (python-shell-send-buffer t)))


;; Syntax highlighting
(add-to-list 'auto-mode-alist '("\\.\\(ovpn\\|service\\|timer\\|socket\\|path\\)\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.\\(prf\\|logrotate\\)\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.cron\\'" . crontab-mode))
(add-to-list 'auto-mode-alist '("\\.jsonl\\'" . jsonc-mode))
(add-to-list 'auto-mode-alist '("\\.log\\'" . log-view-mode))
(add-to-list 'auto-mode-alist '("\\.git/COMMIT_EDITMSG\\'" . diff-mode))
(add-to-list 'auto-mode-alist '("\\.jinja\\'" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.env\\'" . shell-script-mode))


;; Which key
(use-package which-key
  :defer t
  :ensure nil
  :hook (after-init-hook . which-key-mode))


;; Org mode
(use-package org
  :ensure nil
  :defer t
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
(use-package eglot
  :hook ((python-ts-mode . eglot-ensure)
         (python-mode    . eglot-ensure)
         (lua-mode       . eglot-ensure)
         (lua-ts-mode    . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
               `((lua-mode lua-ts-mode)
                 . (,(expand-file-name
                      "~/.local/opt/lua-language-server/bin/lua-language-server")))))


;; Spelling checker
(use-package flyspell
  :ensure nil
  :defer t
  :config
  :hook
  ((text-mode-hook . flyspell-mode)
   (prog-mode-hook . flyspell-prog-mode))
  )


;; Flycheck
;; https://www.flycheck.org/en/latest/
(use-package flycheck
  :defer t
  :hook (prog-mode-hook . flycheck-mode))


;; Font
(use-package ligature
  :hook (after-init . global-ligature-mode)
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
                                       "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%")))


;; Git
(use-package magit
  :ensure t
  :defer t)


;; Debuggers
(use-package realgud
  :after python
  :defer t
  :commands realgud:pdb
  :bind (:map python-base-mode-map ("C-c g" . realgud:pdb))
  :init
  (setq realgud:pdb-command-name "python3 -m pdb"))

;; (use-package dockerfile-mode
;;   :ensure
;;   :config
;;   (setq dockerfile-build-progress "plain"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(provide '.emacs)
;;; .emacs ends here
