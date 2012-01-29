;;; Shell customizations

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; use multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")
