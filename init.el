;; Configurations for Emacs

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

;; common lisp
(require 'cl)

;; package config
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; 初期化ファイル読み込み
(load "init_window.el")    ;; ウインドウの設定
(load "init_face.el")      ;; カラースキーマやテーマの設定
(load "init_mode.el")      ;; メジャーモードの設定
(load "init_locale.el")    ;; 言語固有(日本語)の設定
(load "init_keybind.el")   ;; キーバインドの設定
(load "init_modeline.el")  ;; モードラインの表示設定
