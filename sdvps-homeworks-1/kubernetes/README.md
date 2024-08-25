## Задание 1
1. Скачивание и установка minikube, kubectl
```text
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```
2. Запуск minicube
```text
minikube start
```
3. Установка kubectl
```text
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
```
4. Проверка запуска кластера
```text
kubectl get po -A
kubectl get nodes
```
5. Меняем конфигируцию redis.yml для запуска redis без пароля. Требуется добавить переменную окружения *ALLOW_EMPTY_PASSWORD*
```
- name: ALLOW_EMPTY_PASSWORD
  value: "yes"
```
6. Запускаем контейнер: 
```text
kubectl apply -f ./config/redis.yml
```
7. Запускаем Services. Возможно использовать expose:
```
kubectl expose deployment redis --port 6379 --protocol=TCP --type="NodePort"
```
Либо мы можем создать отдельный манифест с Services [redis-service.yml](https://github.com/Nebsiw/sdvps-homeworks/blob/main/kubernetes/config/redis-service.yml) 

8. Проверяем IP и запуск Services
```
kubectl get svc
kubectl get po -o wide
```
9. Напишите команды kubectl для контейнера из предыдущего задания:
 - выполнения команды ps aux внутри контейнера: 
  ```text
  kubectl exec -it deployment/redis -- ps aux
  ```
  ![redis-ps_aux](https://github.com/Nebsiw/sdvps-homeworks/blob/main/kubernetes/image/redic%20ps%20aux.png)
 - просмотра логов контейнера за последние 5 минут;
    ```
    kubectl logs deploy/redis
    kubectl logs --tail 200 deploy/redis
    ```
  ![redis_logs](https://github.com/Nebsiw/sdvps-homeworks/blob/main/kubernetes/image/redis%20log.png)
 - удаления контейнера;
  ```text
  kubectl delete deploy/redis
  ```
 - проброса порта локальной машины в контейнер для отладки
  ```text
  kubectl port-forward deploy/redis 30100:6379
  ```
  ## Выполнение дополнительного задания
  1. Создаем ConfigMap для настройки nginx [config-map-nginx.yml](https://github.com/Nebsiw/sdvps-homeworks/blob/main/kubernetes/config/config-map-nginx.yml) 
  В нем указываем конфигурацию, которую будет загружать nginx.conf 
  2. Создаем файл для запуска nginx [nginx.yaml](https://github.com/Nebsiw/sdvps-homeworks/blob/main/kubernetes/config/nginx.yml.back) . Настраиваем образ, порт, а также откуда и куда будет монтироваться конфигурация nginx. Путем проб, ошибок и чтения мануалов оказался каталог 
  ```
  /etc/nginx/conf.d/
  ```
  3. Ingress, который будет направлять запросы по префиксу /test на наш сервис [ngix-igress.yml](https://github.com/Nebsiw/sdvps-homeworks/blob/main/kubernetes/config/nginx-service.yml) . Включить ingress-nginx 
  ```
  minikube addons enable ingress
  ```
