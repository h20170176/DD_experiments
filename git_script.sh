#!/bin/sh

#Provide your GIT user-name below.
GIT_USR_NAME="h20170176";

eval "clear";
echo "GIT alias written by Sasank
For any queries/enhancements contact to \"h20170176@pilani.bits-pilani.ac.in\".";
echo"";
echo "Hello $(whoami), Checking for your GIT installation ... ";
eval "git --version"
if [ $? -eq 0 ]
then echo "GIT is available."
else
{
echo "GIT is not installed in your system.";
echo "To install GIT, type \"sudo apt-get install git\""
echo "Press cntl+c to stop installation process."
#eval "sudo apt install git";
return 0
}

fi

if [[ $(git config user.name) ]]
then echo "User name : $(git config user.name)"; 
else
{
read -p "Enter user name : " name
eval "git config --global user.name \"$name\""
}
fi


if [[ $(git config user.email) ]]
then echo "User e-mail : $(git config user.email)"; 
else
{
read -p "Enter e-mail ID : " email
eval "git config --global user.name \"$email\""
}
fi


add() { 
if [ -d ".git/" ]
then eval "git add $1"
else
{
echo "Local GIT repository is not available.
Creating new repository"
eval "git init"
eval "git add $1";
}
fi }

commit() { if [ $# -eq 1 ]
then  eval "git commit $1"

else
 
eval "git commit $1 -m "$2"";
fi }

get_back() { eval "git checkout $1";}
status() { eval "git status $1";}
revert() { eval "git revert $1 --no-edit";}

log() { if [ $# -eq 0 ]
then  eval "git log -p --name-only"

else
    eval "git log $1" 
fi }

addgithub() { if [ $# -eq 0 ]
then  echo "Enter a valid Repository name"
else {
    eval "git remote rm origine"
    eval "git remote add origine https://github.com/$GIT_USR_NAME/$1.git"
    eval "git push -u origine master"
     }
fi }
pull() { eval "git pull origine master";}
diff() { eval "git diff --color $1"; }

delcommit() { eval "git rm --cached $1"
              if [ $# -eq 1 ]
                 then  eval "git commit $1 --amend"

else

eval "git commit $1 --amend -m "$2""
fi
              mv $1 $1_bkup ;}


del_percommit() { eval "git rm -f $1"
              if [ $# -eq 1 ]
                 then  eval "git commit $1 --allow-empty --amend"

else

eval "git commit $1 --allow-empty --amend -m "$2""
fi
}

open() { eval "gedit $1";}


clone() { if [ $# -eq 0 ]
then  echo "Enter a valid Repository name"
else {
    #eval "git remote rm origine"
    eval "git clone https://github.com/$GIT_USR_NAME/$1.git"
     }
fi }

alias new=gnome-terminal
