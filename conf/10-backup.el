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
