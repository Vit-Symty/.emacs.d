; font
(cond ((eq window-system 'w32)
       (set-face-attribute 'default nil
                           :family "Inconsolata"  ;; 英数
                           :height 100)
       (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Migu 2M")))
      ((string-match "apple-darwin" system-configuration)
       (set-face-attribute 'default nil
                           :family "Ricty Discord"
                           :height 120)
       (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty Discord")))
      ((string-match "linux" system-configuration)
       (add-to-list 'default-frame-alist '(font . "ricty discord-9"))))

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
                              ))

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
;(set-face-background 'trailing-whitespace "#b14770")
