;; My slime conf

(add-to-list 'load-path "~/.emacs.d/vendor/slime/")
(add-to-list 'load-path "~/.emacs.d/vendor/slime/contrib/")

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(require 'slime)

(slime-setup '(slime-fancy
	       slime-banner))

(let ((slime-path (or
		   (and (file-exists-p "/usr/local/bin/sbcl") "/usr/local/bin/sbcl")
		   (and (file-exists-p "/usr/bin/sbcl") "/usr/bin/sbcl"))
		  ))
  (if slime-path
      (progn
	(setq inferior-lisp-program slime-path)
	(require 'slime)
	(slime-setup '(slime-fancy
		       slime-banner)))
    nil))
