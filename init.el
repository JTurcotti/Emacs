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
 '(coq-diffs 'removed)
 '(coq-double-hit-enable t)
 '(custom-safe-themes
   '("3c03b55aeb17a451e5fd23747e418f98a80db9950de203c534ac177ec32c42cf" default))
 '(default-input-method "TeX")
 '(ns-alternate-modifier 'meta)
 '(ns-command-modifier 'super)
 '(package-selected-packages
   '(auto-dim-other-buffers color-theme-buffer-local magit flycheck-ocaml merlin-eldoc merlin dune tuareg auctex math-symbols unicode-math-input multiple-cursors math-symbol-lists proof-general yasnippet pdf-tools go-mode haskell-mode))
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
 '(agda2-highlight-bound-variable-face ((t nil)))
 '(agda2-highlight-coinductive-constructor-face ((t (:foreground "#b58900"))))
 '(agda2-highlight-datatype-face ((t (:foreground "#268bd2"))))
 '(agda2-highlight-dotted-face ((t nil)))
 '(agda2-highlight-error-face ((t (:foreground "#dc322f" :underline t))))
 '(agda2-highlight-field-face ((t (:foreground "#dc322f"))))
 '(agda2-highlight-function-face ((t (:foreground "#268bd2"))))
 '(agda2-highlight-incomplete-pattern-face ((t (:background "#cb4b16" :foreground "#002b36"))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "#859900"))))
 '(agda2-highlight-keyword-face ((t (:foreground "#cb4b16"))))
 '(agda2-highlight-module-face ((t (:foreground "#6c71c4"))))
 '(agda2-highlight-number-face ((t (:foreground "#6c71c4"))))
 '(agda2-highlight-operator-face ((t nil)))
 '(agda2-highlight-postulate-face ((t (:foreground "#268bd2"))))
 '(agda2-highlight-primitive-face ((t (:foreground "#268bd2"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "#268bd2"))))
 '(agda2-highlight-record-face ((t (:foreground "#268bd2"))))
 '(agda2-highlight-string-face ((t (:foreground "#d33682"))))
 '(agda2-highlight-symbol-face ((((background "#fdf6e3")) (:foreground "#586e75"))))
 '(agda2-highlight-termination-problem-face ((t (:background "#cb4b16" :foreground "#002b36"))))
 '(agda2-highlight-typechecks-face ((t (:background "#2aa198" :foreground "#002b36"))))
 '(agda2-highlight-unsolved-constraint-face ((t (:background "#002b36" :foreground "#b58900"))))
 '(agda2-highlight-unsolved-meta-face ((t (:background "#002b36" :foreground "#b58900"))))
 '(auto-dim-other-buffers-face ((t (:background "gray17"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "MediumPurple3" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(font-lock-comment-face ((t (:foreground "MediumPurple1" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(font-lock-doc-face ((t (:foreground "thistle2" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(ocamldebug-underline ((t (:box (:line-width (2 . 2) :color "goldenrod1" :style released-button))))))


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
      ("\\b" ?β)
      ("\\eps" ?ε)
      ("\\G" ?Γ)
      ("\\H" ?ℋ)
      ("\\N" ?ℕ)
;;       ("\\re" ?ℛ)
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

(setq pdf-view-use-scaling t
        pdf-view-use-imagemagick nil)


 (let ((base03    "#002b36")
        (base02    "#073642")
        (base01    "#586e75")
        (base00    "#657b83")
        (base0     "#839496")
        (base1     "#93a1a1")
        (base2     "#eee8d5")
        (base3     "#fdf6e3")
        (yellow    "#b58900")
        (orange    "#cb4b16")
        (red       "#dc322f")
        (magenta   "#d33682")
        (violet    "#6c71c4")
        (blue      "#268bd2")
        (cyan      "#2aa198")
        (green     "#859900"))
    (custom-set-faces
     `(agda2-highlight-keyword-face ((t (:foreground ,orange))))
     `(agda2-highlight-string-face ((t (:foreground ,magenta))))
     `(agda2-highlight-number-face ((t (:foreground ,violet))))
     `(agda2-highlight-symbol-face ((((background ,base3)) (:foreground ,base01))))
     `(agda2-highlight-primitive-type-face ((t (:foreground ,blue))))
     `(agda2-highlight-bound-variable-face ((t nil)))
     `(agda2-highlight-inductive-constructor-face ((t (:foreground ,green))))
     `(agda2-highlight-coinductive-constructor-face ((t (:foreground ,yellow))))
     `(agda2-highlight-datatype-face ((t (:foreground ,blue))))
     `(agda2-highlight-field-face ((t (:foreground ,red))))
     `(agda2-highlight-function-face ((t (:foreground ,blue))))
     `(agda2-highlight-module-face ((t (:foreground ,violet))))
     `(agda2-highlight-postulate-face ((t (:foreground ,blue))))
     `(agda2-highlight-primitive-face ((t (:foreground ,blue))))
     `(agda2-highlight-record-face ((t (:foreground ,blue))))
     `(agda2-highlight-dotted-face ((t nil)))
     `(agda2-highlight-operator-face ((t nil)))
     `(agda2-highlight-error-face ((t (:foreground ,red :underline t))))
     `(agda2-highlight-unsolved-meta-face ((t (:background ,base03 :foreground ,yellow))))
     `(agda2-highlight-unsolved-constraint-face ((t (:background ,base03 :foreground ,yellow))))
     `(agda2-highlight-termination-problem-face ((t (:background ,orange :foreground ,base03))))
     `(agda2-highlight-incomplete-pattern-face ((t (:background ,orange :foreground ,base03))))
     `(agda2-highlight-typechecks-face ((t (:background ,cyan :foreground ,base03))))))
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line


(require 'use-package)
;;ocaml stuff

;; Major mode for OCaml programming
(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode)))

;; Major mode for editing Dune project files
(use-package dune
  :ensure t)

;; Merlin provides advanced IDE features
(use-package merlin
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  (add-hook 'merlin-mode-hook #'company-mode)
  ;; we're using flycheck instead
  (setq merlin-error-after-save nil))

(use-package merlin-eldoc
  :ensure t
  :hook ((tuareg-mode) . merlin-eldoc-setup))

;; This uses Merlin internally
(use-package flycheck-ocaml
  :ensure t
  :config
  (flycheck-ocaml-setup))

(eval-when-compile
  (require 'cl))


(defun get-buffers-matching-mode (mode)
  "Returns a list of buffers where their major-mode is equal to MODE"
  (let ((buffer-mode-matches '()))
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (eq mode major-mode)
          (push buf buffer-mode-matches))))
    buffer-mode-matches))


(defun multi-occur-in-this-mode ()
  "Show all lines matching REGEXP in buffers with this major mode."
  (interactive)
  (multi-occur
   (get-buffers-matching-mode major-mode)
   (car (occur-read-primary-args))))

;;this defines the useful "multi-occur-in-thus-mode
;; global key for `multi-occur-in-this-mode' - you should change this.
(global-set-key (kbd "C-x C-5") 'multi-occur-in-this-mode)

(define-key merlin-mode-map (kbd "C-c C-j") 'merlin-locate-type)
(define-key merlin-mode-map (kbd "C-c l") 'merlin-locate-ident)
(define-key merlin-mode-map (kbd "C-c t") 'merlin-type-expr)
(put 'set-goal-column 'disabled nil)

(auto-dim-other-buffers-mode t)
