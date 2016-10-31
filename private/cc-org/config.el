;;; config.el --- cc-org layer Configuration file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq org-publish-project-alist
      '(("note-org"
         :base-directory "~/github/notes/org"
         :publishing-directory  "~/github/notes"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 3   ;can be customized in org's head
         :style nil
         :auto-index nil
         :link-home "index.html"
         :section-numbers nil
         :html-preamble nil
         :html-postamble nil
         :auto-sitemap t                ; Generate sitemap.org automagically...
         :sitemap-title "ChrisChen的笔记"
         :exclude "sitemap.org")  ; ... call it sitemap.org (it's the default)...
        ("note-static"
         :base-directory "~/github/notes/org/resources/"
         :publishing-directory "~/github/notes/resources/"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note"
         :components ("note-org" "note-static")
         :author "ChrisChen3121@gmail.com"
         )))

(setq org-agenda-files (quote ("~/Dropbox/Todo")))
