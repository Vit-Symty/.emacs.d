(defun my-c-mode-hook ()
  (c-set-style "linux")
  (setq c-basic-offset tab-width))

;; インデント時にタブを使わないでスペースを使う
(setq-default indent-tabs-mode nil)

;; タブ幅を 2 に設定
(setq-default tab-width 2)
