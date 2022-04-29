# Установка ноды проекта KYVE для развертки в Akash Network
<div align="center">

![pba](https://user-images.githubusercontent.com/23629420/163564929-166f6a01-a6e2-4412-a4e9-40e54c821f05.png)
| [Akash Network](https://akash.network/) | [Forum Akash Network](https://forum.akash.network/) | 
|:--:|:--:|
___
Прежде чем начать - подпишитесь на наши новостные каналы:

| [Discord Akash](https://discord.gg/3SNdg3BS) | [Telegram Akash EN](https://t.me/AkashNW) | [Telegram Akash RU](https://t.me/akash_ru) | [TwitterAkash](https://twitter.com/akashnet_) | [TwitterAkashRU](https://twitter.com/akash_ru) |
|:--:|:--:|:--:|:--:|:--:|
</div>

___

## 1. Запрос токенов с крана и подготовка кошельков

* Идем на сайт  [app.kyve.network](https://app.kyve.network/) и подключаем кошелек Keplr:

<div align="center">
  
![image](https://user-images.githubusercontent.com/23629420/165317069-2a67123c-4279-4ba0-ab4d-78bd3dbba0b0.png)
  
</div>

* Разрешаем сайту получить доступ к кошельку, кликнув на ```Approve```:

<div align="center">
  
<img src="https://user-images.githubusercontent.com/23629420/165317229-da078b94-d0d6-4f3c-93be-9e7de053db44.png" height="400"/>
  
</div>

* Нажимаем на ```Share on twitter```, и отправляем твит:

<div align="center">
  
<img src="https://user-images.githubusercontent.com/23629420/165320398-c8e626ea-922f-4b4b-bfc6-cc012ddf6b5f.png" height="400"/>

  </div>
  
* Публикуем твит, копируем ссылку на пост и вставляем её на сайте. Нажимаем ```Claim your tokens``` и проходим капчу. 

>Вам должно прийти 1000 токенов. Проверьте баланс в Keplr. Так же можно дополнительно запросить токены в кране [Discord KYVE](https://discord.gg/cfG42HHd) , отправив сообщение формата ```!faucet адрес_кошелька```

* Для работы ноды, нужно небольшое количество токенов ```Arweave```. Идем на [сайт](https://faucet.arweave.net/) , генерируем кошелек ```Arweave.json```, размещаем твит и получаем токены на счет. 

<div align="center">
  
<img src="https://user-images.githubusercontent.com/23629420/165384628-0fd7650d-cb0e-447a-8874-be640816a8bd.png" height="400"/>

</div>

Если сайт говорит что вы бот - то попробуйте удалить твит и провести процедуру заново.
* Когда получите файл кошелька ```Arweave``` с токенами - разместите его на ***google диск***, что бы оттуда можно было его скачать в контейнер. 

* Затем откройте доступ к файлу на google диск и скопируйте его ссылку, она будет вида:

```https://drive.google.com/open?id=xxxxxxxxxxxxxx-xxxxxxxxxxxx&authuser=gmail%40gmail.com&usp=drive_fs```

 вам нужно взять часть: ```id=xxxxxxxxxxxxxx-xxxxxxxxxxxx``` и вставить перед ней: ```https://drive.google.com/uc?export=download```. 
 
Таким образом, у вас получится ссылка на прямое скачивание файла:

```https://drive.google.com/uc?export=download&id=xxxxxxxxxxxxxx-xxxxxxxxxxxx```

Сохраните ее.
***Так же сохраните мнемоник фразу от кошелька с KYVE.***

## 2. Разворачиваем ноду KYVE
На вашем кошельке Akash должно быть более 5 АКТ (5 АКТ будут заблокированы на развертывание + оплата газа транзакций). АКТ можно пробрести на биржах Gate, AsendeX, Osmosis . Так же в нашем сообществе [Akash RU](https://t.me/akash_ru) мы регулярно проводим эвенты в которых раздаем АКТ.
>Сейчас доступно 3 пула, контейнер настроен таким образом, что если у вас нехватает депозита для стейка в пуле 0, то нода переключится на пул 1 и так далее. Таким образом, нода будет перебирать пулы пока не подключится. Попытки подключения делаются раз в 5 минут. Вся информация будет выводится во вкладку LOGS.  

* Открываем Akashlytics, если он у вас не установлен - то вот [ссылка на скачивание](https://www.akashlytics.com/deploy).

* Проверяем наличие баланса (>5АКТ) и наличие установленного сертификата.

![image](https://user-images.githubusercontent.com/23629420/165339432-6f053e43-4fa2-4429-8eb7-d2fc66f47c70.png)

* Нажимаем CREATE DEPLOYMENT. Выбираем Empty(пустой template) и копируем туда содержимое [deploy.yml](https://github.com/Dimokus88/kyve/edit/main/deploy.yml) .

Давайте раберем что там есть, итак раздел ```services``` здесь указывается docker образ ноды, а также блок с переменными окружения ```env```:

В поле ***POOL*** - Можете вручную установить пул, по умолчанию настроен Moonbeam.

В поле ***MNEMONIС*** - вставляем мнемоник фразу от вашего кошелька KYVE.

В поле ***STAKE*** - укажите желаемый объем стейка токенов KYVE.

В поле ***MONIKER*** - вставляем имя ноды.

В поле ***LINK_ARWEAVE_WALLET*** - прямую сылку на скачивание файла вашего кошелька Arweave, сохраненного на гугл диск как было описано выше.

В поле ***LINK_KYVE_VERSION*** - указана ссылка на версию ноды, при необходимости можно изменить.

В поле ***LINK_KYVE_Bitcoin*** - указана ссылка на версию ноды пула Bitcoin, при необходимости можно изменить.

Ниже, в поле ```resources``` мы выставляем арендуюмую мощность. для ноды KYVE рекомендуется ```1 CPU x 4 GB RAM x 20 GB SSD``` , но думаю что хватит и ```1 CPU x 2 GB RAM x 20 GB SSD```
Нажимаем кнопку ```CREATE DEPLOYMENT``` и ждем появления провайдеров, со свободными мощностями (BIDS).

![image](https://user-images.githubusercontent.com/23629420/165608527-da85c84e-edcc-4b15-8843-441d3e76dcb6.png)


2.3 Выбираем подходящий для нас по цене и оборудованию. После чего нажимаем ```ACCEPT BID```.

Ждем заверщения развертывания.

Во вкладке ```LOGS``` можем наблюдать работу ноды.

![image](https://user-images.githubusercontent.com/23629420/165610306-76798d16-9b5b-48fa-b546-2b7cc69d3f27.png)



# Спасибо что выбрали Akash Network!
