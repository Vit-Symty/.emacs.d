;; package config
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(defvar require-packages
  '(
    ac-inf-ruby
    apache-mode
    auto-complete
    coffee-mode
    dropdown-list
    egg
    findr
    flymake-coffee
    flymake-css
    flymake-easy
    flymake-haml
    flymake-json
    flymake-php
    flymake-ruby
    flymake-sass
    flymake-shell
    flymake-yaml
    gh
    gist
    git-commit-mode
    git-rebase-mode
    gitconfig-mode
    gitignore-mode
    haml-mode
    inf-ruby
    inflections
    init-loader
    js3-mode
    jump
    less-css-mode
    logito
    markdown-mode
    multi-term
    noflet
    pcache
    php-mode
    popup
    rhtml-mode
    rinari
    ruby-additional
    ruby-block
    ruby-compilation
    ruby-dev
    ruby-electric
    ruby-end
    ruby-interpolation
    ruby-refactor
    ruby-tools
    rvm
    sass-mode
    scss-mode
    smarty-mode
    solarized-theme
    sql-indent
    ssh-config-mode
    sublime-themes
    tabulated-list
    tronesque-theme
    yaml-mode
    yard-mode
    yasnippet
    ))

(let ((not-installed
       (loop for x in require-packages
             when (not (package-installed-p x))
             collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
