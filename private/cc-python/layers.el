(configuration-layer/declare-layers
 '(
   (python :variables
           python-test-runner 'nose
           python-auto-set-local-pyenv-version 'on-visit
           ; python-enable-yapf-format-on-save t
           py-yapf-options '("--style=google"))))
