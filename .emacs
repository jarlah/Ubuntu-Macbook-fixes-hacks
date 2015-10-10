(require 'package)

(setq default-input-method "MacOSX")

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24) 
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(custom-set-variables
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

(unless (package-installed-p 'sbt-mode)
  (package-refresh-contents) (package-install 'sbt-mode))

(unless (package-installed-p 'ensime)
  (package-refresh-contents) (package-install 'ensime))
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(unless (package-installed-p 'neotree)
  (package-refresh-contents) (package-install 'neotree))
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; there are some great Scala yasnippets, browse through:
;; https://github.com/AndreaCrotti/yasnippet-snippets/tree/master/scala-mode
(add-hook 'scala-mode-hook #'yas-minor-mode)
;; but company-mode / yasnippet conflict. Disable TAB in company-mode with
(define-key company-active-map [tab] nil)
