; 日本語 info が文字化けしないように
(auto-compression-mode t)

;; Grep for Japanese
(if (file-exists-p "/usr/bin/lgrep")
    (setq grep-command "lgrep -n ")
)
