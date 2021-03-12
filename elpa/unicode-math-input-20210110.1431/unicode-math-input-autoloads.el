;;; unicode-math-input-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "unicode-math-input" "unicode-math-input.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from unicode-math-input.el

(register-input-method "unicode-math" "UTF-8" 'quail-use-package "Ω" "Input math symbols in TeX notation." "unicode-math-input")

(autoload 'unicode-math-input "unicode-math-input" "\
Insert the Unicode character with TeX name SYMBOL.

\(fn SYMBOL)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "unicode-math-input" '("unicode-math-input-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; unicode-math-input-autoloads.el ends here
