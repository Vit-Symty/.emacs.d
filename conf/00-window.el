;; 起動画面を消す
(setq inhibit-startup-message t)

;; ツールバーを非表示
(tool-bar-mode 0)

;; スクロールバー位置設定
(set-scroll-bar-mode 'left) ;;left:右 right:左 nil:なし

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; 初期フレーム設定
;(setq initial-frame-alist
;      (append
;       '((top . 32) ;フレームのY位置(ピクセル数)
;         (left . 450) ;フレームのX位置(ピクセル数)
;         (width . 128) ;フレーム幅(文字数)
;         (height . 52) ;フレーム高(文字数)
;         )
;       initial-frame-alist)
;)
;; 新規フレームのデフォルト設定
(cond ((string-match "apple-darwin" system-configuration)
       (setq default-frame-alist
             (append
              '((width . 156)  ;フレーム幅(文字数)
                (height . 56) ;フレーム高(文字数)
                )
              default-frame-alist)
             ))
      ((string-match "linux" system-configuration)
       (setq default-frame-alist
             (append
              '((width . 192)  ;フレーム幅(文字数)
                (height . 56) ;フレーム高(文字数)
                )
              default-frame-alist)
             )))

;; ウインドウ透明度設定
(add-to-list 'default-frame-alist '(alpha . 95))
(set-frame-parameter nil 'alpha 90)

