
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" default)))
 '(package-selected-packages
   (quote
    (markdown-mode editorconfig base16-theme company-tern scss-mode json-mode web-mode alchemist yasnippet flx-ido emmet-mode evil-multiedit flycheck monokai-theme powerline-evil helm-projectile better-defaults ## helm magit projectile use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; Package Install
(use-package projectile
  :ensure t)
(use-package magit
  :ensure t)
(use-package helm
  :ensure t)
(use-package evil
  :ensure t)
(use-package better-defaults
  :ensure t)
(use-package magit
  :ensure t)
(use-package helm-projectile
  :ensure t)
(use-package powerline-evil
  :ensure t)
(use-package monokai-theme
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package evil-multiedit
  :ensure t)
(use-package emmet-mode
  :ensure t)
(use-package flx-ido
  :ensure t)
(use-package yasnippet
  :ensure t)
(use-package alchemist
  :ensure t)
(use-package web-mode
  :ensure t)
(use-package json-mode
  :ensure t)
(use-package scss-mode
  :ensure t)
(use-package company
  :ensure t)
(use-package company-tern
  :ensure t)
(use-package base16-theme
  :ensure t)
(use-package editorconfig
  :ensure t)
(use-package markdown-mode
  :ensure t)
;;; End Package Install

;;; Clipboard
(setq x-select-enable-clipboard nil)

(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        )
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )

(defun paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "graphics active")
        )
    (insert (shell-command-to-string "xsel -o -b"))
    )
  )

(global-set-key [f8] 'copy-to-clipboard)
(global-set-key [f9] 'paste-from-clipboard)
;;; End Clipboard

;;; Bindings
(global-set-key (kbd "M-x") 'helm-M-x)
;;;(global-set-key (kbd "C-x p") 'projectile-find-file)
(global-set-key (kbd "C-x p") 'helm-projectile)
;;; Evil multiedit
(evil-multiedit-default-keybinds)

;;; Magit
(global-set-key (kbd "M-s") 'magit-status)
(global-set-key (kbd "M-a") 'magit-stage-file)
(global-set-key (kbd "M-c") 'magit-commit)
(global-set-key (kbd "M-p") 'magit-push-current-to-upstream)

;;; Css
(setq scss-compile-at-save 'nil)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)

;;; Keyboards
(set-keyboard-coding-system 'utf-8)

;;; AutoComplete
(add-hook 'prog-mode-hook '(lambda() (company-mode 1)))
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;;; Number
(add-hook 'prog-mode-hook '(lambda() (linum-mode 1)))
(add-hook 'web-mode-hook '(lambda() (linum-mode 1)))

;;; Theme
(powerline-vim-theme)
(add-hook 'after-init-hook '(lambda() (load-theme 'base16-tomorrow-night)))

;;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;; Js
(yas-reload-all)
(add-hook 'prog-mode-hook 'yas-minor-mode)

;;; editoconfig
(editorconfig-mode 1)

;;; Evil mode !!!
(add-hook 'emacs-startup-hook '(lambda() (evil-mode 1)))

;;; Backup dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Projectile Exclude
(defun setup-ffi ()
  (setq ffip-prune-patterns '("*/.git/*" "*/node_modules/*" "**/dist/**" "**/coverage/**" "**/bower_components/**")))

;;; Eslint config
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'js-mode)
(setq-default flycheck-temp-prefix ".flycheck")

;;; Helper to always get eslint per project
(defun use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook 'use-eslint-from-node-modules)

;;; Flycheck mode
(add-hook 'after-init-hook 'global-flycheck-mode)

;;; JS Modes
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-mode))

;;; TernJS
; (add-to-list 'load-path " ~/.vim/tern/emacs")

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-to-list 'company-backends 'company-tern)

;;; Comint
(add-to-list 'comint-preoutput-filter-functions
             (lambda (output)
               (replace-regexp-in-string "\033\\[[0-9]+[A-Z]" "" output)))


(add-hook 'prog-mode-hook 'setup-ffi)
;;; End Bindings
