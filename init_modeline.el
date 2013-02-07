;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;; カーソルの位置が何文字目かを表示する。
(column-number-mode t)

;; カーソルの位置が何行目かを表示する。
(line-number-mode t)

;; モードラインに現在時刻を表示する
(setq display-time-format "%Y-%m-%d %H:%M")
(display-time)

;; モードラインの割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)

(when my-lines-page-mode
  (setq my-mode-line-format "%d")
  (if size-indication-mode
      (setq my-mode-line-format (concat my-mode-line-format " of %%I")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
         (setq my-mode-line-format (concat my-mode-line-format " (%%l,%%c)")))
        ((eq line-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
        ((eq column-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " C%%c"))))

  (setq mode-line-position
        '(:eval (format my-mode-line-format
                        (count-lines (point-max) (point-min))))))

