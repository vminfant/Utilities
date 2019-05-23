#/usr/bin/env bash

CWD=`pwd`

dry_run=true

if [ $# == 1 ]; then

	if [ $1 == "-r" ] || [ $1 == "--remove" ]; then
		dry_run=false
	fi

	if [ $1 == "-h" ] || [ $1 == "--help" ] || [ $1 == "help" ]; then
		echo ""
		echo "Utility to delete executable's from current working directory!"
		echo ""
		echo "Default action will be a Dry-run on a specific path!"
		echo ""
		echo "Use '-r' or '--remove' to remove the files" 
		echo ""
		echo "Use '-h' or '--help' or 'help' to print these messages again! or scream for help from God! :)"
	       	echo ""

		exit 0
	fi 
fi

if [ $dry_run = true ]; then
	echo ""
	echo "Dry run - invoke with '-r' or '--remove' to remove the files"
	echo ""
fi

echo "Going to clear Current Working Directory [$CWD]"

for f in $(find . -type f -executable -not -path '*/\.*');
do 
	file $f | grep --silent 'executable'
	if [ $? == 0 ];
	then
		echo "Removing an Executable [$f]"
		if [ $dry_run = false ]; then
			rm $f;
		fi
	fi
done
