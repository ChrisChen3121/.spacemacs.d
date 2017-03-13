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

(global-set-key (kbd "<f12> a") 'org-agenda)
(global-set-key (kbd "<f12> b") 'org-iswitchb)
(global-set-key (kbd "<f12> l") 'org-store-link)
(global-set-key (kbd "<f12> c") 'org-capture)
(global-set-key (kbd "<f12> t") 'org-clock-goto)
(global-set-key (kbd "C-w") 'whole-line-or-region-kill-region)

(add-hook 'org-mode-hook (lambda()
                           (define-key org-mode-map (kbd "M-n") 'org-forward-paragraph)
                           (define-key org-mode-map (kbd "M-p") 'org-backward-paragraph)))
