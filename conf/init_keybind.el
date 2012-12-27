; [delete]をBackspaceからDeleteに変更
(global-set-key [delete] 'delete-char)

; ^C-hをBackspaceに変更
(global-set-key "\C-h" 'backward-delete-char)

; ^C-Ret で矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)
