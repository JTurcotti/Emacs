(require 'package)


(setq backup-by-copying t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(global-linum-mode t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq line-number-mode t)
(setq column-number-mode t)
(load-theme 'noctilux t)
(set-face-attribute 'default nil :height 120)
(windmove-default-keybindings)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'flex)
(add-to-list 'auto-mode-alist '("\\.jflex\\'" . flex-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-mode t)
 '(nil nil t)
 '(package-selected-packages (quote (yasnippet pdf-tools go-mode haskell-mode auctex))))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))



(package-initialize)

(add-hook 'shell-mode-hook
  (lambda ()
    (define-key shell-mode-map (kbd "<M-up>") 'comint-previous-input)
    (define-key shell-mode-map (kbd "<M-down>") 'comint-next-input)
  )
)

;;(setq default-directory "C:/Users/turco/Documents" )

(setq preview-gs-command "C:/Program Files/gs/gs9.25/bin/gswin64c.exe")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; sets up jflex-mode package in lisp dir
 (autoload 'jflex-mode "jflex-mode" nil t)
    (setq auto-mode-alist (cons '("\\(\\.flex\\|\\.jflex\\)\\'" . jflex-mode) auto-mode-alist))


;; to use pdfview with auctex
 (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
    TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
    TeX-source-correlate-start-server t) ;; not sure if last line is neccessary

 ;; to have the buffer refresh after compilation
 (add-hook 'TeX-after-compilation-finished-functions
	   #'TeX-revert-document-buffer)


;; PDF TOOLS CONFIG
(pdf-tools-install)
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
(setq pdf-view-midnight-colors '("#ffffff". "#202020"))
;;(TeX-source-correlate-mode)
