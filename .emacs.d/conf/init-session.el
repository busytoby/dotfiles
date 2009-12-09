(require 'session)
(require 'minibuf-isearch nil t)


(setq session-undo-check -1)
(add-hook 'after-init-hook 'session-initialize)

(require 'cl)
(defun minibuffer-delete-duplicate ()
  (let (list)
    (dolist (elt (symbol-value minibuffer-history-variable))
      (unless (member elt list)
        (push elt list)))
    (set minibuffer-history-variable (nreverse list))))
(add-hook 'minibuffer-setup-hook 'minibuffer-delete-duplicate)

;/****************************************************************
;* Set Size of the Kill-Ring and other histories that we use constantly
;****************************************************************/
(setq kill-ring-max 500)
(setq extended-command-history-max 50)
(setq query-replace-history-max 50)
(setq replace-string-history-max 50)
(setq file-name-history-max 50)
(setq replace-regex-history-max 50)
(setq minibuffer-history-max 1000)
(setq shell-command-history-max 1000)
(setq find-file-history-max 1000)

(savehist-mode 1)

(setq session-globals-include
      '((kill-ring 50)
        (session-file-alist 100 t)
        (file-name-history 200)))
