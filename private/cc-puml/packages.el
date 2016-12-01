;;; packages.el --- cc-puml layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defconst cc-puml-packages
  '(
    puml-mode
    ))

(defun cc-puml/init-puml-mode ()
  (use-package puml-mode
    :defer t
    :init
    (progn
      (setq puml-plantuml-jar-path "~/tools/plantuml.jar")
      (add-hook 'org-mode-hook
                (lambda () (add-to-list
                            'org-src-lang-modes '("plantuml" . t)))))
    :mode "\\.puml\\'"
    :config
    (puml-set-output-type "png")
    ))

;;; packages.el ends here
