;; My slime conf

(add-to-list 'load-path "~/.emacs.d/vendor/slime/")
(add-to-list 'load-path "~/.emacs.d/vendor/slime/contrib/")

(let ((s-path (m-expand-prog-path "sbcl")))
(if s-path
    (progn
      (setq inferior-lisp-program s-path)
      (require 'slime)
      (slime-setup '(slime-fancy
		     slime-banner)))
  (message "Cannot find SBCL!!!")))