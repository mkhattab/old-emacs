;;; Gnus setup

(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)))

(setq gnus-read-active-file 'some)
(setq gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject)
(setq gnus-thread-hide-subtree t)
(setq gnus-thread-ignore-subject t)

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
