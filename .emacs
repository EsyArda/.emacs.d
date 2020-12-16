;; Melpa
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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "8b58ef2d23b6d164988a607ee153fd2fa35ee33efc394281b1028c2797ddeebb" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "5c4f5c6d497b44ecde065612253cbf8a8183c75738f7af9996d3bc5961ed3493" default)))
 '(doc-view-continuous t)
 '(fci-rule-color "#3C3D37")
 '(global-linum-mode nil)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (elcord quack material-theme spacemacs-theme dracula-theme afternoon-theme ample-theme monokai-theme gruvbox-theme vscode-dark-plus-theme ## ediprolog)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(show-paren-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'ediprolog)

;; Calendrier
(setq french-holiday
      '((holiday-fixed 1 1 "Jour de l'an")
        (holiday-fixed 1 6 "Épiphanie")
        (holiday-fixed 2 2 "Chandeleur")
        (holiday-fixed 2 14 "Saint Valentin")
        (holiday-fixed 5 1 "Fête du travail")
        (holiday-fixed 5 8 "Commémoration de la capitulation de l'Allemagne en 1945")
        (holiday-fixed 6 21 "Fête de la musique")
        (holiday-fixed 7 14 "Fête nationale - Prise de la Bastille")
        (holiday-fixed 8 15 "Assomption (Religieux)")
        (holiday-fixed 11 11 "Armistice de 1918")
        (holiday-fixed 11 1 "Toussaint")
        (holiday-fixed 11 2 "Commémoration des fidèles défunts")
        (holiday-fixed 12 25 "Noël")
        ;; fêtes à date variable
        (holiday-easter-etc 0 "Pâques")
        (holiday-easter-etc 1 "Lundi de Pâques")
        (holiday-easter-etc 39 "Ascension")
        (holiday-easter-etc 49 "Pentecôte")
        (holiday-easter-etc 50 "Lundi de Pentecôte")
        (holiday-easter-etc -47 "Mardi gras")
        (holiday-float 6 0 3 "Fête des pères") ;; troisième dimanche de juin
        ;; Fête des mères
        (holiday-sexp
         '(if (equal
               ;; Pentecôte
               (holiday-easter-etc 49)
               ;; Dernier dimanche de mai
               (holiday-float 5 0 -1 nil))
              ;; -> Premier dimanche de juin si coïncidence
              (car (car (holiday-float 6 0 1 nil)))
            ;; -> Dernier dimanche de mai sinon
            (car (car (holiday-float 5 0 -1 nil))))
         "Fête des mères")))

(setq calendar-date-style 'european
      calendar-holidays (append french-holiday)
      calendar-mark-holidays-flag t)

;; El package manager
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; Highlight entier expression ONLY in scheme mode
(add-hook 'scheme-mode-hook
	  (lambda ()
	    (setq show-paren-style 'expression)))

;; Hide welcome screen
(setq inhibit-startup-screen t)

;; Always show line numbers
(global-linum-mode 1)

;; Auto-complete mode
(global-auto-complete-mode t)

;; Discord rich presence: Elcord
;; (require 'elcord)
;; (elcord-mode)
