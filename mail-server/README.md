you need to generate roundcube tables manually: `podman exec -it mailserver-roundcube bin/initdb.sh --dir /var/www/html/SQL`. When you log in into postfix-admin, you will need to grant permissions inside MariaDB: `podman exec -it mailserver-database mysql -u root -p`.

```sql
GRANT ALL PRIVILEGES ON postfix.* TO 'postfix'@'%';
FLUSH PRIVILEGES;
EXIT;
```
