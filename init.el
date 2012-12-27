;; Configurations for Emacs
; Language & Coding System
(prefer-coding-system 'utf-8-unix)
(set-language-environment 'Japanese)
(set-locale-environment "ja_JP.UTF-8")
(set-default-coding-systems 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)

; show debug info
(setq debug-on-error t)

;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "conf" "elisp" "elpa")

;; common lisp
(require 'cl)

;; 初期化ファイル読み込み
(load "init_mode.el")
(load "init_window.el")
(load "init_locale.el")
(load "init_face.el")
(load "init_keybind.el")
(load "init_modeline.el")

;; package config
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
