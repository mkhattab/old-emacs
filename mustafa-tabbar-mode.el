;; tabbar mode customizations

;; taken from http://www.emacswiki.org/emacs/TabBarMode#toc12
(when (require 'tabbar nil t)
  ;; Enable tabbars globally:
  (tabbar-mode 1)
  ;; I use this minor-mode mainly as a global mode (see below):
  (define-minor-mode tabbar-on-custom-mode
    "Display tabbar on terminals and buffers in fundamental mode only."
    :init-value t
    :lighter nil
    :keymap nil
    (if tabbar-on-custom-mode
  	;; filter is enabled
  	(if (memq major-mode '(term-mode 
			       eshell-mode 
			       dired-mode 
			       help-mode 
			       apropos-mode 
			       Info-mode 
			       Man-mode))
  	    (tabbar-local-mode -1)
	  (tabbar-local-mode 1))
      ;; always activate tabbar locally when we disable the minor mode:
      (tabbar-local-mode -1)))

  (defun tabbar-on-custom-mode-on ()
    "Turn on tabbar if current buffer is a terminal."
    (unless (minibufferp) (tabbar-on-custom-mode 1)))
  ;; Define a global switch for the mode. Note that this is not set for buffers
  ;; in fundamental mode.
  ;;
  ;; I use it 'cause some major modes do not run the
  ;; `after-change-major-mode-hook'...
  (define-globalized-minor-mode global-tabbar-on-custom-mode
    tabbar-on-custom-mode tabbar-on-custom-mode-on)
  ;; Eventually, switch on this global filter for tabbars:
  (global-tabbar-on-custom-mode 1))

(defun my-tabbar-buffer-groups ()
  (list
   (cond
    ((memq major-mode '(term-mode eshell-mode))
     "Terminal")
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    ((memq major-mode
           '(help-mode apropos-mode Info-mode Man-mode))
     "Help"
     )
    (t
     ;; Return `mode-name' if not blank, `major-mode' otherwise.
     (if (and (stringp mode-name)
              ;; Take care of preserving the match-data because this
              ;; function is called when updating the header line.
              (save-match-data (string-match "[^ ]" mode-name)))
         mode-name
       (symbol-name major-mode))
     ))))

(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
