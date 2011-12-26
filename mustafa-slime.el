;; My slime conf

(add-to-list 'load-path "~/.emacs.d/vendor/slime/")
(add-to-list 'load-path "~/.emacs.d/vendor/slime/contrib/")

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(require 'slime)

(slime-setup '(slime-fancy
	       slime-banner))
