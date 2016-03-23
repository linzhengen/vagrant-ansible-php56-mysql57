new_pass='MyNewPass4@'
mysql --defaults-file=/root/.tmp.my.cnf -e "ALTER USER 'root'@'localhost' IDENTIFIED BY  '$new_pass' "
umask 0077
cat > /root/.my.cnf <<EOF
[client]
user=root
password='$new_pass'
EOF
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'192.168.%' IDENTIFIED BY 'vagrant' "