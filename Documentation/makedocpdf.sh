#!/bin/sh

rm -f user-manual.pdf
rm -f git-doc.pdf
rm -f git-doc.html
rm -f git-docs.html
rm -f docfiles.txt
rm -f pagebreak.html
rm -f footer.html

cat pagebreak.txt                  >pagebreak.html

ls gittutorial.html                >>docfiles.txt
ls gittutorial-2.html              >>docfiles.txt
ls everyday.html                   >>docfiles.txt
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

ls pagebreak.html                  >>docfiles.txt
ls RelNotes/*.html                 >>docfiles.txt

cat footerstart.txt                >footer.html
cat ../GIT-VERSION-FILE            >>footer.html
cat footerend.txt                  >>footer.html

echo "Creating user-manual.mobi ..."
kindlegen -c2 user-manual.html -o user-manual.mobi

echo "Creating user-manual.pdf ..."
wkhtmltopdf --disable-external-links user-manual.html user-manual.pdf

echo "Creating git-doc.html ..."
cat docfiles.txt | xargs cat | cat >git-docs.html
cat readme.html git-docs.html >git-doc.html

echo "Creating git-doc.mobi ..."
kindlegen -c2 git-doc.html -o git-doc.mobi

echo "Creating git-doc.pdf ..."
cat docfiles.txt | xargs cat | wkhtmltopdf --toc --cover readme.html --footer-html footer.html --disable-external-links - git-doc.pdf
