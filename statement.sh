#!/bin/bash

read -p "Is this your user [$(whoami)] ?: " answer 

if [ $answer == "yes" ]; then
     echo "Good, this laptop belongs to $whoami"

elif [ $answer == "no" ]; then
     echo "This isn't your laptop, shoo"

else 
     echo "Please type yes or no"
fi