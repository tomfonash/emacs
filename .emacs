;; Set up package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install 'use-package' if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Load 'use-package'
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; Python development setup
(use-package elpy
	     :config
	     (elpy-enable)
	     (setq elpy-rpc-python-command "python3") ; Set your Python interpreter here
	     (setq python-shell-interpreter "python3") ; Set your Python interpreter for interactive shell
	     (add-hook 'python-mode-hook 'flycheck-mode)
	     (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

;; Linting with Flycheck
(use-package flycheck
	     :ensure t
	     :init (global-flycheck-mode))

;; Code formatting with autopep8
(use-package py-autopep8
	     :ensure t)

;; Syntax highlighting for virtualenvs in the mode line
(use-package virtualenvwrapper
	     :ensure t
	     :config
	     (venv-initialize-interactive-shells)
	     (venv-initialize-eshell))

;; Set indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq python-indent-offset 4)

;; Use company for code completion
(use-package company
	     :ensure t
	     :config
	     (add-hook 'python-mode-hook 'company-mode))

;; Use ivy for better minibuffer completion
(use-package ivy
	     :ensure t
	     :config
	     (ivy-mode 1))

;; Key bindings
(global-set-key (kbd "C-c C-p") 'elpy-shell-switch-to-shell)
(global-set-key (kbd "C-c C-n") 'elpy-flymake-next-error)
(global-set-key (kbd "C-c C-p") 'elpy-flymake-previous-error)
(global-set-key (kbd "C-c C-f") 'py-autopep8)

;; Enable line numbers
(global-linum-mode t)

;; Show matching parentheses
(show-paren-mode 1)

;; Theme (you can customize this)
(load-theme 'monokai t)

;; Set the default font (you can customize this)
(set-default-font "DejaVu Sans Mono-10")

;; Enable smooth scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; Save backup files in a central location
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Customize the default scratch message
(setq initial-scratch-message ";; Happy coding, <Your Name>!\n\n")

;; Disable toolbar and menubar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Save and restore Emacs sessions
(desktop-save-mode 1)

;; Custom keybindings
(global-set-key (kbd "C-c r") 'replace-string)
