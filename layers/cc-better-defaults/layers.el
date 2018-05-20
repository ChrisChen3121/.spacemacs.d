(configuration-layer/declare-layers
 '(
   ;; ivy
   helm
   better-defaults
   (spell-checking :variables
                   spell-checking-enable-by-default nil)
   (colors :variables
           colors-colorize-identifiers 'variables
           colors-enable-nyan-cat-progress-bar t)
   (ibuffer :variables ibuffer-group-buffers-by 'projects) ;; grouped buffers
   ))
