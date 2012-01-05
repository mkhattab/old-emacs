;; Mustafa Khattab

; Load path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/vendor/")

(load-library "mustafa-util-func")
(load-library "mustafa-color-theme")
(load-library "mustafa-ecb")
(load-library "mustafa-yasnippet")
(load-library "mustafa-auto-complete")
(load-library "mustafa-python-mode")
(load-library "mustafa-lua-mode")
(load-library "mustafa-js-mode")
(load-library "mustafa-org-mode")
(load-library "mustafa-ido-mode")
(load-library "mustafa-markdown-mode")
(load-library "mustafa-misc-options")
(load-library "mustafa-slime")
(load-library "mustafa-shell-mode")
(load-library "mustafa-global-keys")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(tool-bar-mode nil))
