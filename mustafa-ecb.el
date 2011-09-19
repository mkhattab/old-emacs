;; ECB - Emacs code browser

(add-to-list 'load-path "~/.emacs.d/vendor/ecb/")

;; Need emacs 23.2 or greater
(if (or (and (= emacs-major-version 23) (>= emacs-minor-version 2))
	(> emacs-major-version 23))
    (require 'ecb)
  (message "You need to run Emacs version >= 23.2 for ECB"))