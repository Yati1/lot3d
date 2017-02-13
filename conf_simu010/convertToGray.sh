#!/bin/sh
echo 'Converting Cam1'
mogrify -colorspace Gray ./cam1/*.jpg
echo 'Converting Cam2'
mogrify -colorspace Gray ./cam2/*.jpg
echo 'Converting Cam3'
mogrify -colorspace Gray ./cam3/*.jpg
