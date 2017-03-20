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
    anaconda-mode
    python
    ))

(defun cc-python/init-sphinx-doc ()
  (use-package sphinx-doc
    :defer t
    :init
    (progn
      (define-key python-mode-map (kbd "C-c C-d") 'sphinx-doc)
      (add-hook 'python-mode-hook
                (lambda ()
                  (sphinx-doc-mode t))))))

(defun cc-python/pre-init-anaconda-mode ()
  (with-eval-after-load 'anaconda-mode
    (which-key-add-key-based-replacements
      "C-c C-t" "skeleton"
      "C-c !" "flycheck"
      "C-c r" "anaconda")
    (define-key anaconda-mode-map (kbd "C-c r d") 'anaconda-mode-show-doc)
    (define-key anaconda-mode-map (kbd "C-c r b") 'anaconda-mode-go-back)
    (define-key anaconda-mode-map (kbd "C-c r f") 'anaconda-mode-find-definitions)
    (define-key anaconda-mode-map (kbd "C-c r r") 'anaconda-mode-find-references)
    (define-key anaconda-mode-map (kbd "C-c r a")	'anaconda-mode-find-assignments)))

(defun cc-python/pre-init-python ()
  (spacemacs|use-package-add-hook python
    :pre-init
    (with-eval-after-load 'python
      (define-key python-mode-map (kbd "C-c C-b") 'cc-python/python-add-breakpoint)
      (define-key python-mode-map (kbd "C-c C-c") 'python-shell-send-buffer-switch))))
