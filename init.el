;; Mustafa Khattab

;; Eval before anything else

;; path env variable on mac os x
(if (eq system-type 'darwin)
    (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH"))))

;; Load path
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
(load-library "mustafa-shell-mode")
(load-library "mustafa-tabbar-mode")
(load-library "mustafa-coffee-mode")
(load-library "mustafa-emacs-lisp")
(load-library "mustafa-workgroups")
(load-library "mustafa-slime")
(load-library "mustafa-global-keys")
(load-library "mustafa-gnus")
(load-library "mustafa-web")
;; (load-library "mustafa-wanderlust")
(load-library "mustafa-misc-options")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Monaco"))))
 '(tabbar-button ((t (:inherit tabbar-default :box (:line-width 1 :color "#181810" :style released-button)))))
 '(tabbar-default ((((class color grayscale) (background dark)) (:inherit variable-pitch :background "#181818" :foreground "white" :height 0.8))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "red" :box (:line-width 1 :color "#181810" :style pressed-button)))))
 '(tabbar-unselected ((t (:inherit tabbar-default :box (:line-width 1 :color "#181810" :style released-button))))))
