(setq inhibit-startup-screen t ; Désactive l’écran de démarrage
      initial-scratch-message nil ; Désactive le message de brouillon
      use-short-answers t ; y au lieu de yes
      help-window-select t ; Quitter l’aide avec 'q'
      completions-detailed t)

(add-to-list 'default-frame-alist '(width . 90))  ; Width set to 80 characters
(add-to-list 'default-frame-alist '(height . 40)) ; Height set to 24 lines

;; Alerte visuelle
(setq visible-bell t)

;; Laisser 3 lignes avant de scroller
(setq scroll-margin 3)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; Fichiers de sauvegarde dans un dossier à part
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(tool-bar-mode -1) ; Désactive la avec les icônes d’outils
(delete-selection-mode t) ; Supprime la sélection quand on tappe du texte
(setq column-number-mode t) ; Numéro de colonne
(setq org-startup-truncated nil) ; Réactive le retour à la ligne en org-mode

;; Melpa
;; https://melpa.org/partials/getting-started.html
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;(require 'helm-config)
(helm-mode 1)

;; Raccourcis pour utiliser les équivalents helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(global-set-key (kbd "C-c f") 'helm-recentf)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tsdh-dark))
 '(markdown-command "/usr/bin/pandoc")
 '(package-selected-packages
   '(languagetool helm-ls-git company auto-complete gitlab-ci-mode jinja2-mode json-mode salt-mode helm wfnames markdown-mode async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Use Python in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)))
(setq org-babel-python-command "/usr/bin/python3")

;; Enable company globally
(global-company-mode)
(add-hook 'after-init-hook 'company-tng-mode)

;; LangTool path
;;(setq langtool-language-tool-jar "/opt/LanguageTool-6.6/languagetool-commandline.jar")
;;(require 'langtool)

;; LanguageTool
(setq languagetool-java-arguments '("-Dfile.encoding=UTF-8")
      languagetool-console-command "/opt/LanguageTool-6.6/languagetool-commandline.jar"
      languagetool-server-command "/opt/LanguageTool-6.6/languagetool-server.jar")
