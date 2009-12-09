(set-language-environment "English")

(when run-unix
  (cond (
         (set-default-coding-systems 'utf-8)
         (set-terminal-coding-system 'utf-8)
         (set-buffer-file-coding-system 'utf-8)
         (prefer-coding-system 'utf-8-unix)
         (set-keyboard-coding-system 'utf-8))))

(cond ( (string-match "^23\." emacs-version)
        (cond (window-system
               (set-default-font "Anonymous-10")))))

(require 'font-lock)
(global-font-lock-mode t)

(setq scroll-conservatively 1)
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(menu-bar-mode -1)
(set-default 'mode-line-buffer-identification
             '(buffer-file-name ("%f") ("%b")))

(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq scroll-preserve-screen-position t)
(transient-mark-mode t)
(windmove-default-keybindings)
(setq-default tab-width 4 indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq truncate-partial-width-windows t)
(setq-default truncate-lines t)
(setq auto-save-default nil)
(setq make-backup-files nil)
;;sets the file name as window title (for graphics emacs)
(set 'frame-title-format '(multiple-frames "%b" ("" "%b")))

(setq undo-limit 100000)
(setq undo-strong-limit 130000)

(cond (window-system
       (setq x-select-enable-clipboard t)
       ))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(define-key isearch-mode-map "\C-h" 'isearch-delete-char)

;;bookmark
(defadvice bookmark-set (around bookmark-set-ad activate)
  (bookmark-load bookmark-default-file t t)
  ad-do-it
  (bookmark-save))

(defadvice bookmark-jump (before bookmark-set-ad activate)
  (bookmark-load bookmark-default-file t t))

;;http://d.hatena.ne.jp/grandVin/20080917/1221653750
(defadvice toggle-input-method (around toggle-input-method-around activate)
  (let ((input-method-function-save input-method-function))
    ad-do-it
    (setq input-method-function input-method-function-save)))

;;key config
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-r" 'replace-string)
(global-set-key "\C-xf" 'describe-function)
(global-set-key "\C-xv" 'describe-variable)

;;install-elisp
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;;auto-install
(require 'auto-install)

;;ido
;;(ido-mode t)

;;wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;tramp
(require 'tramp)

(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)
