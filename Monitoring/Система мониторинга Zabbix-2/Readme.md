### Задание 1
Создайте свой шаблон, в котором будут элементы данных, мониторящие загрузку CPU и RAM хоста.

#### Ответ на задание 1
1. Сначала проведем анализ готовых шаблонов и документации Zabbix, в целях узнать какие параметры требуется для настройки item, что бы получать информацию по использованию CPU и RAM.
2. Для item CPU настраиваем конфигурацию: 
```
Macros 
{$CPU_UTILIZATIONS} 5s
Type Zabbix agent
Key system.cpu.util
Type of information Numeric (float)
Update interval {$CPU_UTILIZATIONS}
```
3. ля item RAM настраиваем конфигурацию:
```
Macros 
{$MEMORY_UTILIZATION} 5s
Type Zabbix agent
Key vm.memory.size[used]
Type of information Numeric (unsigned)
Units B
Update interval {$MEMORY_UTILIZATION}
```
4. Скриншот ![Задание-1-items.png](https://github.com/Nebsiw/Homeworks-sys33/blob/main/Monitoring/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0%20Zabbix-2/images/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-1-items.png)

## Задание 2
Добавьте в Zabbix два хоста и задайте им имена <фамилия и инициалы-1> и <фамилия и инициалы-2>. Например: ivanovii-1 и ivanovii-2.

### Задание 3
Привяжите созданный шаблон к двум хостам. Также привяжите к обоим хостам шаблон Linux by Zabbix Agent.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Зайдите в настройки каждого хоста и в разделе Templates прикрепите к этому хосту ваш шаблон
3. Так же к каждому хосту привяжите шаблон Linux by Zabbix Agent
4. Проверьте что в раздел Latest Data начали поступать необходимые данные из вашего шаблона

#### Ответ на задание 2-3
1. При добавление своего шаблона возникает конфилкт с key system.cpu.util, так как данный ключ есть в готовом шаблоне Linux by Zabbix Agent.
2. Убираем из своего шаблона item для CPU.
3. Скриншоты 
  ![Задание-2-3-templates-1.png](https://github.com/Nebsiw/Homeworks-sys33/blob/main/Monitoring/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0%20Zabbix-2/images/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-2-3-templates-1.png)
  ![Задание-2-3-templates-2.png](https://github.com/Nebsiw/Homeworks-sys33/blob/main/Monitoring/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0%20Zabbix-2/images/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-2-3-templates-2.png)

### Задание 4
Создайте свой кастомный дашборд.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. В разделе Dashboards создайте новый дашборд
3. Разместите на нём несколько графиков на ваше усмотрение.

#### Ответ на задание 4
![Задание-4-dashboard.png](https://github.com/Nebsiw/Homeworks-sys33/blob/main/Monitoring/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0%20Zabbix-2/images/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-4-dashboard.png)

### Задание 5* со звёздочкой
Создайте карту и расположите на ней два своих хоста.

#### Процесс выполнения
1. Настройте между хостами линк.
2. Привяжите к линку триггер, связанный с agent.ping одного из хостов, и установите индикатором сработавшего триггера красную пунктирную линию.
3. Выключите хост, чей триггер добавлен в линк. Дождитесь срабатывания триггера.

#### Ответ на задание 5
![Задание-5-maps.png](https://github.com/Nebsiw/Homeworks-sys33/blob/main/Monitoring/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0%20Zabbix-2/images/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-5-maps.png)

### Задание 6* со звёздочкой
Создайте UserParameter на bash и прикрепите его к созданному вами ранее шаблону. Он должен вызывать скрипт, который:
- при получении 1 будет возвращать ваши ФИО,
- при получении 2 будет возвращать текущую дату.

#### Ответ на задание 6
1. Создаем bash script [userparameter-fio-data.sh](https://github.com/Nebsiw/Homeworks-sys33/blob/main/Monitoring/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0%20Zabbix-2/userparameter-fio-data.sh)
2. Копируем его на ВМ с zabbix-agent "Latyshev-2-deb" в директорию `/etc/zabbix/zabbix_agentd.d`.
3. Создаем файл конфигурации в котором укажем новые UserParameter
```
UserParameter=fio-data[*], bash /etc/zabbix/zabbix_agentd.d/userparameter-fio-data.sh  $1
```
4. Перезапускаем zabbix-agent `sudo systemctl zabbix-agent`
5. На второй ВМ машине "Latyshev-1-deb" устанавливаем zabbix-get
`sudo apt install zabbix-get`
6. Со второй ВМ машины "Latyshev-1-deb" делаем запрос с помощью zabbix-get на первую ВМ
```
zabbix_get -s 89.169.128.33 -p 10050 -k "fio-data[1]" #Получили ФИО
zabbix_get -s 89.169.128.33 -p 10050 -k "fio-data[2]" #Получили дату
```
27. В нашем созданном шаблоне добавляем новые item:
  - один item с key fio-data[1] он будет возвращать ФИО
  - второй item с key fio-data[2] он будет возвращать дату
8. Обновляем LatestData.
9. ![Задание-6-userparameter.png](https://github.com/Nebsiw/Homeworks-sys33/blob/main/Monitoring/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0%20Zabbix-2/images/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-6-userparameter.png)

### Задание 7* со звёздочкой
Доработайте Python-скрипт из лекции, создайте для него UserParameter и прикрепите его к созданному вами ранее шаблону. 
Скрипт должен:
- при получении 1 возвращать ваши ФИО,
- при получении 2 возвращать текущую дату,
- делать всё, что делал скрипт из лекции.

#### Ответ на задание 7
1. Копируем скрипт из задания и редактируем в соответствие с заданием, добавляем туда данные из нашего прошлого скрипта:  
[test_python_script](https://github.com/Nebsiw/Homeworks-sys33/blob/main/Monitoring/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0%20Zabbix-2/test_python_script.py)
2. Копируем готовый скрипт на ВМ с zabbix-agent "Latyshev-2-deb" в директорию `/etc/zabbix/zabbix_agentd.d`
3. В созданном ранее файле конфигурации добавляем новый UserParameter :
`UserParameter=python-script[*], python3 /etc/zabbix/zabbix_agentd.d/test_python_script.py $1 $2`
3. Делаем тестовые запросы по аналогии выше с другой ВМ. Убеждаем в корректности конфигурации.
4. В нашем шаблоне создаем новые item:
  - python-fio key python-script[1]
  - python-data key python-script[2]
  - python-ping key python-script[-ping, 8.8.8.8]
  - python-simple-print key python-script[-simple_print, 8.8.8.8]
  - Type of information на всех указываем `Text`
5. ![Задание-7-python.png](https://github.com/Nebsiw/Homeworks-sys33/blob/main/Monitoring/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0%20Zabbix-2/images/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-7-python.png)


  
