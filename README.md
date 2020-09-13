# panopto_downloader
This script downloads lecture and slide recording into two separate files.

Go to panopto in your browser and find 2 urls that the browser is downloading when playing the recording:
- One of urls that downloads lecture rcording piece, for example panopto.ut.ee/url/00006.ts
- One of urls that downloads slide recording piece, for example panoppto.ut.ee/url/screen/00007.ts

The root in our case will be:
- For lecture recording: panopto.ut.ee/url
- For slide recording: panoppto.ut.ee/url/screen

Also, click on the last slide and see what is the last piece number that your browser downloads. For example, 660.

Then to run the script:

`./script.sh 660 panopto.ut.ee/url panoppto.ut.ee/url/screen`

If you want to make a dry run to see what urls will be called without actually calling them, then pass true at the end of the command

`./script.sh 660 panopto.ut.ee/url panoppto.ut.ee/url/screen true`

By default, this script performs real requests!

DO NOT MISS YOUR LECTURES AND WATCH THEM ON TIME! ;)

