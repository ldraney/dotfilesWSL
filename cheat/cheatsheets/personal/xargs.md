# Quickly edit all files from a findword
findword pizza > /tmp/text.txt
xargs -o -n 1 nvim < /tmp/text.txt

# To Find all file name ending with .pdf and remove them
find -name *.pdf | xargs rm -rf

# if file name contains spaces you should use this instead
find -name *.pdf | xargs -I{} rm -rf '{}'

# Will show every .pdf like:
#	&toto.pdf=
#	&titi.pdf=
# -n1 => One file by one file. ( -n2 => 2 files by 2 files )

find -name *.pdf | xargs -I{} -n1 echo '&{}='

# If find returns no result, do not run rm
# This option is a GNU extension.
find -name "*.pdf" | xargs --no-run-if-empty rm

Quickly read all files from a findword
findword pizza > /tmp/file.txt
xargs -n 1 less < /tmp/file.txt


run all scripts in a directory

nix-env -iA nixpkgs.parallel
#parallel -j0 exec ::: [directory]/*.sh
parallel -j0 exec ::: ./scripts/second/*.sh




 l ./scripts/second | awk '{ print $9 }' | tail -n +4 | nix-env -iA nixpkgs.parallel



k get pods -n prod | awk '{ print $1 }' | xargs kubectl delete pods -n prod --grace-period=0 --force
