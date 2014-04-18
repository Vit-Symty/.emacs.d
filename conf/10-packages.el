;; package config
(package-initialize)
(defvar install-packages
  '(
    ac-inf-ruby
    apache-mode
    auto-complete
    coffee-mode
    color-theme
    color-theme-solarized
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
       (loop for x in install-packages
             when (not (package-installed-p x))
             collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
