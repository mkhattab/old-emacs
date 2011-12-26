;;My python mode stuff

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

;; ipython
(setq ipython-command "/usr/local/bin/ipython")
(setq py-python-command-args '("-pylab" "-colors" "NoColor"))
(setq ipython-completion-command-string
  "print(__IP.Completer.all_completions('%s')[0]) #PYTHON-MODE SILENT\n")
(require 'ipython)

;;; Virtualenv
(require 'virtualenv)
(setq virtualenv-root "~/.virtualenv")

;;; Pymacs
(require 'pymacs)
(autoload 'pymacs-appy "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;;; Ropemode, ropemacs
(pymacs-load "ropemacs" "rope-")