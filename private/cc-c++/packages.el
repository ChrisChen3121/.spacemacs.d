;;; packages.el --- cc-c++ layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst cc-c++-packages
  '(
    google-c-style
    irony
    ;;company
    (company-irony :toggle (configuration-layer/package-usedp 'company))
    ;;eldoc
    (irony-eldoc :toggle (configuration-layer/package-usedp 'eldoc))
    ;;flycheck
    (flycheck-irony :toggle (configuration-layer/package-usedp 'flycheck))
    projectile
    ))

(defun cc-c++/init-google-c-style ()
  (use-package google-c-style
    :defer t
    :init
    (add-hook 'c-mode-common-hook
              (lambda ()
                (google-set-c-style)
                (google-make-newline-indent)))))

(defun cc-c++/init-irony ()
  (use-package irony
    :defer t
    :init
    (progn
      (add-hook 'c-mode-common-hook 'irony-mode)
      (add-hook 'irony-mode-hook
                (lambda ()
                  (irony-cdb-autosetup-compile-options)
                  (defun generate-compile-options () ()))))))

(defun cc-c++/init-company-irony ()
  (use-package company-irony
    :if (configuration-layer/package-usedp 'company)
    :defer t
    :init
    (setq company-backends-c-mode-common
          '(company-irony-c-headers
            company-irony
            (company-dabbrev-code company-gtags company-keywords)
            company-files
            company-dabbrev
            ))))

(defun cc-c++/init-irony-eldoc ()
  (use-package irony-eldoc
    :defer t
    :init
    (add-hook 'irony-mode-hook 'irony-eldoc)
    ))

(defun cc-c++/init-flycheck-irony ()
  (use-package flycheck-irony
    :if (configuration-layer/package-usedp 'flycheck)
    :defer t
    :init
    (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
    ))

(when (configuration-layer/layer-usedp 'semantic)
  (defun cc-c++/post-init-semantic ()
    (use-package semantic
      :if (configuration-layer/package-usedp 'semantic)
      :defer t
      :post-init
      (add-to-list 'semantic-default-submodes
                   'global-semantic-idle-local-symbol-highlight-mode))))

(defun cc-c++/post-init-projectile ()
  (add-to-list 'projectile-other-file-alist '("h" "cc"))
  (add-to-list 'projectile-other-file-alist '("cc" "h")))











;;; packages.el ends here
