(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))
(add-hook 'js3-mode-hook
          (lambda ()
            (setq tab-width 2 indent-tabs-mode t)))
(add-to-list 'ac-modes 'js3-mode)
