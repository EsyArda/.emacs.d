;;;;;;;;;;;;;;;;;;;;
;; Theme
;;;;;;;;;;;;;;;;;;;;
(load-theme 'modus-vivendi t)

;;;;;;;;;;;;;;;;;;;;
;; Custom variables
;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-screen t ; Désactive l’écran de démarrage
      initial-scratch-message nil ; Désactive le message de brouillon
      use-short-answers t ; y au lieu de yes
      help-window-select t ; Quitter l’aide avec 'q'
      completions-detailed t
      visible-bell t ; Alerte visuelle
      scroll-margin 3 ; Laisser 3 lignes avant de scroller
      column-number-mode t ; Numéro de colonne
      org-startup-truncated nil ; Réactive le retour à la ligne en org-mode
      mouse-wheel-scroll-amount '(1 ((shift) . 1)) ; scroll one line at a time
      scroll-step 1 ; keyboard scroll one line at a time
      mouse-yank-at-point t ; yank at cursor position
      vc-follow-symlinks t ;; if visiting a symlink, version control follows it and visits the real file
      backup-directory-alist `(("." . "~/.saves")) ;; Fichiers de sauvegarde dans un dossier à part
      backup-by-copying t ;; Sauvegardes par copie
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      tramp-allow-unsafe-temporary-files t ;; Accept autosave file on local temporary directory for root owned files over SSH
      )

;; (setq yaml-indent-offset 4) ;; Default salt/yaml indentation to N spaces

(tool-bar-mode -1) ; Désactive la avec les icônes d’outils
;; (delete-selection-mode t) ; Supprime la sélection quand on tappe du texte
(global-hl-line-mode t)

;; Full path in the buffer name
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Use Python in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)))
(setq org-babel-python-command "/usr/bin/python3")

;;;;;;;;;;;;;;;;;;;;
;; Keyboard shortcuts
;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x à") 'delete-other-windows)
(global-set-key (kbd "C-x é") 'split-window-below)
(global-set-key (kbd "C-x è") 'split-window-right)
(global-set-key (kbd "C-x »") 'delete-window)
(global-set-key (quote [M-down]) (quote scroll-up-line))
(global-set-key (quote [M-up]) (quote scroll-down-line))

;;;;;;;;;;;;;;;;;;;;
;; Conf mode
;;;;;;;;;;;;;;;;;;;;
;; Syntax highlighting for systemd files and OpenVPN files
(add-to-list 'auto-mode-alist '("\\.ovpn\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.service\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.timer\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.target\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.mount\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.automount\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.slice\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.socket\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.path\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.netdev\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.network\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.link\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.prf\\'" . conf-mode))

;;;;;;;;;;;;;;;;;;;;
;; Helm
;;;;;;;;;;;;;;;;;;;;
;; ;;(require 'helm-config)
;; (helm-mode 1)
;; ;; Helm history length
;; (setq helm-ff-history-max-length 10000)
;; ;; Raccourcis pour utiliser les équivalents helm
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; ;; (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (global-set-key (kbd "C-c f") 'helm-recentf)
;; (global-set-key (kbd "M-s o") 'helm-occur)
