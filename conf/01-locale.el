; 日本語 info が文字化けしないように
(auto-compression-mode t)

;; Grep for Japanese
(if (file-exists-p "/usr/bin/lgrep")
    (setq grep-command "lgrep -n ")
)

;; Input method
(cond ((eq window-system 'w32))
      ((or (eq window-system 'ns) (eq window-system 'mac) (string-match "apple-darwin" system-configuration))
       (setq default-input-method "MacOSX"))
      ((string-match "linux" system-configuration)
       (require 'mozc)
       (set-language-environment "Japanese")
       (setq default-input-method "japanese-mozc")
       ;(setq mozc-candidate-style 'overlay)
       ;(setq mozc-candidate-style 'echo-area)  ;複数行で変換候補を表示
       (set-face-attribute 'mozc-cand-overlay-even-face 'nil
                           :background "gray" :foreground "black")
       (set-face-attribute 'mozc-cand-overlay-odd-face 'nil
                           :background "gray" :foreground "black"))
       )
      )
# mozc :: svn checkout http://mozc.googlecode.com/svn/trunk/ mozc-read-only

