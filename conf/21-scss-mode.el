;; Scss mager mode
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(setq tab-width 2)
(setq scss-compile-at-save nil)
(add-to-list 'ac-modes 'scss-mode)
(add-hook 'scss-mode-hook 'ac-css-mode-setup)
