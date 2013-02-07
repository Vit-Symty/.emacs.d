;; unlimited undo buffer
(setq undo-outer-limit nil)

;; Backup the buffer whenever the buffer is saved
(global-set-key (kbd "C-x C-s") '(lambda () (interactive) (save-buffer 16)))

;; Backupを一箇所にまとめる
(make-variable-buffer-local 'backup-inhibited)
(when (and (require 'backup-dir nil t)
           (file-directory-p "~/.Trash"))
  ;; backup path
  (setq bkup-backup-directory-info '((t "~/.Trash" ok-create)))
  ;; generation properties
  (setq delete-old-versions t
        kept-old-versions 0
        kept-new-versions 5
        version-control t))

;; auto complete
(require 'auto-complete-config)
(ac-config-default)

;; ruby-mode
; (setq ruby-block-highlight-toggle 'overlay)

;; Sass mager mode
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

;; markdown-mode+
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; 自動コンパイル
;; http://www.emacswiki.org/emacs/auto-async-byte-compile.el
;(when (require 'auto-async-byte-compile nil t)
;  ;; 自動コンパイルを無効にするファイル名の正規表現
;  (setq auto-async-byte-compile-exclude-files-regexp "init.el")
;  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))
