#!/usr/bin/env bash

git clone https://github.com/Microsoft/vscode.git
cd vscode
git checkout master
git pull

function extract {
	local folder=$1
	local remote=$2
	git checkout -b extract
	git filter-branch -f --prune-empty --subdirectory-filter $folder extract
	git push -f $remote extract:master
	git checkout master
	git branch -D extract
}

extract extensions/css/server git@github.com:vscode-langservers/vscode-css-languageserver.git
extract extensions/html/server git@github.com:vscode-langservers/vscode-html-languageserver.git
extract extensions/json/server git@github.com:vscode-langservers/vscode-json-languageserver.git
