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
   '("adbcf269aaae0e40c9d30c244f8a7dc64d4ae719a2ff9e6c46931212cb3d4ee0" "8d57d367a8734401960a7d694741a8e4bb79d04f5b410b04fbdad63b88229311" "c6df274f1c530ccb44dd79f75a94924e7fdb2b0f967d1cc7b4095ff166e58f86" default))
 '(doc-view-continuous t)
 '(markdown-command "/usr/bin/pandoc")
 '(org-export-backends '(ascii html icalendar latex man md odt))
 '(package-selected-packages
   '(ligature company-lua lua-mode flycheck-grammalecte slack flycheck-languagetool undo-fu haproxy-mode which-key php-mode magit docker-compose-mode transpose-frame crontab-mode auto-dark atomic-chrome dockerfile-mode flycheck srcery-theme helm-tramp realgud helm-ls-git company gitlab-ci-mode jinja2-mode json-mode salt-mode helm wfnames markdown-mode async))
 '(pydoc-command "python3 -m pydoc")
 '(pydoc-python-command "python3")
 '(realgud-window-split-orientation 'horizontal)
 '(realgud:pdb-command-name "python3 -m pdb")
 '(yaml-indent-offset 4 t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Couleurs ansi
;; C-x h M-: (ansi-color-apply-on-region (point-min) (point-max)) RET

;;;;;;;;;;;;;;;;;;;;
;; Theme
;;;;;;;;;;;;;;;;;;;;
;; (load-theme 'srcery t)
;; Auto dark mode system theme
(require 'auto-dark)
(auto-dark-mode t)
(use-package auto-dark
  :ensure t
  :custom
  (auto-dark-themes '((srcery) ()))
  ;; (auto-dark-detection-method nil) ;; dangerous to be set manually
  :hook
  (auto-dark-dark-mode
   . (lambda ()
       ;; something to execute when dark mode is detected
       ))
  (auto-dark-light-mode
   . (lambda ()
       ;; something to execute when light mode is detected
       (disable-theme 'srcery)
       ))
  :init (auto-dark-mode))

;;;;;;;;;;;;;;;;;;;;
;; Font
;;;;;;;;;;;;;;;;;;;;
(set-face-attribute 'default nil :height 110)
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
(global-ligature-mode 't)

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
      indent-tabs-mode nil ;; Remplace les tabulations par des espaces
      )

(tool-bar-mode -1) ; Désactive la avec les icônes d’outils
;; (delete-selection-mode t) ; Supprime la sélection quand on tappe du texte
(global-hl-line-mode t)

;; Full path in the buffer name
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Buffer history length
(setq history-length 10000)
;; Sauvegarde de l’historique toutes les 5 min
;; (run-at-time (current-time) 300 'recentf-save-list)

;; Use Python and Sh in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)
   (calc . t)))
(setq org-babel-python-command "/usr/bin/python3")

;;(add-to-list 'default-frame-alist '(width . 100))  ; Window width in characters
;;(add-to-list 'default-frame-alist '(height . 50)) ; Window height in lines


;;;;;;;;;;;;;;;;;;;;
;; Calendar
;;;;;;;;;;;;;;;;;;;;
;; Calendrier en français
;; https://www.emacswiki.org/emacs/CalendarLocalization
(setq calendar-week-start-day 1
      calendar-day-name-array ["Dimanche" "Lundi" "Mardi" "Mercredi"
                               "Jeudi" "Vendredi" "Samedi"]
      calendar-month-name-array ["Janvier" "Février" "Mars" "Avril" "Mai"
                                 "Juin" "Juillet" "Août" "Septembre"
                                 "Octobre" "Novembre" "Décembre"])
;; (require 'french-holidays)
;; (setq calendar-holidays holiday-french-holidays)

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
;; Syntax highlighting
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
(add-to-list 'auto-mode-alist '("\\.cron\\'" . crontab-mode))
(add-to-list 'auto-mode-alist '("\\.jsonl\\'" . jsonc-mode))

;;;;;;;;;;;;;;;;;;;;
;; Helm
;;;;;;;;;;;;;;;;;;;;
;;(require 'helm-config)
(helm-mode 1)
;; Helm history length
(setq helm-ff-history-max-length 10000)
;; Raccourcis pour utiliser les équivalents helm
(global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(global-set-key (kbd "C-c f") 'helm-recentf)
(global-set-key (kbd "M-s o") 'helm-occur)

;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;

;; Which key
(which-key-mode)

;; Company
(global-company-mode)
(add-hook 'after-init-hook 'company-tng-mode)
(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0.1)
;; https://emacs.stackexchange.com/questions/55028/how-can-i-disable-company-mode-in-a-shell-when-it-is-remote
(defun my-shell-mode-setup-function () 
  (when (and (fboundp 'company-mode)
             (file-remote-p default-directory))
    (company-mode -1)))
(add-hook 'shell-mode-hook 'my-shell-mode-setup-function)
(add-hook 'eshell-mode-hook 'my-shell-mode-setup-function)

;; LSP Lua
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(lua-mode . ("/home/perso/.local/opt/lua-language-server/bin/lua-language-server"))))
(add-hook 'lua-mode-hook #'eglot-ensure)

;; LSP Python
(with-eval-after-load 'eglot
  (message (file-name-directory buffer-file-name))
  (setq eglot-server-programs
        '((python-mode . ("pylsp")))))
(add-hook 'python-mode-hook #'eglot-ensure)
;; (with-eval-after-load 'eglot
;;   (message (file-name-directory buffer-file-name))
;;   (setq eglot-server-programs
;;         '((python-mode . ("/home/lilian/saltmaster/srv-yuyu/salt/venv-salt/bin/pylsp")))))



;; Flycheck
;; https://www.flycheck.org/en/latest/
(add-hook 'after-init-hook #'global-flycheck-mode)
;; (use-package flycheck-languagetool
;;   :ensure t
;;   :hook (text-mode . flycheck-languagetool-setup)
;;   :init
;;   (setq flycheck-languagetool-server-jar "/opt/LanguageTool-6.6/languagetool-server.jar"
;;       flycheck-languagetool-language "fr-FR"
;;       flycheck-salt-lint-executable "/home/lilian/saltmaster/venv-salt/bin/python3"))

;; ;; Grammalecte in Flycheck
;; ;; https://www.heptagone.org/Outils-linguistiques-et-Emacs.html
;; (use-package flycheck-grammalecte
;;   :after flycheck
;;   :demand t
;;   :bind (("C-c D" . grammalecte-find-synonyms-at-point)
;; 	 ("C-c G" . flycheck-grammalecte-correct-error-at-point))
;;   :config
;;   (setq flycheck-grammalecte-executable "~/saltmaster/venv-salt/bin/python3")
;;   ;; (setq flycheck-grammalecte-report-grammar t)
;;   ;; (setq flycheck-grammalecte-report-spellcheck nil)
;;   ;; (setq flycheck-grammalecte-report-apos nil)
;;   ;; (setq flycheck-grammalecte-report-nbsp nil)
;;   ;; (setq flycheck-grammalecte-report-esp nil)
;;   (setq flycheck-grammalecte-filters-by-mode
;;         '((org-mode "(?ims)^[ \t]*#\\+begin_src.+#\\+end_src"
;; 		    "(?im)^[ \t]*#\\+begin[_:].+$"
;; 		    "(?im)^[ \t]*#\\+end[_:].+$"
;; 		    "(?m)^[ \t]*(?:DEADLINE|SCHEDULED):.+$"
;; 		    "(?m)^\\*+ .*[ \t]*(:[\\w:@]+:)[ \t]*$"
;; 		    "(?im)^[ \t]*#\\+(?:caption|description|keywords|(?:sub)?title):"
;; 		    "(?im)^[ \t]*#\\+(?!caption|description|keywords|(?:sub)?title)\\w+:.*$")))
;;   (flycheck-grammalecte-setup))


;; salt-mode
;; (setq salt-mode-indent-level 4)
(setq salt-mode-python-program "python3")


;; Function to turn on ANSI colors
;; (require 'ansi-color)
;; (defun display-ansi-colors ()
;;   (interactive)
;;   (ansi-color-apply-on-region (point-min) (point-max)))

;; Undo fu
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z")   'undo-fu-only-undo)
(global-set-key (kbd "C-S-z") 'undo-fu-only-redo)

;; emacs-slack
;; Gérer les tokens pour plus de sécu
;; (use-package slack
;;   :bind (("C-c S K" . slack-stop)
;;          ("C-c S c" . slack-select-rooms)
;;          ("C-c S u" . slack-select-unread-rooms)
;;          ("C-c S U" . slack-user-select)
;;          ("C-c S s" . slack-search-from-messages)
;;          ("C-c S J" . slack-jump-to-browser)
;;          ("C-c S j" . slack-jump-to-app)
;;          ("C-c S e" . slack-insert-emoji)
;;          ("C-c S E" . slack-message-edit)
;;          ("C-c S r" . slack-message-add-reaction)
;;          ("C-c S t" . slack-thread-show-or-create)
;;          ("C-c S g" . slack-message-redisplay)
;;          ("C-c S G" . slack-conversations-list-update-quick)
;;          ("C-c S q" . slack-quote-and-reply)
;;          ("C-c S Q" . slack-quote-and-reply-with-link)
;;          (:map slack-mode-map
;;                (("@" . slack-message-embed-mention)
;;                 ("#" . slack-message-embed-channel)))
;;          (:map slack-thread-message-buffer-mode-map
;;                (("C-c '" . slack-message-write-another-buffer)
;;                 ("@" . slack-message-embed-mention)
;;                 ("#" . slack-message-embed-channel)))
;;          (:map slack-message-buffer-mode-map
;;                (("C-c '" . slack-message-write-another-buffer)))
;;          (:map slack-message-compose-buffer-mode-map
;;                (("C-c '" . slack-message-send-from-buffer)))
;;          )
;;   ;; :custom
;;   ;; (slack-extra-subscribed-channels (mapcar 'intern (list "some-channel")))
;;   :config
;;   (slack-register-team
;;      :name "Compilatio"
;;      :token "xoxc-XXXXXXXXXXX"
;;      :cookie "xoxd-XXXXXXXXX; d-s=0000000000"
;;      :full-and-display-names t
;;      :default t
;;      :subscribed-channels nil ;; using slack-extra-subscribed-channels because I can change it dynamically
;;      )
;;   (setq slack-prefer-current-team t))
;; (use-package alert
;;   :commands (alert)
;;   :init
;;   (setq alert-default-style 'notifier))



;;;;;;;;;;;;;;;;;;;;
;; Custom functions
;;;;;;;;;;;;;;;;;;;;
(defun jinja-render-to-file (grain-id &optional pillar-files)
  "Renders the current Jinja file given a salt GRAIN-ID (and PILLAR-FILES)."
  (interactive "sGrain ID: ")
  (let ((input-file (buffer-file-name (window-buffer (minibuffer-selected-window)))))
    (if input-file
        (let* ((input-filename (file-name-nondirectory input-file))
               (input-dir (file-name-directory input-file))
               (output-filename (concat ".rendered_" input-filename))
               (output-file (expand-file-name output-filename input-dir))
	       (context-file (concat input-dir "../init.sls"))
               (error-buffer (get-buffer-create "*jinja-render-error*"))
               ;; Redirect stderr to stdout (2>&1)
               (command (format "python3 /home/lilian/git/outils/render_template.py -g %s -o %s -c %s %s %s 2>&1"
                                grain-id output-file context-file (shell-quote-argument input-file) pillar-files))
               (orig-line (line-number-at-pos))
               (orig-col (current-column)))  ;; Save current line and column
          (with-current-buffer error-buffer
            (erase-buffer)) ;; Clear previous content
          (if (eq (call-process-shell-command command nil error-buffer) 0)
              (if (file-exists-p output-file)
                  (progn
                    (find-file output-file)
		    (view-mode 1)
                    ;; Restore same line and column
                    (goto-char (point-min))
                    (forward-line (1- orig-line))
                    (move-to-column orig-col))
                (progn
                  (with-current-buffer error-buffer
                    (insert "\nRendered file not found: " output-file))
                  (display-buffer error-buffer)))
            ;; On error: just display the error buffer
            (display-buffer error-buffer)))
      (message "Buffer is not visiting a file"))))

(defun jinja-render-to-buffer (grain-id &optional pillar-files)
  "Renders the current Jinja file for the salt GRAIN-ID and optional PILLAR-FILES to a new buffer."
  (interactive "sGrain ID: ")
  (let ((input-file (buffer-file-name)))
    (if (not input-file)
	(message "Couldn't get this buffer's file.")
      (let* ((error-buffer (get-buffer-create "*jinja-render-error*"))
	     (output-buffer (get-buffer-create (format "*jinja-rendered %s*" input-file)))
	     (args (delq nil
			 (list "/home/lilian/git/outils/render_template.py" "-g" grain-id (shell-quote-argument (buffer-file-name)) pillar-files))))
	(with-current-buffer error-buffer (erase-buffer))
	(apply #'call-process "/usr/bin/python3" nil output-buffer nil args)
	(with-current-buffer output-buffer
	  (auto-revert-mode 1))
	(let ((window (split-window-below)))
	  (set-window-buffer window output-buffer)
	  (select-window window)
	  (message "Rendered jinja file"))))))

;; Render Jinja template keybind
(global-set-key
 (kbd "C-c r")
 (lambda (grain-id)
   (interactive "sGrain ID: ")
   (jinja-render-to-file grain-id "/home/lilian/saltmaster/srv-yuyu/pillar/dev/ojs_dev.sls /home/lilian/saltmaster/srv-yuyu/pillar/all/ssl_all.sls /home/lilian/saltmaster/srv-yuyu/pillar/all/ssh_all.sls /home/lilian/saltmaster/srv-yuyu/pillar/prod/shibboleth_prod.sls /home/lilian/saltmaster/srv-yuyu/pillar/trans/tolgee_trans.sls /home/lilian/saltmaster/srv-yuyu/pillar/all/tolgee_all.sls /home/lilian/saltmaster/srv-yuyu/pillar/all/monitoring_all.sls")))

(global-set-key
 (kbd "C-c d")
 (lambda (grain-id)
   (interactive "sGrain ID: ")
   (let* ((input-file (buffer-file-name (window-buffer (minibuffer-selected-window))))
	  (output-file (expand-file-name (concat ".rendered_" (file-name-nondirectory input-file)) (file-name-directory input-file)))
	  (commande (format "python3 /home/lilian/git/outils/render_template.py -g %s -o %s %s %s"
			    grain-id
			    (shell-quote-argument output-file)
			    (shell-quote-argument input-file)
			    "/home/lilian/saltmaster/srv-yuyu/pillar/all/ssl_all.sls /home/lilian/saltmaster/srv-yuyu/pillar/dev/ojs_dev.sls")))
     (call-process-shell-command commande))))


;; To edit inputs in the browser from emacs
;; (load "/home/lilian/.emacs.d/inbrowser.el")

;; Local Variables:
;; flycheck-disabled-checkers: (emacs-lisp-checkdoc)
;; End:
