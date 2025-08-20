;; Melpa
;; https://melpa.org/partials/getting-started.html
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c6df274f1c530ccb44dd79f75a94924e7fdb2b0f967d1cc7b4095ff166e58f86" default))
 '(markdown-command "/usr/bin/pandoc")
 '(package-selected-packages
   '(atomic-chrome dockerfile-mode flycheck-languagetool flycheck magit srcery-theme helm-tramp realgud helm-ls-git company gitlab-ci-mode jinja2-mode json-mode salt-mode helm wfnames markdown-mode async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Theme
(load-theme 'srcery t)

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
      )

;; Fichiers de sauvegarde dans un dossier à part
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(tool-bar-mode -1) ; Désactive la avec les icônes d’outils
;; (delete-selection-mode t) ; Supprime la sélection quand on tappe du texte

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

;;(add-to-list 'default-frame-alist '(width . 100))  ; Width in characters
;;(add-to-list 'default-frame-alist '(height . 50)) ; Height in lines


;; Helm
;;(require 'helm-config)
(helm-mode 1)
;; Raccourcis pour utiliser les équivalents helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(global-set-key (kbd "C-c f") 'helm-recentf)


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


;; Company
(global-company-mode)
(add-hook 'after-init-hook 'company-tng-mode)
(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0.1)

;; Flycheck
;; https://www.flycheck.org/en/latest/
;; (global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(use-package flycheck-languagetool
  :ensure t
  :hook (text-mode . flycheck-languagetool-setup)
  :init
  (setq flycheck-languagetool-server-jar "/opt/LanguageTool-6.6/languagetool-server.jar"
	flycheck-languagetool-language "fr-FR"))

;; LangTool path
;;(setq langtool-language-tool-jar "/opt/LanguageTool-6.6/languagetool-commandline.jar")
;;(require 'langtool)

;; LanguageTool
;; (setq languagetool-java-arguments '("-Dfile.encoding=UTF-8")
;;       languagetool-console-command "/opt/LanguageTool-6.6/languagetool-commandline.jar"
;;       languagetool-server-command "/opt/LanguageTool-6.6/languagetool-server.jar")



;; Default salt indentation to N spaces
(setq yaml-indent-offset 2)
(setq salt-mode-indent-level 2)

;; Function to turn on ANSI colors
;; (require 'ansi-color)
;; (defun display-ansi-colors ()
;;   (interactive)
;;   (ansi-color-apply-on-region (point-min) (point-max)))


;; Render Jinja template function
;; Run and open in a buffer 'python3 /home/lilian/trans-saltmaster-yuyu/render_template.py file_path_current_buffer'
(defun jinja-render-template ()
  "Run render_template.py on the current buffer file and open the rendered output."
  (interactive)
  (let* ((input-file (buffer-file-name)))
    (if input-file
        (let* ((input-filename (file-name-nondirectory input-file))
               (input-dir (file-name-directory input-file))
               (output-filename (concat ".rendered_" input-filename))
               (output-file (expand-file-name output-filename input-dir))
               (command (format "python3 /home/lilian/trans-saltmaster-yuyu/render_template.py %s"
                                (shell-quote-argument input-file))))
          ;; Run the shell command and check for errors
          (if (= (call-process-shell-command command) 0)
              (if (file-exists-p output-file)
                  (find-file output-file)
                (message "Rendered file not found: %s" output-file))
            (message "Render script failed: %s" command)))
      (message "Buffer is not visiting a file"))))

(global-set-key (kbd "C-c c") #'jinja-render-template)

;; Render Jinja template keybind
(global-set-key (kbd "C-c c") #'jinja-render-template)

;; To edit prompts in the browser from emacs
;; (load "/home/lilian/.emacs.d/inbrower.el")

