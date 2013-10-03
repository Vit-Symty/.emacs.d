;; ruby-mode
(setq ruby-block-highlight-toggle 'overlay)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'ac-modes 'ruby-mode)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
