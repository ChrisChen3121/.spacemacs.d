;;; packages.el --- cc-python layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(defconst cc-python-packages
  '(
    sphinx-doc
    ;; anaconda-mode
    ))


(defun cc-python/init-sphinx-doc ()
  (use-package sphinx-doc
    :defer t))

;; (eval-after-load "python-mode"
;;   '(progn
;;      (when (configuration-layer/package-usedp 'anaconda-mode)
;;        (which-key-add-key-based-replacements
;;          "C-c r" "anaconda")
;;        ;; (define-key anaconda-mode-map (kbd "M-,") 'anaconda-mode-go-back)
;;        ;; (define-key anaconda-mode-map (kbd "M-.") 'anaconda-mode-show-doc)
;;        ;; (define-key anaconda-mode-map (kbd "C-c r f") 'anaconda-mode-find-definitions)
;;        ;; (define-key anaconda-mode-map (kbd "C-c r r") 'anaconda-mode-find-references)
;;        ;; (define-key anaconda-mode-map (kbd "C-c r a")	'anaconda-mode-find-assignments)
;;        )))
