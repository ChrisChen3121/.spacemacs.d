;;; keybindings.el --- cc-org Layer key bindings File
;;
;; Copyright (c) 2016 Chris Chen
;;
;; Author: Chris Chen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(which-key-add-key-based-replacements "C-c o" "organize-life")
(global-set-key (kbd "C-c o c") 'calendar)
(global-set-key (kbd "C-c o g") 'gnus)
(which-key-add-key-based-replacements "C-c o s" "org-show")
(global-set-key (kbd "C-c o s l") 'org-toggle-link-display)
(global-set-key (kbd "C-c o s i") 'org-toggle-inline-images)
