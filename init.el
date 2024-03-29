;;; init --- minimal settings for demacs (emacs with serve-d language server)
;;; Commentary:
;;; Code:
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package d-mode
  :straight t)

(use-package eglot
  :straight t)

;; dont know how to put this in the previous :config block
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((d-mode) "/serve-d/serve-d" "--logLevel=all")))

(use-package company
  :straight t
  :config (global-company-mode 1))

(menu-bar-mode -1)
(kill-buffer "*scratch*")
(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

(provide 'init)
;;; init.el ends here
