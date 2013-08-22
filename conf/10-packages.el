;; package config
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defvar require-packages
  '(
    apache-mode
    auto-complete
    coffee-mode
    dropdown-list
    egg
    emmet-mode
    gist
    git-commit-mode
    git-rebase-mode
    gitconfig-mode
    gitignore-mode
    google-translate
    helm
    helm-gist
    helm-git
    helm-ls-git
    helm-migemo
    helm-open-github
    helm-rails
    helm-rubygems-local
    helm-sheet
    helm-spaces
    helm-themes
    init-loader
    js3-mode
    markdown-mode
    migemo
    multi-term
    php-auto-yasnippets
    php-mode
    popup
    popwin
    rbenv
    rhtml-mode
    rinari
    ruby-block
    ruby-compilation
    ruby-dev
    ruby-electric
    ruby-end
    ruby-hash-syntax
    ruby-interpolation
    ruby-refactor
    ruby-tools
    scss-mode
    smarty-mode
    solarized-theme
    sql-indent
    ssh-config-mode
    sublime-themes
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
