import 'dart:async';
import 'package:http/http.dart' as http;

var baseurl = "https://hikke.xyz/bookstore/livros.php";

class API {
  static getTotal() {
    var url = baseurl;

    return http.get(url);
  }

  static getBooks() {
    var url = baseurl;

    return http.get(url);
  }
}

class Books {
  String titulo;
  String autor;
  String preco;
  String estoque;
  String imagem;
  String destaque;

  Books(
      {this.titulo,
      this.autor,
      this.preco,
      this.estoque,
      this.imagem,
      this.destaque});

  Books.fromJson(Map json)
      : titulo = json['titulo'],
        autor = json['autor'],
        preco = json['preco'],
        estoque = json['estoque'],
        imagem = json['imagem'],
        destaque = json['destaque'];
}