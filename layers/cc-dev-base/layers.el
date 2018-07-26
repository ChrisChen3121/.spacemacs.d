(configuration-layer/declare-layers
 '(
   html

   shell-scripts
   sql
   yaml
   csv
   ;; docker
   syntax-checking
   (auto-completion :variables
                    auto-completion-enable-snippets-in-popup t
                    auto-completion-return-key-behavior 'complete
                    auto-completion-tab-key-behavior 'cycle
                    auto-completion-complete-with-key-sequence (kbd "jk")
                    auto-completion-complete-with-key-sequence-delay 0.2
                    auto-completion-enable-sort-by-usage t
                    auto-completion-enable-help-tooltip 'manual ;; M-h
                    )
   (git :variables
        magit-repository-directories '("~/repos/"))

   (gtags :variables
          gtags-enable-by-default t)
   ;; github: support for pull requests and gist

   (shell :variables
          shell-default-shell 'ansi-term
          shell-default-height 30
          shell-default-position 'bottem
          ;; shell-enable-smart-eshell t
          ;; shell-protect-eshell-prompt nil
          shell-default-term-shell "zsh")
   shell-scripts
   docker
   ))
