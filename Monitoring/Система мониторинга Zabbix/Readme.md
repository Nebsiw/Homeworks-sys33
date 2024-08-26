### Задание 1 

Установите Zabbix Server с веб-интерфейсом.

#### Ответ на задание 1
1. Перейдем к инструкции на офф сайте Zabbix https://www.zabbix.com/ru/download?zabbix=7.0&os_distribution=debian&os_version=11&components=proxy&db=pgsql&ws=
2. Установим и сконфигурируем Zabbix
  - Установите PostgreSQL:
  ```
  sudo apt install postgresql
  ```
  - Установите репозиторий Zabbix 
  ```
  wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb
  dpkg -i zabbix-release_6.0-4+debian11_all.deb
  apt update
  ```
  - Установите Zabbix сервер, веб-интерфейс и агент
  ```
  apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent
  ```
  - Создайте базу данных
  Выполните следующие комманды на хосте, где будет распологаться база данных.
  ```
  sudo -u postgres createuser --pwprompt zabbix
  sudo -u postgres createdb -O zabbix zabbix
  ```
  ```
  su - postgres -c 'psql --command "CREATE USER zabbix WITH PASSWORD '\'zabbix\'';"'
  su - postgres -c 'psql --command "CREATE DATABASE zabbix OWNER zabbix;"'
  ```

  На хосте Zabbix сервера импортируйте начальную схему и данные. Вам будет предложено ввести недавно созданный пароль.
  ```
  zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
  ```
  - Настройте базу данных для Zabbix сервера
  Отредактируйте файл /etc/zabbix/zabbix_server.conf
  ```
  find / -name zabbix_server.conf
  DBPassword=password
  ```
  ```
  sed -i 's/# DBPassword=/DBPassword=zabbix/g' /etc/zabbix/zabbix_server.conf
  ```
  - Запустите процессы Zabbix сервера и агента
  Запустите процессы Zabbix сервера и агента и настройте их запуск при загрузке ОС.
  ```
  systemctl restart zabbix-server zabbix-agent apache2
  systemctl enable zabbix-server zabbix-agent apache2
  ```
3. Авторизация ![admin.png](\admin.png)
