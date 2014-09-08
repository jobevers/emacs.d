;; need a directory to install .el files too
(add-to-list 'load-path "~/.emacs.d/elisp")

;;; Put all the backup and auto-saves in one directory
;;; [http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Names.html]
;;;
(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/autosaves" t)))
;; Use a visible bell instead of the audible one
(setq visible-bell t)
;; Or just turn it off completely
;;(setq ring-bell-function 'ignore)

;;http://emacswiki.org/emacs/InteractiveSpell#toc5
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-list-command "list")
(setq ispell-extra-args '("--sug-mode=ultra"))

;; enable js2-mode instead of the default
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;Don't like using tabs. ever.
;; (setq-default indent-tabs-mode nil)

;;http://www.emacswiki.org/emacs/WhiteSpace
(require 'whitespace)
(global-whitespace-mode 0)
;; activate minor whitespace mode when in python mode
(add-hook 'python-mode-hook 'whitespace-mode)
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq whitespace-line-column 100)
	    (setq indent-tags-mode nil)
	    (setq whitespace-style 
		  (quote
		   (face tabs spaces trailing space-before-tab newline indentation
		    lines empty space-after-tab space-mark tab-mark newline-mark)))))

;; remove lines from whitespace-style
;; whitespace-style variable controls which things whitespace-mode cares about
;;    not sure why this hook works like this, but for html-mode I have to use setq
(add-hook 'js2-mode-hook 'whitespace-mode)
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (setq tab-width 2)
	    (setq whitespace-style 
		  (quote
		   (face tabs spaces trailing space-before-tab newline indentation
			 empty space-after-tab space-mark tab-mark newline-mark)))))

(add-hook 'css-mode-hook 'whitespace-mode)
(add-hook 'css-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (setq tab-width 2)
	    (setq whitespace-style 
		  (quote
		   (face tabs spaces trailing space-before-tab newline indentation
			 empty space-after-tab space-mark tab-mark newline-mark)))))

(add-hook 'html-mode-hook 'whitespace-mode)
(add-hook 'html-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (setq tab-width 2)
	    (setq whitespace-style 
		  (quote
		   (face tabs spaces trailing space-before-tab newline indentation
			 empty space-after-tab space-mark tab-mark newline-mark)))))


;; activate python mode for .ipy files
(setq auto-mode-alist (cons '("\\.ipy$" . python-mode) auto-mode-alist))

;; enables javascript editting in html files
;; https://github.com/fgallina/multi-web-mode
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js2-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;; Enable clipboard
;; http://stackoverflow.com/questions/64360/how-to-copy-text-from-emacs-to-another-application-on-linux
(setq x-select-enable-clipboard t)

;; https://github.com/yoshiki/yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; change indentation style: http://www.emacswiki.org/emacs/IndentingC
(setq c-default-style "linux"
      c-basic-offset 4)

(custom-set-variables
 '(bubbles-grid-size (quote (30 . 20)))
 '(js-indent-level 2)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/")
                            ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(inhibit-startup-screen t)
 '(js2-basic-offset 2))

(custom-set-faces)

;;(require 'pymacs)
;;(pymacs-load "ropemacs" "rope-")


(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(load "~/.emacs.d/user.el")
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
