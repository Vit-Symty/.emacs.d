;; Sass mager mode
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(defun my-sass-mode-common-init ()
  (setq tab-width 2)
  )
(add-to-list 'ac-modes 'sass-mode)
(add-hook 'sass-mode-hook 'ac-css-mode-setup)
(add-hook 'sass-mode-hook 'my-sass-mode-common-init)
