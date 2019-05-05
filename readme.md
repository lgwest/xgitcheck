`xgitcheck.sh` is a simple bash shell function that can be usefull to ge an quick overview
of git status for projects that contain more than one .git directory.  
This is the case if a project is built by [cmake](https://cmake.org/) and the 
[FetchContent](https://cmake.org/cmake/help/latest/module/FetchContent.html) module are used,
or if [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) are used.

The information printed is: _path to repo_, _git branch_, and _dirty_ if repo is not clean.

Install: insert line below in ~/.bashrc

    source /path/to/file/.xgitcheck.sh
	
Usage:
~~~
$ cd to/somewhere/in/a/git-repo
$ xgitcheck
~~~

## Release notes

version 1.0 2019-05-05
- Initial release

