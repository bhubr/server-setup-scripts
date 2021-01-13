mysql -e "CREATE USER $1@localhost IDENTIFIED WITH mysql_native_password BY '$2';"
if [ $# -eq 3 ]; then
  mysql -e "CREATE DATABASE $3 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
  mysql -e "GRANT ALL PRIVILEGES ON $3.* TO $1@localhost;"
fi
