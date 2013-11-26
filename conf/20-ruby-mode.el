;; ruby-mode
(setq ruby-block-highlight-toggle 'overlay)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'ac-modes 'ruby-mode)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)

(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))
  (define-key ruby-mode-map "\C-c\C-e" 'ruby-insert-end)

;; Rinari
(require 'rinari)

;; ruby-electric.el --- electric editing commands for ruby files
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; set ruby-mode indent
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

;; ruby-tools
(require 'ruby-tools)

;; ruby-electric
(require 'ruby-electric)

;; nXhtml-mode / MuMaMo-mode / rhtml-mode
;; rhtml-mode
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))

;; rails-snippets
;(yas/load-directory "~/.emacs.d/yasnippet/rails-snippets")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
(add-hook
 'ruby-mode-hook
 '(lambda ()
    ;; Don't want flymake mode for ruby regions in rhtml files
    (if (not (null buffer-file-name)) (flymake-mode))
    ;; エラー行で C-c d するとエラーの内容をミニバッファで表示する
    (define-key ruby-mode-map "\C-cd" 'credmp/flymake-display-err-minibuf)))

(defun credmp/flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count (length line-err-info-list))
         )
    (while (> count 0)
      (when line-err-info-list
        (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)
          )
        )
      (setq count (1- count)))))
