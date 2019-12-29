#!/bin/sh
#start with fresh directories - cache will come later
rm -rf dist/maingallery/*
rm -rf dist/tmp/*
#cjepg
ladon -m dist/tmp/RELDIR "maingallery/**/*.jpg" -- cjpeg -quality 60,90 -optimize -progressive FULLPATH " > " dist/tmp/RELPATH
ladon -m dist/tmp/RELDIR "maingallery/**/*.jpeg" -- cjpeg -quality 60,90 -optimize -progressive FULLPATH " > " dist/tmp/RELPATH

#jpegtran
ladon -m dist/maingallery/RELDIR "dist/tmp/**/*.jpg" -- jpegtran -optimize -progressive -copy none FULLPATH " > " dist/maingallery/RELPATH
ladon -m dist/maingallery/RELDIR "dist/tmp/**/*.jpeg" -- jpegtran -optimize -progressive -copy none FULLPATH " > " dist/maingallery/RELPATH

#pngquant
ladon -m dist/maingallery/RELDIR "maingallery/**/*.png" -- pngquant --speed 1 --quality=60-86 --force FULLPATH " -o " dist/maingallery/RELPATH
#oxipng
ladon -m dist/maingallery/RELDIR "dist/maingallery/**/*.png" -- oxipng -o 6 -q --strip all FULLPATH
#advpng
ladon -m dist/maingallery/RELDIR "dist/maingallery/**/*.png" -- advpng -z -3 -q FULLPATH

#cwebp
ladon -m dist/maingallery/RELDIR "dist/maingallery/**/*.jpg" -- cwebp -q 90 -m 6 -mt -pass 10 -quiet FULLPATH " -o " dist/maingallery/RELDIR/BASENAME.webp
ladon -m dist/maingallery/RELDIR "dist/maingallery/**/*.jpeg" -- cwebp -q 90 -m 6 -mt -pass 10 -quiet FULLPATH " -o " dist/maingallery/RELDIR/BASENAME.webp
ladon -m dist/maingallery/RELDIR "dist/maingallery/**/*.png" -- cwebp -q 90 -m 6 -mt -pass 10 -quiet FULLPATH " -o " dist/maingallery/RELDIR/BASENAME.webp
