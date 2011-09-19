;; Mustafa Khattab

; Load path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/vendor/")

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

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Monaco")))))
