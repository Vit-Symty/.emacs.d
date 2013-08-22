;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;;shell-mode

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

;; 選択範囲をハイライト
(setq-default transient-mark-mode t)

;; カーソルの場所を保存
(require 'saveplace)
(setq-default save-place t)
