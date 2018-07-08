user=$1
key=$2

echo "$key" >> "/home/$user/.ssh/authorized_keys"
cat "/home/$user/.ssh/authorized_keys"
