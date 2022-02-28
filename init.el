(require 'package)


(setq backup-by-copying t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(global-linum-mode t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq line-number-mode t)
(setq coq-compile-before-require t)
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
 '(coq-diffs (quote removed))
 '(coq-double-hit-enable t)
 '(default-input-method "TeX")
 '(mac-command-modifier (quote super))
 '(mac-option-modifier (quote meta))
 '(nil nil t)
 '(package-selected-packages
   (quote
    (tuareg auctex math-symbols unicode-math-input multiple-cursors math-symbol-lists proof-general yasnippet pdf-tools go-mode haskell-mode)))
 '(proof-electric-terminator-enable nil))

;;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                         ("melpa" . "https://melpa.org/packages/")))

(setq pdf-view-use-scaling t
      pdf-view-use-imagemagick nil)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

(add-hook 'shell-mode-hook
  (lambda ()
    (define-key shell-mode-map (kbd "<M-up>") 'comint-previous-input)
    (define-key shell-mode-map (kbd "<M-down>") 'comint-next-input)
  )
  )
(setq auto-mode-alist (cons '("\\.tex$" . latex-mode) auto-mode-alist))

;;(setq default-directory "C:/Users/turco/Documents" )

(setq preview-gs-command "C:/Program Files/gs/gs9.25/bin/gswin64c.exe")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "orange red" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(font-lock-comment-face ((t (:foreground "orange red" :inverse-video nil :underline nil :slant italic :weight normal)))))


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

;; Access tex distro
(setenv "PATH" (concat "/Library/TeX/texbin:"
                       (getenv "PATH")))
(add-to-list 'exec-path "/Library/TeX/texbin")

;; Coq define-keys

(eval-after-load "proof-script" '(progn
 (define-key proof-mode-map [(super n)] 
                            'proof-assert-next-command-interactive)
 (define-key proof-mode-map [(super b)] 
                            'proof-undo-last-successful-command)
 ))

(defun proof-mode-config ()
    (local-set-key (kbd "<C-down>") 'proof-assert-next-command-interactive)
    (local-set-key (kbd "<C-up>") 'proof-undo-last-successful-command)
    (local-set-key (kbd "<C-right>") 'proof-goto-point)
    (local-set-key (kbd "<C-left>") 'proof-undo-and-delete-successful-command)
)

(add-hook 'proof-mode-hook 'proof-mode-config)

(quail-define-package "jt-shorthand" "jt's favorite unicode symbols" "⸢jt⸣"
		      nil nil nil nil t nil nil nil
		      nil nil nil nil t)

(with-temp-buffer
  (activate-input-method "jt-shorthand") ;; the input method has to be triggered for `quail-package-alist' to be non-nil
  (let ((quail-current-package (assoc "jt-shorthand" quail-package-alist)))
   (quail-define-rules ((append . t))
                       ("\\a" ?α)
		       ("\\eps" ?ε)
		       ("\\G" ?Γ)
		       ("\\H" ?ℋ)
;;		       ("\\re" ?ℛ)
		       ("\\F" ?ℱ)
		       ("\\R" ?Ρ)
		       ("\\vd" ?⊢)
		       ("\\dv" ?⊣)
		       ("\\bot" ?⊥)
		       ("\\top" ?⊤)
		       ("\\pi" ?π)
		       ("\\sigma" ?σ)
		       ("\\rho" ?ρ)
		       ("\\chi" ?χ)
		       ("\\ome" ?ω)
		       ("\\O" ?Ω)
		       ("\\Ov" ?Ω)
		       ("\\Phi" ?Φ)
		       ("\\Psi" ?Ψ)
		       ("\\bar" ?̅)
		       ("\\lam" ?λ)
		       ("\\cdo" ?⋅)
		       ("/\\" ?∧)
		       ("\\/" ?∨)
		       ("\\forall" ?∀)
		       ("\\exists" ?∃)
		       ("\\uplus" ?⊎)
		       ("\\regto" ?↣)
		       ("\\rto" ?↣)
		       ("\\vto" ?⇝)
		       ("->" ?→)
		       ("\\to" ?→)
		       ("\\mapsto" ?↦)
		       ("\\To" ?⇒)
		       ("<->" ?↔)
		       ("\\~" ?¬)
		       ("\\cap" ?∩)
		       ("\\cup" ?∪)
		       ("\\in" ?∈)
		       ("\\nin" ?∉)
		       ("\\cnt" ?∋)
		       ("\\ncnt" ?∌)
		       ("\\*" ?×)
		       ("\\sub" ?⊂)
		       ("\\subeq" ?⊆)
		       ("\\sup" ?⊃)
		       ("\\supeq" ?⊇)
		       ("\\scup" ?⊔)
		       ("\\scap" ?⊓)
		       ("\\ssubeq" ?⊑)
		       ("\\ssupeq" ?⊒)
		       (">=" ?≥)
		       ("<=" ?≤)
		       ("\\ge" ?≥)
		       ("\\le" ?≤)
		       ("\\ne" ?≠)
		       ("\\nexists" ?∄)
		       ("<>" ?≠)
		       ("\\pin" ?†)
		       ("\\np" ?⋅)
		       ("\\mp" ?∘)
		       ("\\dd" ?‡)
		       ("\\<<" ?⟪)
			("\\>>" ?⟫)
		       ("\\<" ?⟨)
			("\\>" ?⟩)
		       ("\\op" ?⊕)
		       ("\\t" ?τ)
		       ("\\fdo" ?⦙)
		       ("\\tdo" ?⋮)
		       ("_0" ?₀)
		       ("_1" ?₁)
		       ("_2" ?₂)
		       ("_3" ?₃)
		       ("_4" ?₄)
		       ("_5" ?₅)
		       ("_6" ?₆)
		       ("_7" ?₇)
		       ("_8" ?₈)
		       ("_9" ?₉)
		       ("\\_a" ?ₐ)
		       ("\\_e" ?ₑ)
		       ("\\_h" ?ₕ)
		       ("\\_i" ?ᵢ)
		       ("\\_j" ?ⱼ)
		       ("\\_k" ?ₖ)
		       ("\\_l" ?ₗ)
		       ("\\_m" ?ₘ)
		       ("\\_n" ?ₙ)
		       ("\\_o" ?ₒ)
		       ("\\_p" ?ₚ)
		       ("\\_r" ?ᵣ)
		       ("\\_s" ?ₛ)
		       ("\\_t" ?ₜ)
		       ("\\_u" ?ᵤ)
		       ("\\_v" ?ᵥ)
		       ("\\_x" ?ₓ)
		       ("\\[" ?⟦)
		       ("\\]" ?⟧)
		       ("\\{" ?⦃)
		       ("\\}" ?⦄)
		       ("\\(|" ?⦇)
		       ("\\|)" ?⦈)
		       )))

(setq default-input-method "jt-shorthand")

(global-set-key (kbd "C-%") 'replace-regexp)

;; PDF TOOLS CONFIG
(pdf-tools-install)
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
(setq pdf-view-midnight-colors '("#ffffff". "#202020"))
;;(TeX-source-correlate-mode)
