# foreach($folder in $args){
#     docker run -i --rm -v "$(Get-Location):/test" -w /test ajiob/docker-xelatex-fonts:1.2.1 make -j4 -C "$folder" all ; make -C "$folder" clean 
# }
make -C "src" cleanall ; docker run -i --rm -v "$(Get-Location):/test" -w /test ajiob/docker-xelatex-fonts:1.2.1 make -j4 -C "src" all ; make -C "src" clean 