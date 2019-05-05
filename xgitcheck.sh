# xgitcheck.sh  (extended git check)
# Copyright (c) 2018 LG West. Licensed under the WTFPL license, Version 2
#
# This function prints info about all git repos in a directory structure.
# The motivation for this script was to create an easy way to get an overview 
# over cmake project that uses FetchContent or submodules.
#
# The information printed is: path to repo, git branch, and "dirty" if repo is not clean.
#
# Install: insert line below in ~/.bashrc
#
# source $PATH_TO_FILE/xgitcheck.sh
#
# Usage: 
#    $ cd to/somewhere/in/a/git-repo
#    $ xgitcheck
#

function xgitcheck()
{
	pushd . > /dev/null
	
	RED='\033[0;31m'
	GREEN='\033[0;32m'
	CYAN='\033[0;36m'
	NC='\033[0m'
	
	# find top git dir
	while true ; do
		if [[ -d .git ]]
		then
			top_git_dir=$(pwd)
		fi
		old=$(pwd)
		cd ..
		current=$(pwd)
		if [ $old = $current ]; then
			break;
		fi
	done
	
	# process all git repos under top_git_dir
	files=$(find $top_git_dir -type d -name .git -print0 | xargs -0 echo)
	for d in $files
	do
		dname=$(dirname $d)
		cd $dname
		printf "${GREEN}${dname}${NC} "
		#printf "${GREEN}$(basename $dname)${NC} "
		printf "${CYAN}$(__git_ps1)${NC} "
		if [[ -n $(git status --porcelain) ]]
		then
			printf "${RED}dirty${NC}"
		fi
		printf "\n"
	done
	
	popd > /dev/null
}
