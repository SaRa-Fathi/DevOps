#!/bin/bash
echo "User Management Menu :"
echo "1. Add User"
echo "2. Remove User"
echo "3. Update Password for Current User"
echo "4. List all Users and count them"
echo "5. Quit"

read -p "Enter your Choice (1-5):" userChoice

echo $userChoice

if [[ $userChoice -eq 1 ]]
then
	read -p "Enter User Name: " userName
	sudo useradd $userName
	if [[ $? -eq 0 ]]
	then
		echo "$userName added successfully!"
	else
		echo "something was wrong"
	fi

elif [[ $userChoice -eq 2 ]]
then
	read -p "Enter User Name to remove : " userToDelete
	sudo userdel $userToDelete
 	if [[ $? -eq 0 ]]        
	then
                echo "$userToDelete deleted successfully!"
	else
		 echo "something was wrong"
        fi             
elif [[ $userChoice -eq 3 ]]
then 
	read -p "Enter User Name to change password : " userToChangePassword
        sudo passwd $userToChangePassword 
	if [[ $? -eq 0 ]]
        then
                echo "Password of user $userToChangePassword updated successfully!"
	else
                 echo "something was wrong"
        fi

elif [[ $userChoice -eq 4 ]]
then
	original_users=$(awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd)
	#echo "Users Count is = " $original_users | wc -l 
	#wc /etc/passwd
	echo "Users List : " $original_users
	echo "Users Count is = " $original_users | wc -l
	#net user
	#cat /etc/passwd 
	#cut -d: -f1,3 /etc/passwd | grep -E
	#original_users = $(awk -F: '$3 >= 1000 && $3 <= 60000' '{print $1}' /etc/passwd);

elif [[ $userChoice -eq 5 ]]
then
	echo "Exiting..."
fi

