#!/bin/bash

while getopts n: flag
do 
	case "${flag}" in
		n) session_name=${OPTARG};;
	esac
done

sessionDir=$(pwd)

tmux new-session -d -s "$session_name" -c "$sessionDir"
tmux switch -t $session_name
