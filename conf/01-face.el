;; Theme
(cond
 ((eq window-system t)
  (require 'solarized-dark-theme))
 (t
  (when (require 'color-theme)
    (color-theme-initialize)
    (when (require 'color-theme-solarized)
      (color-theme-solarized-dark))))
 )

;; 行間
(setq-default line-spacing 0)
