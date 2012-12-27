;; Windowsで英数と日本語にMeiryoを指定
;; Macで英数と日本語にRictyを指定
(let ((ws window-system))
  (cond ((eq ws 'w32)
         (set-face-attribute 'default nil
                             :family "Meiryo"  ;; 英数
                             :height 100)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Meiryo")))  ;; 日本語
        ((eq ws 'ns)
         (set-face-attribute 'default nil
                             :family "Ricty"  ;; 英数
                             :height 120)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))))  ;; 日本語


(require 'twilight-theme)

;;フォントカラー
(global-font-lock-mode t)
;(if window-system
;    (progn
;      (add-to-list 'default-frame-alist '(foreground-color . "snow"))   ;文字色設定
;      (add-to-list 'default-frame-alist '(background-color . "gray15")) ;背景色設定
;      (add-to-list 'default-frame-alist '(cursor-color . "gray40"))     ;カーソル色設定
;      (add-to-list 'default-frame-alist '(mouse-color . "SlateBlue4"))  ;マウスポインタ
;      (set-face-foreground 'modeline "gray85")                          ;モードライン文字
;      (set-face-background 'modeline "gray35")                          ;モードライン背景
;      (set-face-foreground 'region "snow")                              ;選択中リージョン文字
;      (set-face-background 'region "gray20")                            ;選択中リージョン背景
;      (set-face-foreground 'mode-line-inactive "gray30")                ;モードライン(インアクティブ)文字
;      (set-face-background 'mode-line-inactive "gray85")                ;モードライン(インアクティブ)背景
;      (set-face-foreground 'font-lock-comment-face "ForestGreen")    ;コメント
;      (set-face-foreground 'font-lock-string-face  "moccasin")       ;文字列
;      (set-face-foreground 'font-lock-keyword-face "LightSlateBlue")    ;キーワード
;      (set-face-foreground 'font-lock-function-name-face "SlateBlue2")  ;ファンクション
;      (set-face-bold-p 'font-lock-function-name-face t)
;      ;(set-face-foreground 'font-lock-variable-name-face "MediumBlue") ;変数
;      ;(set-face-foreground 'font-lock-variable-name-face "NavajoWhite3") ;変数
;      (set-face-foreground 'font-lock-type-face "LightSeaGreen")
;      (set-face-foreground 'font-lock-builtin-face "MediumPurple3")
;      (set-face-foreground 'font-lock-constant-face "bisque3") ;定数
;      (set-face-foreground 'font-lock-warning-face "firebrick3")
;      (set-face-bold-p 'font-lock-warning-face nil)
;    )
;)

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
                              )
)

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode

;;対応する括弧を強調する。
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
;(set-face-background 'show-paren-match-face "#500")

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
(setq hl-line-face 'hlline-face)
;; (setq hl-line-face 'underline) ; 下線
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

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode
