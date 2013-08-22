;; Sass mager mode
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(defun my-sass-mode-common-init ()
  (setq tab-width 2)
  )
(add-hook 'sass-mode-hook 'my-sass-mode-common-init)
