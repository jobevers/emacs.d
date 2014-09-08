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

;;Don't like using tabs. ever.
;; (setq-default indent-tabs-mode nil)

;;http://www.emacswiki.org/emacs/WhiteSpace
(require 'whitespace)
(setq whitespace-line-column 100)
;; activate minor whitespace mode when in python mode
(add-hook 'python-mode-hook 'whitespace-mode)


;; activate python mode for .ipy files
(setq auto-mode-alist (cons '("\\.ipy$" . python-mode) auto-mode-alist))

;; enables javascript editting in html files
;; https://github.com/fgallina/multi-web-mode
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;; change indentation style: http://www.emacswiki.org/emacs/IndentingC
(setq c-default-style "linux"
      c-basic-offset 4)

(custom-set-variables
 '(bubbles-grid-size (quote (30 . 20)))
 '(js-indent-level 2)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/")
                            ("marmalade" . "http://marmalade-repo.org/packages/")))))
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
