(configuration-layer/declare-layers
 '(
   ;; TODO `c-u M-x org-reload` to fix "Wrong type argument: listp org-mode" error with 24.5
   (org :variables
        ;; org-projectile-file "TODOs.org" ;; TODO not working
        org-enable-github-support t
        ;; org-enable-reveal-js-support t ;; presentation
        )
   (plantuml :variables
             plantuml-jar-path "~/jars/plantuml.jar"
             org-plantuml-jar-path "~/jars/plantuml.jar"
             plantuml-output-type "png")
   markdown
   ;; pandoc md to pdf

   ;; bibtex

   ;; (deft :variables
   ;;   deft-directory "~/Dropbox/notes/")
   ))
