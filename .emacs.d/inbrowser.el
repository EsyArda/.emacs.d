;; https://github.com/stsquad/emacs_chrome
;; (use-package edit-server
;;   :ensure t
;;   :commands edit-server-start
;;   :init (if after-init-time
;;               (edit-server-start)
;;             (add-hook 'after-init-hook
;;                       (lambda() (edit-server-start))))
;;   :config (setq edit-server-new-frame-alist
;;                 '((name . "Edit with Emacs FRAME")
;;                   (top . 200)
;;                   (left . 200)
;;                   (width . 80)
;;                   (height . 25)
;;                   (minibuffer . t)
;;                   (menu-bar-lines . t)
;;                   (window-system . x))))


;; https://github.com/KarimAziev/chrome-emacs
;; https://github.com/KarimAziev/atomic-chrome
;; Installed websocket
(add-to-list 'load-path "~/.emacs.d/atomic-chrome/")
(require 'atomic-chrome)
(atomic-chrome-start-server)
(use-package atomic-chrome
  :defer t
  :init
  (defvar km-atomic-chrome-first-frame-changed nil
    "Non-nil if a frame focus change occurred after Emacs started.
Tracks whether to defer `atomic-chrome' server startup until the first focus
change.")
  (defun km-atomic-chrome-run-server-after-focus-change (&rest _)
    "Start Atomic Chrome server upon graphical frame focus change.

For GUI sessions:
- The server is started only on the second focus change event (the first one
  is triggered immediately after Emacs starts).
- After starting the server, this function removes itself from
  `after-focus-change-function' to avoid further overhead.

In terminal (`tty') environments, it disables itself immediately since focus
changes are not applicable."
    (let ((frame (selected-frame)))
      (if (tty-top-frame frame)
          (remove-function after-focus-change-function
                           'km-atomic-chrome-run-server-after-focus-change)
        (when (frame-parameter frame 'last-focus-update)
          (if (not km-atomic-chrome-first-frame-changed)
              (setq km-atomic-chrome-first-frame-changed t)
            (remove-function after-focus-change-function
                             'km-atomic-chrome-run-server-after-focus-change)
            (require 'atomic-chrome)
            (when (fboundp 'atomic-chrome-start-server)
              (atomic-chrome-start-server)))))))
  (add-function :after after-focus-change-function
                'km-atomic-chrome-run-server-after-focus-change)
  ;; :straight (atomic-chrome
  ;;            :type git
  ;;            :flavor nil
  ;;            :host github
  ;;            :repo "KarimAziev/atomic-chrome")
  :defines atomic-chrome-create-file-strategy
  :config
  (setq-default atomic-chrome-buffer-open-style 'frame)
  (setq-default atomic-chrome-auto-remove-file t)
  (setq-default atomic-chrome-url-major-mode-alist
                '(("github.com" . gfm-mode)
                  ("us-east-2.console.aws.amazon.com" . yaml-ts-mode)
                  ("ramdajs.com" . js-ts-mode)
                  ("gitlab.com" . gfm-mode)
                  ("leetcode.com" . typescript-ts-mode)
                  ("typescriptlang.org" . typescript-ts-mode)
                  ("jsfiddle.net" . js-ts-mode)
                  ("w3schools.com" . js-ts-mode)))
  (add-to-list 'atomic-chrome-create-file-strategy
               '("~/repos/ts-scratch/src/" :extension
                 ("js" "ts" "tsx" "jsx" "cjs" "mjs")))
  (add-to-list 'atomic-chrome-create-file-strategy
               '("~/repos/python-scratch" :extension ("py"))))
