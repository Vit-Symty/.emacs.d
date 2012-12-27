;; auto complete
(require 'auto-complete-config)
(ac-config-default)

;; 自動コンパイル
;; http://www.emacswiki.org/emacs/auto-async-byte-compile.el
;(when (require 'auto-async-byte-compile nil t)
;  ;; 自動コンパイルを無効にするファイル名の正規表現
;  (setq auto-async-byte-compile-exclude-files-regexp "init.el")
;  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))
