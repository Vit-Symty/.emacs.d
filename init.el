(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8-unix)

(setq debug-on-error t)

;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; load-pathに追加するフォルダ
;; 2つ以上フォルダを指定する場合の引数 => (add-to-load-path "elisp" "xxx" "xxx")
(add-to-load-path "conf" "elisp" "el-get")

;; el-get config
;(setq el-get-dir "~/.emacs.d/el-get/")
;(require 'el-get)
;(el-get 'sync)
