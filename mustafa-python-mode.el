;;; My python mode stuff

;; remove wisent-python hook
(remove-hook 'python-mode-hook 'wisent-python-default-setup)

;; Autoload python-mode for .py files
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;;; Electric pairs
(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key py-mode-map "\"" 'electric-pair)
	    (define-key py-mode-map "\'" 'electric-pair)
	    (define-key py-mode-map "\(" 'electric-pair)
	    (define-key py-mode-map "["  'electric-pair)
	    (define-key py-mode-map "{"  'electric-pair)))

(defun electric-pair ()
  "Insert character pair without surrounding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
;;; End Electric pairs

(defun my-ipython-complete ()
    "IPython Complete using ido"
    (interactive)
    (let* ((ugly-return nil)
           (sep ";")
           (python-process (or (get-buffer-process (current-buffer))
                                        ;XXX hack for .py buffers
                               (get-process py-which-bufname)))
           ;; XXX currently we go backwards to find the beginning of an
           ;; expression part; a more powerful approach in the future might be
           ;; to let ipython have the complete line, so that context can be used
           ;; to do things like filename completion etc.
           (beg (save-excursion (skip-chars-backward "a-z0-9A-Z_./" (point-at-bol))
                                (point)))
           (end (point))
           (pattern (buffer-substring-no-properties beg end))
           (completions nil)
           (completion-table nil)
           completion
         (comint-preoutput-filter-functions
          (append comint-preoutput-filter-functions
                  '(ansi-color-filter-apply
                    (lambda (string)
                      (setq ugly-return (concat ugly-return string))
                      "")))))
      (process-send-string python-process
                            (format ipython-completion-command-string pattern))
      (accept-process-output python-process)
      (setq completions
            (split-string (substring ugly-return 0 (position ?\n ugly-return)) sep))
      (setq completion-table (loop for str in completions
                                   collect (list str nil)))
      (setq completion (try-completion pattern completion-table))
      (cond ((eq completion t))
            ((null completion)
             (message "Can't find completion for \"%s\"" pattern)
             (ding))
            ((not (string= pattern completion))
             (delete-region beg end)
             (insert completion))
            (t
	     (if (functionp 'ido-completing-read)
		 (progn 
		   (let ((v (ido-completing-read "Symbol? " completion-table)))
		     (delete-region beg end)
		     (insert v)))
	       (with-output-to-temp-buffer "*IPython Completions*"
		 (display-completion-list (all-completions pattern completion-table))))))))

;; ipython
(add-hook 'python-mode-hook
	  (lambda ()
	    (require 'ipython)
	    (setq ipython-command (or (m-expand-prog-path "ipython") ""))
	    (setq py-python-command-args '("-i"))
	    (setq ipython-completion-command-string
		  "print(';'.join(get_ipython().Completer.all_completions('%s'))) #PYTHON-MODE SILENT\n")
	    (fset 'ipython-complete 'my-ipython-complete)))

;;; Virtualenv
(require 'virtualenv)
(setq virtualenv-root "~/.virtualenv")

;;; Pymacs
(require 'pymacs)

;; add py subdir to pymacs load path
(add-to-list 'pymacs-load-path "~/.emacs.d/py/")

(autoload 'pymacs-appy "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(setq pymacs-auto-restart t)
