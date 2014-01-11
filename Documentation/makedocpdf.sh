#!/bin/sh

rm -f user-manual.pdf
rm -f user-manual.mobi
rm -f git-doc.html
rm -f git-doc.pdf
rm -f git-doc.mobi

rm -f pagebreak.html
rm -f docfiles.txt

version=`cat ../GIT-VERSION-FILE`

cat pagebreak.txt                  >pagebreak.html

ls readme.html                     >docfiles.txt

ls pagebreak.html                  >>docfiles.txt
ls gittutorial.html                >>docfiles.txt
ls gittutorial-2.html              >>docfiles.txt
ls giteveryday.html                >>docfiles.txt
ls gitworkflows.html               >>docfiles.txt

ls pagebreak.html                  >>docfiles.txt
ls git.html                        >>docfiles.txt
ls git-a*.html                     >>docfiles.txt
ls git-bisect.html                 >>docfiles.txt
ls git-b[j-z]*.html                >>docfiles.txt
ls git-[c-s]*.html                 >>docfiles.txt
ls git-ta*.html                    >>docfiles.txt
ls gitk.html                       >>docfiles.txt
ls git-[u-z]*.html                 >>docfiles.txt

ls pagebreak.html                  >>docfiles.txt
ls gita*.html                      >>docfiles.txt
ls git-bisect-lk2009.html          >>docfiles.txt
ls git[cdghimnr]*.html             >>docfiles.txt
ls git-tools.html                  >>docfiles.txt
ls gitweb*.html                    >>docfiles.txt

ls pagebreak.html                  >>docfiles.txt
ls howto-index.html                >>docfiles.txt
ls howto/*.html                    >>docfiles.txt

ls pagebreak.html                  >>docfiles.txt
ls technical/api-index.html        >>docfiles.txt
ls technical/api-[a-h]*.html       >>docfiles.txt
ls technical/api-in-*.html         >>docfiles.txt
ls technical/api-[j-z]*.html       >>docfiles.txt

ls pagebreak.html                  >>docfiles.txt
ls technical/[b-z]*.html           >>docfiles.txt

ls pagebreak.html                  >>docfiles.txt
ls install.html                    >>docfiles.txt

echo "Creating user-manual.pdf ..."
wkhtmltopdf --disable-external-links --footer-left "$version" --footer-right "[page]" --footer-line --footer-font-size 9 user-manual.html user-manual.pdf

echo "Creating user-manual.mobi ..."
kindlegen -c2 user-manual.html -o user-manual.mobi

echo "Creating git-doc.html ..."
cat docfiles.txt | xargs cat | cat >git-doc.html

echo "Creating git-doc.pdf ..."
wkhtmltopdf --disable-external-links --footer-left "$version" --footer-right "[page]" --footer-line --footer-font-size 9 --zoom 1.6 git-doc.html git-doc.pdf

echo "Creating git-doc.mobi ..."
kindlegen -c2 git-doc.html -o git-doc.mobi

echo "Done."
