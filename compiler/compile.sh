#!/bin/sh
set -ue
docker run -i --rm -v "$(pwd):/test" -w /test ajiob/docker-xelatex-fonts:1.2.1 make -j4 -C "src" all && make -C "src" clean