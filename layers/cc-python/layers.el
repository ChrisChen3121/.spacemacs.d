(configuration-layer/declare-layers
 '(
   (python :variables
           python-test-runner 'pytest
           python-auto-set-local-pyenv-version 'on-visit
           python-enable-yapf-format-on-save nil
           py-yapf-options '("--style=google")
           python-sort-imports-on-save t)
   (ipython-notebook :variables
                     ein:use-auto-complete t
                     ein:complete-on-dot t
                     ein:completion-backend 'ein:use-company-backend)
   ))
