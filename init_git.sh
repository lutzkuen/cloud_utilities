#!/bin/bash

git config --global user.name 'LutzKuen'
git config --global user.email 'lutz.kuenneke89@gmail.com'
echo "Username"
git config --global --get user.name
echo "Mail"
git config --global --get user.email
