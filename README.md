# Book Store Brasil

Book Store Brasil é um aplicativo desenvolvido em Flutter, que junto de seu Back Office, simula uma interface de livraria virtual, permitindo ao usuário visualizar os livros que estão disponíveis para compra e ao administrador, adicionar, editar ou remover estes itens.

![Image of Shimmering](https://hikke.xyz/bsbrazil/imgData/shimmer2.gif) ![Image of Carousel](https://hikke.xyz/bsbrazil/imgData/carousel.gif) ![Image of Cart](https://hikke.xyz/bsbrazil/imgData/cart.gif) ![Image of Account](https://hikke.xyz/bsbrazil/imgData/account.jpg) ![Image of Back Office](https://hikke.xyz/bsbrazil/imgData/adm2.jpg)

## Descrição
A página inicial do aplicativo é composta por um Carousel junto de um ListView que exibe todos os itens cadastrados no Banco de Dados. Para que um item seja exibido no Carousel, ele precisa ser cadastrado como "Sim" na opção "Destacar no Carrossel?" da interface administrativa. 

## Instalação - Aplicativo

É necessário possuir o [Flutter](https://flutter.dev/docs/get-started/install) para compilar e instalar o aplicativo em um simulador ou dispositivo físico. Este aplicativo foi escrito na versão Flutter Beta v1.13.6, para poder também ser compilado para web. Os detalhes para a instalação do Flutter estão no link anterior.

Após a instalação do Flutter, basta acessar a pasta através do terminal e rodar o seguinte comando

```flutter
flutter run
```

ou, se desejar a visualização do WebView (com responsividade apenas mobile), realize o seguinte comando
```flutter
flutter run -d chrome
```

## Instalação - Interface Administrativa

O back office deste sistema foi criado em PHP + MySQL. A pasta ```database``` deste repositório contém o arquivo ```u343885423_bookstore.sql``` que deve ser importado na interface do PHPMyAdmin. O usuário para login e senha está disponível ou pode ser cadastrado na tabela Administradores no banco de dados.

A pasta ```backoffice``` contém todos os arquivos que deverão ser colocados no servidor apache. Para a **conexão com o banco de dados**, é necessário alterar os arquivos ```conecta.php``` na pasta raiz e na pasta ```adm```, bem como o arquivo ```jsonConn.php```, na pasta raiz. Além disso, será necessário gerar uma nova API do [reCAPTCHA v2](https://www.google.com/recaptcha) e substituir a linha 137 do arquivo ```adm/exclui_livro.php```:
```html
(<div class="g-recaptcha" data-sitekey="SUA_DATA-SITEKEY_AQUI">)
```
bem como a linha 35 do arquivo ```adm/delLivro.php```:

```php
$resposta = curl_init("https://www.google.com/recaptcha/api/siteverify?secret='SUA_SECRET_KEY_AQUI'&response=".$captcha_data."&remoteip=".$_SERVER['REMOTE_ADDR']);
```

# ATENÇÃO

Para que o aplicativo receba as imagens e dados dinâmicos corretamente do seu próprio servidor, é necessário que a interface administrativa esteja hospedada em um servidor com criptografia SSL, pois o Flutter automaticamente faz solicitações em HTTPS. Para facilitar a visualização, por padrão, todos os dados estão vindo de um servidor próprio. Para receber os dados de seu próprio servidor, altere as seguintes linhas:

Em ```lib/ui/home_page.dart```, linhas 24 e 25:

```dart
var url = "https://SEUSERVIDOR/livros.php";
String imgURL = 'https://SEUSERVIDOR/images/';
```

Em ```lib/ui/cart_page.dart```, linha 10:
```dart
String imgURL = 'https://SEUSERVIDOR/images/';
```

Em ```lib/ui/product_page.dart```, linha 8:
```dart
String imgURL = 'https://SEUSERVIDOR/images/';
```

Em ```lib/ui/models/books.dart```, linhas 3 e 4:
```dart
var baseurl = "https://SEUSERVIDOR/livros.php";
var alternateurl = "https://SEUSERVIDOR/destaques.php";
```

## Contribua
Pull requests são bem-vindos. Para grandes mudanças, por favor, abra um issue antes, para conversarmos sobre o que poderia ser alterado.

## License
MIT License.