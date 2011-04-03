;; Markdown stuff

(autoload 'markdown-mode "markdown-mode.el"
       "Major mode for editing Markdown files" t)
    (setq auto-mode-alist
       (cons '("\\.md" . markdown-mode) auto-mode-alist))

(eval-after-load 'markdown-mode
  '(progn
     (define-key markdown-mode-map
       (kbd "<tab>")
       (lambda()
         (interactive)
         (let ((yas/fallback-behavior 'return-nil))
           (unless (yas/expand)
             (message "markdown-cycle should be called")
             (markdown-cycle)))))))