;;; Wanderlust - Emacs IMAP email reader

(add-to-list 'load-path "~/.emacs.d/vendor/apel")
(add-to-list 'load-path "~/.emacs.d/vendor/semi")
(add-to-list 'load-path "~/.emacs.d/vendor/flim")
(add-to-list 'load-path "~/.emacs.d/vendor/wanderlust/elmo")
(add-to-list 'load-path "~/.emacs.d/vendor/wanderlust/utils")
(add-to-list 'load-path "~/.emacs.d/vendor/wanderlust/wl")

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust in a new frame" t)
(autoload 'wl-draft "wl-draft" "Email Draft" t)
(autoload 'wl-user-agent-compose "wl-draft" "Compose email" t)
