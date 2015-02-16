# Requires:
# - pandoc (http://johnmacfarlane.net/pandoc/installing.html)
# - basictex (http://www.tug.org/mactex/morepackages.html)

echo "Which version would you like to release?"
read TAG
git fetch --all
git checkout $TAG
SPECFILE=OCPI.md
OUTFILE=OCPI_$TAG.pdf
VERPATTERN="Version:\s*X+"
perl -p -i -e "s/$VERPATTERN/Version: $TAG/" $SPECFILE
pandoc $SPECFILE -f markdown -t beamer -o $OUTFILE
echo "Created $OUTFILE"
