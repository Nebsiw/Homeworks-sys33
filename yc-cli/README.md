## Процесс установки и настройки Yandex CLI 
### Шаги выполнения:
1. Установка
```
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
```
2. Начать настройку профиля CLI
```
yc init
```
3. Проверьте настройки вашего профиля CLI:
```
yc config list
```
4. Создайте облачную сеть в каталоге, указанном в вашем профиле CLI:
```
yc vpc network create \
  --name netology \
  --labels my-label=netology \
  --description "network-student"
  ```
5. Создать подсеть в облачной сети `netology`:
```
yc vpc subnet create \
  --name netology-subnet-a \
  --zone ru-central1-a \
  --range 10.1.2.0/24 \
  --network-name netology \
  --description "subnet netology"
  ```
6. Получить список всех облачных сетей в каталоге, указанном в профиле CLI: 
  ```
  yc vpc netwrok list
  yc vpc network list --format yaml
  ```
7. Добавить ssh ключ в HOME/.ssh: `id_xxxxx.pub id_xxx`. Назначить права на ключи 
  ```
  chmod 600 id_xxxxx
  chmod 644 id_xxxxx.pub
  ```
8. Создание VM
  ```
  yc compute instance create \
  --name vm-netology-1 \
  --hostname vm-netology-1 \
  --network-interface subnet-name=netology-subnet-a,nat-ip-version=ipv4 \
  --zone ru-central1-a \
  --ssh-key ~/.ssh/id_ed25519.pub \
  --platform standard-v3 \
  --cores 2 \
  --core-fraction 20 \
  --preemptible \
  --memory 2 \
  --create-boot-disk image-id=fd8lj9ahkhukgg67k57e,size=20,type=network-hdd
  ```
9. Описание:
      - name - имя VM
      - hostname - hostname VM
      - network-interface - к какой подсети будет подключена машина и протокол
      - zone - в какой зоне создавать VM
      - ssh-key - путь к публичному ssh ключу
      - platform - используемый процессор [Описание платформ](https://yandex.cloud/ru/docs/compute/concepts/vm-platforms)
      - cores  - количество ядер
      - core-fraction - сколько процентов ядра
      - preemptible - прерываемая машина
      - memory - количество ОЗУ
      - create-boot-disk - данные по загрузочному диску: образ [image-id](https://yandex.cloud/ru/marketplace/products/yc/ubuntu-20-04-lts), объем `size`(указывается в GB), тип диска `type` (network-hdd, network-ssd)
10. Просмотр информации о VM
  ```
  yc compute instance get vm-netology-1
  ```
11. Коннект к VM, поумолчанию создается пользователь `yc-user`
  ```
  ssh yc-user@"PUBLIC_IP"
  ```
12. Удаление VM подсети и сети
  ```
  yc compute instance delete vm-netology-1
  yc vpc subnet delete netology-subnet-a
  yc vpc network delete netology
  ```
13. Для удобства настройки из пункта 8 можно закинуть в скрипт. 
