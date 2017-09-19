(define (zzz pattern width height)
(let* ((filelist (cadr (file-glob pattern 1))))
(while (not (null? filelist))
(let* ((filename (car filelist))
(image (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
(drawable (car (gimp-image-get-active-layer image)))
(nwidth (car (gimp-drawable-width drawable)))
(nheight (car (gimp-drawable-height drawable)))
)
(gimp-image-scale image (* nwidth .25) (* nheight .25))
(gimp-file-save RUN-NONINTERACTIVE image drawable filename filename)
(gimp-image-delete image))
(set! filelist (cdr filelist)))))