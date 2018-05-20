;;; packages.el --- cc-doc layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: chrischen <chrischen3121@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst cc-doc-packages
  '(
    org
    graphviz-dot-mode
    ))

(defun cc-doc/init-graphviz-dot-mode ()
  (use-package graphviz-dot-mode
    :defer t
    ))

(defun cc-doc/post-init-org ()
  (add-to-list 'auto-mode-alist
               '("\\.\\(org_archive\\)$" . org-mode))
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
         :base-directory "~/repos/notes/org"
         :publishing-directory  "~/repos/notes"
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
         :sitemap-title "chrischen's notes"
         :sitemap-filename "sitemap.org"
         :exclude "sitemap.org"
         )
        ("note-static"
         :base-directory "~/repos/notes/org/resources"
         :publishing-directory "~/repos/notes/resources"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note"
         :components ("note-org" "note-static")
         :author "ChrisChen"
         :email "chrischen3121@gmail.com"
         )))
  (which-key-add-key-based-replacements "C-c s" "org-show")
  (which-key-add-key-based-replacements "C-c C-v" "org-babel")
  (which-key-add-key-based-replacements "C-c o" "organize-life")
  (global-set-key (kbd "C-c o c") 'calendar)
  (global-set-key (kbd "C-c o g") 'gnus)
  (global-set-key (kbd "C-c s l") 'org-toggle-link-display)
  (global-set-key (kbd "C-c s i") 'org-toggle-inline-images)
  (which-key-add-key-based-replacements "C-c C-x" "org-agenda")
  )

(defun cc-doc/pre-init-org ()
  (use-package org
    :defer t
    :config
    (progn
      (setq org-confirm-babel-evaluate nil)
      (add-to-list 'org-modules 'org-habit)
      (define-key org-mode-map (kbd "C-c w") 'org-refile)
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
         (org . t))))
    ))

;;; packages.el ends here
