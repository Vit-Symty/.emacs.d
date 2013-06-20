;; Windowsで英数Inconsolataと日本語Migu 2Mを指定
;; Macで英数と日本語にRictyを指定
;(let ((ws window-system))
;  (cond ((eq ws 'w32)
;         (set-face-attribute 'default nil
;                             :family "Inconsolata"  ;; 英数
;                             :height 100)
;         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Migu 2M")))  ;; 日本語
;        ((eq ws 'ns)
;         (set-face-attribute 'default nil
;                             :family "Ricty"
;                             :height 100)
;         (set-fontset-font nil 'japanese-jisx0208
;                           (font-spec :family "Ricty"))
;         )))  ;; 日本語
(add-to-list 'default-frame-alist '(font . "ricty discord-10"))

;; Theme
(require 'solarized-dark-theme)
;(require 'ir-black-theme)
;(require 'github-theme)

;;フォントカラー
;(global-font-lock-mode t)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; 特殊文字強調(タブ,全角空白)
(defface my-face-tab '((t (:background "gray26"))) nil)
(defface my-face-tab-ul '((t (:foreground "SlateGray" :underline t))) nil)
(defface my-face-2spc '((t (:background "gray26"))) nil)
(defface my-face-2spc-ul '((t (:foreground "azure4" :underline t))) nil)
(defvar my-face-tab 'my-face-tab)
(defvar my-face-tab-ul 'my-face-tab-ul)
(defvar my-face-2spc 'my-face-2spc)
(defvar my-face-2spc-ul 'my-face-2spc-ul)
(defadvice font-lock-mode (before my-font-lock-mode ())
(font-lock-add-keywords
  major-mode '(("\t" 0 my-face-tab append)
               ("[ \t]+$" 0 my-face-tab-ul append)
               ("　" 0 my-face-2spc append)
               ("[ 　]+$" 0 my-face-2spc-ul append)
              )
))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode nil (font-lock-mode t))
                              ))

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;;shell-mode

;;対応する括弧を強調する。
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "LightCyan")

;;カーソル行にアンダーラインを表示
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "gray10"))
    (((class color)
      (background light))
     (:background "ForestGreen"))
    (t
     ()))
  "*Face used by hl-line.")
;(setq hl-line-face 'hlline-face) ;バックグラウンドカラー
(setq hl-line-face 'underline) ;下線
(global-hl-line-mode)

;; インデント時にタブを使わないでスペースを使う
(setq-default indent-tabs-mode nil)

;; タブ幅を 2 に設定
(setq-default tab-width 2)

;; 選択範囲をハイライトする
(setq-default transient-mark-mode t)

;; 行間
(setq-default line-spacing 0)

;; line num
(require 'linum)
(global-linum-mode t)
(setq linum-format "%06d")
