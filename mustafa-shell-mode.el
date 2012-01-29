;;; Shell customizations

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; use multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")

(defun m-toggle-term-mode ()
  (interactive)
  (if (term-in-char-mode)
      (term-line-mode)
    (term-char-mode)))

(add-to-list 'term-bind-key-alist '("C-c C-k" . m-toggle-term-mode))
(add-to-list 'term-bind-key-alist '("C-c C-n" . multi-term-next))
(add-to-list 'term-bind-key-alist '("C-c C-p" . multi-term-prev))
(add-to-list 'term-bind-key-alist '("C-c C-t" . multi-term))
