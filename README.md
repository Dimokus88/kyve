# KYVE protocol node for deployment on Akash Network 
# Установка ноды проекта KYVE для развертки в Akash Network 
<div align="center">

![pba](https://user-images.githubusercontent.com/23629420/163564929-166f6a01-a6e2-4412-a4e9-40e54c821f05.png)
| [Akash Network](https://akash.network/) | [Forum Akash Network](https://forum.akash.network/) | 
|:--:|:--:|
___
Before you start - subscribe to our news channels: 

Прежде чем начать - подпишитесь на наши новостные каналы:

| [Discord Akash](https://discord.gg/3SNdg3BS) | [Telegram Akash EN](https://t.me/AkashNW) | [Telegram Akash RU](https://t.me/akash_ru) | [TwitterAkash](https://twitter.com/akashnet_) | [TwitterAkashRU](https://twitter.com/akash_ru) |
|:--:|:--:|:--:|:--:|:--:|

</div>

<div align="center">
  
[English version](https://github.com/Dimokus88/kyve/blob/main/README.md#english-version) | [Русская версия](https://github.com/Dimokus88/kyve/blob/main/README.md#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B0%D1%8F-%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8F)

## Если вы претендуете на дроп 10АКТ заходите в нашу группу [Telegram Akash RU](https://t.me/akash_ru)
  
</div>

___
# Русская версия

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

>Вам должно прийти 300 токенов. Проверьте баланс в Keplr. Так же можно дополнительно запросить токены в кране [Discord KYVE](https://discord.gg/cfG42HHd) , отправив сообщение формата ```!faucet адрес_кошелька```

* Для работы ноды, нужно небольшое количество токенов ```Arweave```. Идем на [сайт](https://faucet.arweave.net/) , генерируем кошелек ```Arweave.json```, размещаем твит и получаем токены на счет. 

<div align="center">
  
<img src="https://user-images.githubusercontent.com/23629420/165384628-0fd7650d-cb0e-447a-8874-be640816a8bd.png" height="400"/>

</div>

Если сайт говорит что вы бот - то попробуйте удалить твит и провести процедуру заново.
* Когда получите файл кошелька ```Arweave``` с токенами - разместите его на ***google диск***, что бы оттуда можно было его скачать в контейнер. 

* Затем откройте доступ к файлу на google диск и скопируйте его ссылку, она будет вида:

```https://drive.google.com/open?id=xxxxxxxxxxxxxx-xxxxxxxxxxxx&authuser=gmail%40gmail.com&usp=drive_fs```

 вам нужно взять часть: ```id=xxxxxxxxxxxxxx-xxxxxxxxxxxx``` и вставить перед ней: ```https://drive.google.com/uc?export=download&```. 
 
Таким образом, у вас получится ссылка на прямое скачивание файла:

```https://drive.google.com/uc?export=download&id=xxxxxxxxxxxxxx-xxxxxxxxxxxx```

Сохраните ее.
***Так же сохраните мнемоник фразу от кошелька с KYVE.***

## 2. Разворачиваем ноду KYVE
> На вашем кошельке Akash должно быть более 5 АКТ (5 АКТ будут заблокированы на развертывание + оплата газа транзакций). АКТ можно пробрести на биржах Gate, AsendeX, Osmosis . Так же в нашем сообществе [Akash RU](https://t.me/akash_ru) мы регулярно проводим эвенты в которых раздаем АКТ.

* Открываем Akashlytics, если он у вас не установлен - то вот [ссылка на скачивание](https://www.akashlytics.com/deploy).

* Проверяем наличие баланса (>5АКТ) и наличие установленного сертификата.

![image](https://user-images.githubusercontent.com/23629420/165339432-6f053e43-4fa2-4429-8eb7-d2fc66f47c70.png)

* Нажимаем CREATE DEPLOYMENT. Выбираем Empty(пустой template) и копируем туда содержимое [deploy.yml](https://github.com/Dimokus88/kyve/blob/main/deploy.yml) .

Давайте раберем что там есть, итак раздел ```services``` здесь указывается docker образ ноды, а также блок с переменными окружения ```env```:

В поле ***POOL*** - Можете вручную установить пул, по умолчанию настроен Moonbeam.

В поле ***MNEMONIС*** - вставляем мнемоник фразу от вашего кошелька KYVE.

В поле ***STAKE*** - укажите желаемый объем стейка токенов KYVE.

В поле ***LINK_ARWEAVE_WALLET*** - прямую сылку на скачивание файла вашего кошелька Arweave, сохраненного на гугл диск как было описано выше.

Ниже, в поле ```resources``` мы выставляем арендуюмую мощность. для ноды KYVE рекомендуется ```1 CPU x 4 GB RAM x 1 GB SSD```.

Нажимаем кнопку ```CREATE DEPLOYMENT``` и ждем появления провайдеров, со свободными мощностями (BIDS).

![image](https://user-images.githubusercontent.com/23629420/165608527-da85c84e-edcc-4b15-8843-441d3e76dcb6.png)


2.3 Выбираем подходящий для нас по цене и оборудованию. После чего нажимаем ```ACCEPT BID```.

Ждем заверщения развертывания.

Во вкладке ```LOGS``` можем наблюдать работу ноды.

![image](https://user-images.githubusercontent.com/23629420/165610306-76798d16-9b5b-48fa-b546-2b7cc69d3f27.png)



# Спасибо что выбрали Akash Network!

___
___
# English version

## 1. Requesting tokens from a faucet and preparing wallets

* Go to site [app.kyve.network](https://app.kyve.network/) and connect Keplr wallet:

<div align="center">
  
![image](https://user-images.githubusercontent.com/23629420/165317069-2a67123c-4279-4ba0-ab4d-78bd3dbba0b0.png)
  
</div>

* We allow the site to access the wallet by clicking on ```Approve```:

<div align="center">
  
<img src="https://user-images.githubusercontent.com/23629420/165317229-da078b94-d0d6-4f3c-93be-9e7de053db44.png" height="400"/>
  
</div>

* Click on ```Share on twitter```, and send tweet:

<div align="center">
  
<img src="https://user-images.githubusercontent.com/23629420/165320398-c8e626ea-922f-4b4b-bfc6-cc012ddf6b5f.png" height="400"/>

  </div>
  
* We publish a tweet, copy the link to the post and paste it on the site. Click ```Claim your tokens``` and pass the captcha. 

>You should receive 300 tokens. Check the balance in Keplr. You can also additionally request tokens in the faucet [Discord KYVE](https://discord.gg/cfG42HHd) , by sending a message of the format ```!faucet address_kyve```

* A node needs a small amount of tokens to ```Arweave```. Go to [site](https://faucet.arweave.net/) , create wallet ```Arweave.json```, post a tweet and get tokens to the account.

<div align="center">
  
<img src="https://user-images.githubusercontent.com/23629420/165384628-0fd7650d-cb0e-447a-8874-be640816a8bd.png" height="400"/>

</div>

If the site says that you are a bot, then try deleting the tweet and redoing the procedure.
* When will you receive the wallet file ```Arweave``` with tokens - place it on  ***google drive***, so that from there you can download it into the container. 

* Then open access to the file on google drive and copy its link, it will look like:

***```https://drive.google.com/open?id=xxxxxxxxxxxxxx-xxxxxxxxxxxx&authuser=gmail%40gmail.com&usp=drive_fs```
 you need to take a part: ```id=xxxxxxxxxxxxxx-xxxxxxxxxxxx``` and put in front of it: ```https://drive.google.com/uc?export=download&```.  
Thus, you will get a link to a direct download of the file:
```https://drive.google.com/uc?export=download&id=xxxxxxxxxxxxxx-xxxxxxxxxxxx```***

Save is.

***Also save the mnemonic phrase from the wallet with KYVE.***

## 2. Deploy the node KYVE
> You must have more than 5 AKT on your Akash wallet (5 АКТ will be blocked for deployment + transaction gas payment). АКТ can be found on the exchanges Gate, AsendeX, Osmosis . Also in our community [Akash RU](https://t.me/akash_ru) we regularly hold events in which we distributeАКТ.

* Open Akashlytics,if you don't have it installed, then [link to download](https://www.akashlytics.com/deploy).

* We check the presence of a balance (> 5AKT) and the presence of an installed certificate.

![image](https://user-images.githubusercontent.com/23629420/165339432-6f053e43-4fa2-4429-8eb7-d2fc66f47c70.png)

* Click CREATE DEPLOYMENT. Select Empty (empty template) and copy the contents there [deploy.yml](https://github.com/Dimokus88/kyve/blob/main/deploy.yml) .

Let's take a look at what is there, so the section ```services``` docker node image is specified here, as well as a block with environment variables ```env```:

In the column ***POOL*** -You can manually set the pool, Moonbeam is set by default.

In the column ***MNEMONIС*** - insert the mnemonic phrase from your KYVE wallet.

In the column ***STAKE*** - specify the desired amount of stake of KYVE tokens.

In the column ***LINK_ARWEAVE_WALLET*** -direct link to download your Arweave wallet file saved to google drive as described above.

In the column ```resources``` we expose the rented capacity. recommended for KYVE node ```1 CPU x 4 GB RAM x 1 GB SSD```.

Click on ```CREATE DEPLOYMENT``` and we are waiting for the appearance of providers with free capacities (BIDS).

![image](https://user-images.githubusercontent.com/23629420/165608527-da85c84e-edcc-4b15-8843-441d3e76dcb6.png)


2.3We choose the one that suits us in terms of price and equipment. Then we press ```ACCEPT BID```.

We are waiting for the completion of the deployment.

In the tab ```LOGS``` we can observe the work of the node.

![image](https://user-images.githubusercontent.com/23629420/165610306-76798d16-9b5b-48fa-b546-2b7cc69d3f27.png)



# Thank you for choosing Akash Network!
