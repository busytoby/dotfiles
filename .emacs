;; -*-Emacs-Lisp-*-

;; jas' .emacs resource
;; busytoby@gmail.com
;; last modified 04/08/09

;;load-path
(setq load-path
      (append (list
         (expand-file-name "~/.emacs.d/elisp/")
         (expand-file-name "~/.emacs.d/conf/")
         )
        load-path))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)
(setq default-abbref-mode t)

;; OS detection
(defvar run-unix
  (or (equal system-type 'gnu/linux)
      (or (equal system-type 'usg-unix-v)
          (or  (equal system-type 'berkeley-unix)
               (equal system-type 'cygwin)))))

(defvar run-linux
  (equal system-type 'gnu/linux))
(defvar run-system-v
  (equal system-type 'usg-unix-v))
(defvar run-bsd
  (equal system-type 'berkeley-unix))
(defvar run-cygwin
  (equal system-type 'cygwin))

(defvar run-w32
  (and (null run-unix)
       (or (equal system-type 'windows-nt)
           (equal system-type 'ms-dos))))

(defvar run-darwin (equal system-type 'darwin))

;; Emacsen detection
(defvar run-emacs22
  (and (equal emacs-major-version 22)
       (null (featurep 'xemacs))))
(defvar run-emacs23
  (and (equal emacs-major-version 23)
       (null (featurep 'xemacs))))
(defvar run-meadow (featurep 'meadow))
(defvar run-meadow3 (and run-meadow run-emacs22))
(defvar run-carbon-emacs (and run-darwin window-system))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(color-theme-is-cumulative nil)
 '(emms-lastfm-password "xxxxxxxx")
 '(emms-lastfm-username "secretgoldfish")
 '(mumamo-submode-indent-offset-0 4)
 '(twit-pass "xxxxxx")
 '(twit-user "busytoby")
 '(twit-user-image-dir "~/.emacs.d/images/twitter"))

(load "nxhtml/autostart.el")

(setq mumamo-chunk-coloring 'no-chunks-colored
      mumamo-submode-indent-offset 4)

(autoload 'geben "geben" "PHP Debugger on Emacs" t)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil
                :background "black" :foreground "white"
                :inverse-video nil :box nil :strike-through nil
                :overline nil :underline nil :slant normal :weight normal
                :height 108 :width normal :foundry "unknown"
                :family "DejaVu Sans Mono"))))
 '(font-lock-builtin-face ((t (:foreground "#FFA100"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#F30021"))))
 '(font-lock-comment-face ((t (:foreground "#DEEDD0"))))
 '(font-lock-constant-face ((t (:foreground "#FFF7B8"))))
 '(font-lock-doc-face ((t (:foreground "#FF8B40"))))
 '(font-lock-function-name-face ((t (:foreground "#FFFA73"))))
 '(font-lock-keyword-face ((t (:foreground "#34D1B2"))))
 '(font-lock-negation-char-face ((t (:foreground "#5ED1BA"))))
 '(font-lock-preprocessor-face ((t (:foreground "#A66900"))))
 '(font-lock-string-face ((t (:foreground "#D0DEDD"))))
 '(font-lock-type-face ((t (:foreground "#FFF7CB"))))
 '(font-lock-variable-name-face ((t (:foreground "#FFF7CB"))))
 '(font-lock-warning-face ((t (:foreground "#FFD1BA"))))
 '(minibuffer-prompt ((t (:foreground "#5ED1BA"))))
 '(mumamo-background-chunk-major ((t (:background "dark"))))
 '(mumamo-background-chunk-submode ((t (:background "dark"))))
 '(mumamo-background-chunk-submode1 ((t (:background "dark"))))
 '(mumamo-background-chunk-submode2 ((t (:background "dark"))))
 '(mumamo-background-chunk-submode3 ((t (:background "dark"))))
 '(mumamo-background-chunk-submode4 ((t (:background "dark"))))
 '(rngalt-validation-header-bottom ((t (:foreground "white"))))
 '(rngalt-validation-header-top ((t (:foreground "RGB:87/CE/FA"))))
 '(twit-author-face ((t (:weight bold :height 1.0 :family "mono"))))
 '(twit-message-face ((default (:height 0.95 :family "helv")) (nil nil)))
 '(twit-title-face ((((class color) (background dark)) (:underline "DeepSkyBlue"))))
 '(twit-zebra-1-face ((((class color) (background dark)) nil)))
 '(twit-zebra-2-face ((((class color) (background dark)) nil))))

;; start loading stuff
(load "init-common")
(load "init-session")
(load "twit")
(require 'emms-setup)
(require 'emms-info-libtag)
(require 'emms-player-mpg321-remote)
(emms-devel)
(emms-default-players)
(emms-lastfm)
(emms-lastfm-activate)
(emms-lastfm-enable)
(push 'emms-player-mpg321-remote emms-player-list)
(push 'emms-player-mplayer emms-player-list)
(push 'emms-player-mplayer-playlist emms-player-list)
(setq
   emms-info-asynchronously t
   emms-info-functions '(emms-info-libtag)
   emms-source-file-default-directory "~/mp3"
   emms-mode-line-format " %s "
   emms-show-format "np: %s")

(setq tags-table-list
      '("~/.emacs.d"
        "~/sandbox/clearmyrecord/trunk/TAGS"
        "~/sandbox/hard2hire/trunk/TAGS"
        "~/sandbox/origami/trunk/TAGS"))

(require 'fuzzy-format)
(setq fuzzy-format-default-indent-tabs-mode nil
      fuzzy-format-auto-format t
      fuzzy-format-auto-indent t)
(global-fuzzy-format-mode t)

(global-font-lock-mode t)
(setq x-select-enable-clipboard t)

(setq indent-line-function 'indent-relative)
(setq tab-stop-list (loop for i from 4 to 120 by 4 collect i))
(setq cssm-indent-function #'cssm-c-style-indenter
       cssm-indent-level '4)

(setq c-offsets-alist '((member-init-intro . ++)))

(defconst jas-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (case-label        . +)
                                   (arglist-intro     . +)
                                   (arglist-cont-nonempty . c-lineup-math)
                                   (arglist-close . c-lineup-close-paren)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "leet style")
(c-add-style "jas" jas-c-style)

(setq c-default-style "jas"
      c-basic-offset 4
      tab-width 4)

(when run-w32
    (set-alpha '(90 50)))

;;default attributes for text-mode
(setq text-mode-hook '(lambda()
            (auto-fill-mode t) ;;physical line break
;;            (flyspell-mode t) ;;spellchek on the fly
;;            (ispell-change-dictionary "british" nil)
            ))

;; to use M$ style keyboard bindings, uncomment the following
(pc-selection-mode)

;; Mouse
;; (global-set-key [mouse-3] 'imenu)
(mouse-avoidance-mode 'exile)

;; Misc
(global-set-key [C-tab] "\C-q\t")       ; Control tab quotes a tab.
(setq backup-by-copying-when-mismatch t)

(defvar first-time t
  "Flag signifying this is the first time that .emacs has been evaled")

(defun untabify-buffer ()
  "Untabify current buffer"
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  "Untabify current buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanfile-hook ()
  "Hooks which run on file write to strip tabs and clean spacing"
  (prog1 nil
    (set-buffer-file-coding-system 'utf-8-unix)
    (untabify-buffer)
    (delete-trailing-whitespace)))

(defun indent-entire-buffer ()
  "Indent the entire buffer."
  (untabify-buffer)
  (indent-region))

;; home cursor, place cursor in upper left of window
(defun point-to-top ()
  "Put point on top line of window."
  (interactive)
  (move-to-window-line 0))

(global-set-key "\M-,"  'point-to-top)
(global-set-key "\C-x," 'tags-loop-continue);; remap, we stole default above
(global-set-key [backtab] 'dabbrev-expand)

;; place cursor in lower left of window
(defun point-to-bottom ()
  "Put point at beginning of last visible line."
  (interactive)
  (move-to-window-line -1))

(global-set-key "\M-."  'point-to-bottom)

;; place current line at top of window
(defun line-to-top ()
  "Move current line to top of window."
  (interactive)
  (recenter 0))

(global-set-key "\M-!"  'line-to-top)

;; C++ and C mode
(defun my-c++-mode-hook ()
  (define-key c++-mode-map "\C-m"  'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit)
  (setq c++-auto-hungry-initial-state t);; 'none t
  (setq c++-delete-function 'backward-delete-char)
  (setq comment-column 50);; comment column position
  (c-toggle-auto-state 1);; auto indentation
  (c-toggle-hungry-state 1);; hungry delete key
  (c-toggle-auto-hungry-state 1);; hungry delete key
  (setq c-auto-newline nil);; auto return to next line on ; {}
  (setq c++-empty-arglist-indent 2))

(defun my-c-mode-hook ()
  (define-key c-mode-map "\C-m"  'reindent-then-newline-and-indent)
  (define-key c-mode-map "\C-ce" 'c-comment-edit)
  (setq c-auto-hungry-initial-state 'none)
  (setq c-delete-function 'backward-delete-char)
  (setq c-tab-always-indent t)
  (setq comment-column 50);; comment column position
  (c-toggle-auto-state 1);; auto indentation
  (c-toggle-hungry-state 1);; hungry delete key
  (c-toggle-auto-hungry-state 1);; hungry delete key
  (setq c-auto-newline nil));; auto return to next line

;; Perl mode
(defun my-perl-mode-hook ()
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent))

;; Scheme mode
(defun my-scheme-mode-hook ()
  (define-key scheme-mode-map "\C-m" 'reindent-then-newline-and-indent))

;; Emacs-Lisp mode
(defun my-lisp-mode-hook ()
  (define-key lisp-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key lisp-mode-map "\C-i" 'lisp-indent-line)
  (define-key lisp-mode-map "\C-j" 'eval-print-last-sexp))

;; PHP Mode
(defun my-php-mode-hook ()
  (setq fill-column 108)
  (setq case-fold-search t)
  (setq php-manual-url "http://www.php.net/manual/en/")
  (setq php-mode-force-pear t)
  (setq php-search-url "http://www.php.net/")
  (setq show-trailing-whitespace t))
;;  (add-hook 'before-save-hook 'cleanfile-hook))

;; Add all of the hooks
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'scheme-mode-hook 'my-scheme-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'perl-mode-hook 'my-perl-mode-hook)
(add-hook 'php-mode-hook 'my-php-mode-hook)

;; Complement to next-error
(defun previous-error (n)
  "Visit previous compilation error message and corresponding source code."
  (interactive "p")
  (next-error (- n)))

;; Misc
(setq visible-bell t)
(setq next-line-add-newlines nil)
(setq compile-command "make")
(setq suggest-key-bindings nil)
(display-time)
(setq default-major-mode 'text-mode)
(setq scroll-step 1)
(tool-bar-mode -1)

;; (delete-selection-mode t)

;;  * Here is some Emacs Lisp that will make the % key show the matching
;;    parenthesis, like in vi.  In addition, if the cursor isn't over a
;;    parenthesis, it simply inserts a % like normal.
(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; Elisp archive searching
(autoload 'format-lisp-code-directory "lispdir" nil t)
(autoload 'lisp-dir-apropos "lispdir" nil t)
(autoload 'lisp-dir-retrieve "lispdir" nil t)
(autoload 'lisp-dir-verify "lispdir" nil t)

(progn
    (global-set-key [backspace] 'backward-delete-char)
    (global-set-key [delete] 'delete-char)
    (load-library "iso-transl"))

;; TTY type terminal
(if (and (not window-system)
         (not (equal system-type 'ms-dos)))
    (progn
      (if first-time
          (progn
            (keyboard-translate ?\C-h ?\C-?)
            (keyboard-translate ?\C-? ?\C-h)))))

;; Under UNIX
(if (not (equal system-type 'ms-dos))
    (progn
      (if first-time
          (server-start))))

;; Restore the "desktop" - do this as late as possible
(if first-time
    (progn
      (desktop-load-default)
      (desktop-read)))

;; Indicate that this file has been read at least once
(setq first-time nil)

;; No need to debug anything now
(setq debug-on-error nil)

;; All done
(message "All done, %s%s" (user-login-name) ".")

;;
;; *** Macros to add and remove ^M's from files
;; [Only problem: "todos" always adds a blank line to the bottom.]

(defun todos ()
  "Add a CR (^M) character to each line in order to convert a file from\n\
UNIX to MS-DOS format."
  (interactive)
  (let ((old-point (point)))
    (push-mark (point-min) t)
    (goto-char (point-min))
    (replace-regexp "\C-m*$" "\C-m")
    (goto-char old-point)
    (pop-mark)))

(defun fromdos ()
  "Remove CR (^M) characters from the end of lines in order to convert\n\
a file from MS-DOS to UNIX format."
  (interactive)
  (let ((old-point (point)))
    (push-mark (point-min) t)
    (goto-char (point-min))
    (replace-regexp "\C-m*$" "")
    (goto-char old-point)
    (pop-mark)))

(add-to-list 'auto-mode-alist '("\\.ctp\\'" . nxhtml-mumamo-mode))
(require 'mwheel)
(require 'hideshow)
