#! /usr/bin/env sh

echo "In directory ${PWD}"
mkdir -p slides
for f in $(find . -type f -iname "*_slides.md");
do
    echo $f
    output_filename=$(echo $f | rev| cut -d "/" -f 1 | rev | sed "s/md/pdf/")
    echo $output_filename
    pandoc -t beamer -V aspectratio=169 -V linkcolor:blue -V fontsize=12pt --listings -s --output=slides/${output_filename} ${f}
done
