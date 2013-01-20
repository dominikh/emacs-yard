(defface font-lock-yard-param-name-face
  '((t (:weight bold)))
  "Font Lock mode face used to highlight YARD param names."
  :group 'font-lock-faces)

(defvar font-lock-yard-param-name-face		'font-lock-yard-param-name-face
  "Face name to use for YARD param names.")

(defface font-lock-yard-option-default-value-face
  '((t (:slant italic)))
  "Font Lock mode face used to highlight YARD option default values."
  :group 'font-lock-faces)

(defvar font-lock-yard-option-default-value-face		'font-lock-yard-option-default-value-face
  "Face name to use for YARD option default values.")

(defface font-lock-yard-face
  '()
  "Font Lock mode face used to highlight YARD lines."
  :group 'font-lock-faces)

(defvar font-lock-yard-face		'font-lock-yard-face
  "Face name to use for YARD lines")

(font-lock-add-keywords 'ruby-mode
                        '(
                          ("^ *# *\\(@.+$\\)" 1 font-lock-yard-face prepend)
                          ;; tags
                          ("^ *# *\\(@!?[a-z_]+\\)" 1 font-lock-keyword-face prepend)
                          ;; inline references
                          ("^ *# *" (0 nil) ("{.+?\\(}\\|$\\)" nil nil (0 font-lock-doc-face prepend)))
                          ("^ *# *" (0 nil) ("[^{]+?}" nil nil (0 font-lock-doc-face prepend)))
                          ;; types ("@tag [Type] ...")
                          ("^ *# *@!?[a-z_]+ +\\(\\[.+?\\]\\)" 1 font-lock-type-face prepend)
                          ;; name of params ("@tag [Type] argname Description")
                          ("^ *# *@\\(param\\|yieldparam\\|attr\\|attr_reader\\|attr_writer\\)[ ]+\\[.+?\\] +\\([^ ]+\\)" 2 font-lock-yard-param-name-face prepend)
                          ;; references
                          ("^ *# *@see +\\(.+\\)" 1 font-lock-doc-face prepend)
                          ;; references
                          ("^ *# *@!?[a-z_]+ +\\((see .+)\\)" 1 font-lock-doc-face prepend)
                          ;; @option hash names
                          ("^ *# *@option +\\([^ ]+\\)" 1 font-lock-yard-param-name-face prepend)
                          ;; @option param types
                          ("^ *# *@option +[^ ]+ +\\(\\[.+?\\]\\)" 1 font-lock-type-face prepend)
                          ;; @option param names
                          ("^ *# *@option +[^ ]+ +\\[.+?\\] +\\([^ ]+\\)" 1 font-lock-yard-param-name-face prepend)
                          ;; @option default values
                          ("^ *# *@option +[^ ]+ +\\[.+?\\] +[^ ]+ +\\((.+?)\\)" 1 font-lock-yard-option-default-value-face prepend)
                          ("^ *# *@overload +\\(.+?\\)(" 1 font-lock-function-name-face prepend)
                          ))
