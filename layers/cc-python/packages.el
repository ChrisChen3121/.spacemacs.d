;;; packages.el --- cc-python layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: chrischen <chrischen3121@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst cc-python-packages
  '(
    sphinx-doc
    anaconda-mode
    company-anaconda
    python
    (pyvenv :excluded t)
    ))

(defun cc-python/init-sphinx-doc ()
  (use-package sphinx-doc
    :defer t
    :init
    (add-hook 'python-mode-hook
              (lambda ()
                (sphinx-doc-mode t)))
    :config
    (define-key python-mode-map (kbd "C-c C-d") 'sphinx-doc)
    ))

(defun cc-python/pre-init-python ()
  (use-package python
    :defer t
    :config
    (defun cc-python/python-add-breakpoint ()
      (interactive)
      (newline-and-indent)
      (insert "import ipdb; ipdb.set_trace()")
      (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))
    (define-key python-mode-map (kbd "C-c C-b") 'cc-python/python-add-breakpoint)
    (define-key python-mode-map (kbd "C-c C-c") 'python-shell-send-buffer-switch)
    ))

(defun cc-python/post-init-python ()
  (add-hook 'python-mode-hook
            #'smartparens-mode
            ))

(defun cc-python/pre-init-anaconda-mode ()
  (use-package anaconda-mode
    :defer t
    :config
    (progn
      (which-key-add-key-based-replacements
        "C-c C-t" "skeleton"
        "C-c !" "flycheck"
        "C-c r" "anaconda")
      (define-key anaconda-mode-map (kbd "C-c r d") 'anaconda-mode-show-doc)
      (define-key anaconda-mode-map (kbd "C-c r b") 'anaconda-mode-go-back)
      (define-key anaconda-mode-map (kbd "M-,") 'anaconda-mode-go-back)
      (define-key anaconda-mode-map (kbd "C-c r f") 'anaconda-mode-find-definitions)
      (define-key anaconda-mode-map (kbd "M-.") 'anaconda-mode-find-definitions)
      (define-key anaconda-mode-map (kbd "C-c r r") 'anaconda-mode-find-references)
      (define-key anaconda-mode-map (kbd "C-c r a")	'anaconda-mode-find-assignments)
      (define-key anaconda-mode-map (kbd "<backtab>")	'yapfify-buffer))
    ))

;; fix for company-anaconda-20180429
(defun cc-python/pre-init-company-anaconda ()
  (use-package company-anaconda
    :defer t
    :config
    (defun company-anaconda-prefix ()
      "Grab prefix at point.
Properly detect strings, comments and attribute access."
      (and anaconda-mode
           (not (company-in-string-or-comment))
           (--if-let (when (or (looking-at "\\_>")
                               (looking-back "\\." (- (point) 1)))
                       (save-match-data
                         (let ((line (buffer-substring-no-properties
                                      (line-beginning-position)
                                      (point))))
                           (when (string-match "\\(?:[a-zA-Z_][a-zA-Z0-9_.]*\\|\"[^\"]*\".\\)\\'" line)
                             (match-string 0 line)))))
               (if (looking-back "\\." (- (point) 1))
                   (cons it t)
                 it)
             'stop)))

    ))
;;; packages.el ends here
