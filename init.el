; Language & Coding System
(prefer-coding-system 'utf-8-unix)
(set-language-environment 'Japanese)
(set-locale-environment "ja_JP.UTF-8")
(set-default-coding-systems 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)

; show debug info
(setq debug-on-error 0)

;; When opened from Desktep entry, PATH won't be set to shell's value.
(let ((path-str
       (replace-regexp-in-string
        "\n+$" "" (shell-command-to-string "source $HOME/.profile; echo $PATH"))))
  (setenv "PATH" path-str)
  (setq exec-path (nconc (split-string path-str ":") exec-path)))

;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; conf/elpa/elispディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "conf" "elpa" "elisp")

;; 初期化ファイル読み込み
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/conf")

;; common lisp
(require 'cl)
