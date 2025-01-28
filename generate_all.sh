#!/bin/bash

function create_png_and_pdf() {
  drawio=$1
  base=`basename "${drawio}"`
  png="./res/output/png/${base/.drawio/.png}"
  pdf="./res/output/pdf/${base/.drawio/.pdf}"

  drawio "${drawio}" -x -o "${png}"
  # drawio "${drawio}" -x -o "${pdf}"  # opaque object are not rendered properly
  magick -compress LZW -density 1200 -gravity center "${png}" "${pdf}"
}

for i in ./src/diagrams/*.drawio
do
  create_png_and_pdf "${i}"
done
