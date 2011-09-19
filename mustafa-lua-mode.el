;;Lua mode

(autoload 'lua-mode "lua-mode" "Lua Mode." t)
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
