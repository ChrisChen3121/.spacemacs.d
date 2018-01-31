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
    ;;cc-mode
    google-c-style
    irony
    ;;company
    (company-irony :toggle (configuration-layer/package-usedp 'company))
    (company-irony-c-headers :toggle (configuration-layer/package-usedp 'company-irony))
    ;;eldoc
    (irony-eldoc :toggle (configuration-layer/package-usedp 'eldoc))
    ;;flycheck
    (flycheck-irony :toggle (configuration-layer/package-usedp 'flycheck))
    ;;semantic
    projectile
    ggtags
    clang-format
    disaster
    cc-mode
    ;; cmake-ide
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
      (with-eval-after-load 'irony
        (which-key-add-key-based-replacements"C-c i" "irony")
        (define-key c-mode-base-map (kbd "C-c i g") 'cc-c++/generate-compile-options)
        (define-key c-mode-base-map (kbd "C-c i u") 'irony-cdb-autosetup-compile-options)
        (define-key c-mode-base-map (kbd "C-c i j") 'irony-cdb-json-add-compile-commands-path))
      (spacemacs/add-to-hooks 'irony-mode '(c-mode-hook c++-mode-hook))
    :config
    (progn
      (setq irony-additional-clang-options '("-std=c++14"))
      (defun cc-c++/generate-compile-options ()
        (interactive)
        (start-process-shell-command "generate-compile-options" nil
                                     "cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ./" ))))))

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

(defun cc-c++/init-company-irony-c-headers ()
  (use-package company-irony-c-headers
    :if (configuration-layer/package-usedp 'company-irony)
    :defer t
    :init
    (add-to-list 'company-backends-c-mode-common
                 'company-irony-c-headers)))

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
    (spacemacs/add-to-hooks 'flycheck-irony-setup '(c-mode-hook c++-mode-hook))))

(defun cc-c++/post-init-ggtags ()
  (which-key-add-key-based-replacements
    "M-m m g" "gtags"
    "M-RET g" "gtags"))

(defun cc-c++/pre-init-clang-format ()
  (with-eval-after-load 'cc-mode
    (define-key c-mode-base-map (kbd "<backtab>") 'clang-format-buffer)))

(defun cc-c++/pre-init-disaster ()
  (with-eval-after-load 'cc-mode
    (define-key c-mode-base-map (kbd "C-c d") 'disaster)))

(defun cc-c++/post-init-cc-mode ()
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))) ;TODO: temporary solution

(defun cc-c++/pre-init-projectile ()
  (spacemacs|use-package-add-hook projectile
    :post-config
    (dolist (mode '(c-mode c++-mode))
      (add-to-list 'projectile-other-file-alist '("h" "cc"))
      (add-to-list 'projectile-other-file-alist '("cc" "h")))))

;;; packages.el ends here
