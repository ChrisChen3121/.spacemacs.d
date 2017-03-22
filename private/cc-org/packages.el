;;; packages.el --- cc-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(defconst cc-org-packages
  '(
    org
    graphviz-dot-mode
    ))

(defun cc-org/init-graphviz-dot-mode ()
  (use-package graphviz-dot-mode
    :defer t
    ))

(defun cc-org/post-init-org ()
  (add-to-list 'auto-mode-alist
               '("\\.org_archive\\'" . org-mode))
  (setq org-html-mathjax-options
        '((path "https://cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS_HTML")
          (scale "100")
          (align "left")
          (font "TeX")
          (linebreaks "false")
          (autonumber "AMS")
          (indent "5em")
          (multlinewidth "85%")
          (tagindent ".8em")
          (tagside "left")))

  (setq org-publish-project-alist
      '(("note-org"
         :base-directory "~/github/notes/org"
         :publishing-directory  "~/github/notes"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 3
         :style nil
         :auto-index nil
         :link-home "index.html"
         :section-numbers nil
         :html-preamble nil
         :html-postamble nil
         :auto-sitemap t
         :sitemap-title "ChrisChen's notes"
         :sitemap-filename "sitemap.org"
         :exclude "sitemap.org"
         )
        ("note-static"
         :base-directory "~/github/notes/org/resources"
         :publishing-directory "~/github/notes/resources"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note"
         :components ("note-org" "note-static")
         :author "Chris Chen"
         :email "ChrisChen3121@gmail.com"
         ))))

(defun cc-org/pre-init-org ()
  (with-eval-after-load 'org
    (setq org-ditaa-jar-path "~/tools/ditaa.jar")
    (setq org-confirm-babel-evaluate nil)
    (define-key org-mode-map (kbd "M-n") 'org-forward-paragraph)
    (define-key org-mode-map (kbd "M-p") 'org-backward-paragraph)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . t)
       (sh . t)
       (ditaa . t)
       (dot . t)
       (plantuml . t)
       (python . t)
       (C . t)
       (lisp . t)
       (sql . t)
       (org . t)))))
