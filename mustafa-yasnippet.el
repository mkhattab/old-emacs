;; yay! snippet

(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")

(require 'yasnippet)

(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")

(setq yas/prompt-functions '(yas/ido-prompt))