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

;; term
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
  ;; PATH と exec-path に同じ物を追加します
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))
(setenv "MANPATH" (concat "/usr/local/man:/usr/share/man:/Developer/usr/share/man:/sw/share/man" (getenv "MANPATH")))
;; shell の存在を確認
(defun skt:shell ()
  (or (executable-find "zsh")
      (executable-find "bash")
      ;; (executable-find "f_zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
      ;; (executable-find "f_bash") ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
      (executable-find "cmdproxy")
      (error "can't find 'shell' command in PATH!!")))

;; Shell 名の設定
(setq shell-file-name (skt:shell))
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; howm
;(setq howm-view-title-header "#")
;(setq howm-view-title-regexp-grep "^/# +[^2]")
;(setq howm-view-title-regexp "^\\#\\( +\\([^2].*\\)\\|\\)$")
;(setq howm-menu-lang 'ja)
;(global-set-key "\C-c,," 'hown-menu)
;(require 'howm)
;(setq howm-directory "~/Dropbox/howm")
; 完了ずみ todo は表示しない
;(setq howm-todo-menu-types "[-+~!]")
;(setq howm-menu-expiry-hours nil)
; 内容が 0 ならファイルごと削除する
;(if (not (memq 'delete-file-if-no-contents after-save-hook))
;    (setq after-save-hook
;          (cons 'delete-file-if-no-contents after-save-hook)))
;(defun delete-file-if-no-contents ()
;  (when (and
;         (buffer-file-name (current-buffer))
;         (string-match "\\.howm" (buffer-file-name (current-buffer)))
;         (= (point-min) (point-max)))
;    (delete-file
;     (buffer-file-name (current-buffer)))))
;; M-t で今日の日付で todo 入力。
;(defun oreore-howm-insert-todo ()
;  (interactive)
;  (insert (format-time-string "[%Y-%m-%d]+ ")))
;(define-key esc-map
;  "t"
;  'oreore-howm-insert-todo)
; markdown-mode でメモる
;(setq howm-template "# %title%cursor\n%date\n")
;(setq howm-menu-file "~/Dropbox/.howm-menu")
;(setq howm-file-name-format "%Y%m%d-%H%M%S.md")

;; ruby-mode
; (setq ruby-block-highlight-toggle 'overlay)
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;; Sass mager mode
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(defun my-sass-mode-common-init ()
  (setq tab-width 2)
  )
(add-hook 'sass-mode-hook 'my-sass-mode-common-init)

;; markdown-mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; 自動コンパイル
;; http://www.emacswiki.org/emacs/auto-async-byte-compile.el
;(when (require 'auto-async-byte-compile nil t)
;  ;; 自動コンパイルを無効にするファイル名の正規表現
;  (setq auto-async-byte-compile-exclude-files-regexp "init.el")
;  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))
