
### Задание 1

Установите Docker Compose и опишите, для чего он нужен и как может улучшить вашу жизнь.

---
#### Ответ задание 1
Docker Compose оказывает значительную помощь в разворачивание и конфигируривание контенеров Docker. Помогает избежать ошибок в конфигируции.
---
### Задание 7 

**Выполните действия.**
1. Выполните запрос в Pushgateway для помещения метрики <ваши фамилия и инициалы> со значением 5 в Prometheus: ```echo "<ваши фамилия и инициалы> 5" | curl --data-binary @- http://localhost:<внешний порт выбранный вами в задании 4>/metrics/job/netology```.
2. Залогиньтесь в Grafana с помощью логина и пароля из предыдущего задания.
3. Cоздайте Data Source Prometheus (Home -> Connections -> Data sources -> Add data source -> Prometheus -> указать "Prometheus server URL = http://prometheus:9090" -> Save & Test).
4. Создайте график на основе добавленной в пункте 5 метрики (Build a dashboard -> Add visualization -> Prometheus -> Select metric -> Metric explorer -> <ваши фамилия и инициалы -> Apply.

В качестве решения приложите:

* docker-compose.yml **целиком**;
* скриншот команды docker ps после запуске docker-compose.yml;
* скриншот графика, постоенного на основе вашей метрики.

---
#### Ответ задание 7
**Выполнение**
1. [docler-compose.yml](https://github.com/Nebsiw/sdvps-homeworks/blob/main/docker-6.4-new/compose.yml)
2. Отображение выводы команды docker ps ![docker ps](https://github.com/Nebsiw/sdvps-homeworks/blob/main/docker-6.4-new/images/Screenshot%20from%202024-06-27%2019-46-46.png)
3. Отображение графика в Grafana, для создания метрики использовался не большой скрипт ![grafana](https://github.com/Nebsiw/sdvps-homeworks/blob/main/docker-6.4-new/images/Screenshot%20from%202024-06-27%2020-16-35.png)
---
### Задание 8

**Выполните действия:** 

1. Остановите и удалите все контейнеры одной командой.

В качестве решения приложите скриншот консоли с проделанными действиями.

#### Ответ задание 8
Команда 
```
docker rm -v -f $(docker ps -qa)
```
![rm_container](https://github.com/Nebsiw/sdvps-homeworks/blob/main/docker-6.4-new/images/rm_container.png)
---
### Задание 9* 

**Выполните действия:** 

1. Создайте конфигурацию docker-compose для Alertmanager с именем контейнера <ваши фамилия и инициалы>-netology-alertmanager. 
2. Добавьте необходимые тома с данными и [конфигурацией](https://github.com/netology-code/sdvps-homeworks/tree/main/6-04/alertmanager), сеть, режим и очередность запуска.
3. Обновите конфигурацию Prometheus (необходимые изменения ищите в презентации или документации) и перезапустите его. 
4. Обеспечьте внешний доступ к порту 9093 c докер-сервера.

В качестве решения приложите скриншот с событием из Alertmanager.

#### Ответ задание 9
Лог Alertmanager:
![Alertmanager](https://github.com/Nebsiw/sdvps-homeworks/blob/main/docker-6.4-new/images/alert.png)
