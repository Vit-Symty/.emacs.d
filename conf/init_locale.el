; 日本語 info が文字化けしないように
(auto-compression-mode t)

;; Grep for Japanese
(if (file-exists-p "/usr/bin/lgrep")
    (setq grep-command "lgrep -n ")
)

;; Input method
(require 'mozc)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)
(setq mozc-candidate-style 'echo-area)  ;複数行で変換候補を表示
