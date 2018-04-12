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

extract extensions/css-language-features/server git@github.com:vscode-langservers/vscode-css-languageserver.git
extract extensions/html-language-features/server git@github.com:vscode-langservers/vscode-html-languageserver.git
extract extensions/json-language-features/server git@github.com:vscode-langservers/vscode-json-languageserver.git
