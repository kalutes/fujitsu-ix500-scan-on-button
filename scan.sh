#!/bin/sh
now=`date +"%Y-%m-%d-%H%M%S"`
outfilename="scan-$now.pdf"
/app/sane-scan-pdf/scan -d -r 300 -v --mode 'Color' --page-height 999 --page-width 216 --no-default-size -o /tmp/$outfilename
pdfcropmargins -v -s -u -p 0 /tmp/$outfilename -o /scans/$outfilename