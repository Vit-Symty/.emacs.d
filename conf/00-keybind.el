; [delete]をBackspaceからDeleteに変更
(global-set-key [delete] 'delete-char)

; ^C-hをBackspaceに変更
(global-set-key "\C-h" 'backward-delete-char)

; ^C-Ret で矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)

; ^M-z で行番号を指定して移動
(global-set-key "\M-z" 'goto-line)

; for Develop
(global-set-key (kbd "C-;") 'comment-dwim) ;; M-; is the defualt
(global-set-key (kbd "C-c c") 'compile)

; for term-mode
(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (term shell-file-name)))
