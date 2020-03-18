-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18/03/2020 às 06:02
-- Versão do servidor: 10.2.30-MariaDB
-- Versão do PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u343885423_bookstore`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administradores`
--

CREATE TABLE `administradores` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `SENHA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `administradores`
--

INSERT INTO `administradores` (`ID`, `NOME`, `EMAIL`, `SENHA`) VALUES
(1, 'Admin', 'admin@bsbrasil.com', 'BSBrasil123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `ID` int(11) NOT NULL,
  `TITULO` text NOT NULL,
  `AUTOR` text NOT NULL,
  `PRECO` varchar(10) NOT NULL,
  `ESTOQUE` int(11) NOT NULL,
  `IMAGEM` text NOT NULL,
  `DESTAQUE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`ID`, `TITULO`, `AUTOR`, `PRECO`, `ESTOQUE`, `IMAGEM`, `DESTAQUE`) VALUES
(1, 'O Programador Pragmático: De Aprendiz a Mestre', 'Andrew Hunt, David Thomas', '125,50', 50, '41WH7HFsbzL.jpg', 1),
(2, 'The Mythical Man-Month: Essays on Software Engineering', 'Frederick P. Brooks Jr.', '170,19', 32, '51xCKsOn83L.jpg', 0),
(3, 'Expressões Regulares - Uma Abordagem Divertida', 'Aurelio Marinho Jargas', '47,20', 10, 'capa-292.jpg', 0),
(4, 'Domain-Driven Design: Tackling Complexity in the Heart of Software', 'Eric Evans', '251,14', 32, '51OWGtzQLLL.jpg', 1),
(5, 'Padrões de Arquitetura de Aplicações Corporativas', 'Martin Fowler', '101,59', 25, '517cM5mCxPL.jpg', 1),
(6, 'The Design of Design: Essays from a Computer Scientist', 'Frederick P. Jr. Brooks', '161,75', 5, '51XIhubapBL._SX332_BO1,204,203,200_.jpg', 0),
(7, 'Shell Script Profissional', 'Aurelio Marinho Jargas', '62,35', 37, '717NiWamPGL.jpg', 0),
(8, 'NoSQL Essencial: Um Guia Conciso para o Mundo Emergente da Persistência Poliglota', 'Pramod J. Sadalage, Martin Fowler', '52,00', 19, '71F231hdOaL.jpg', 0),
(9, 'Refactoring: Improving the Design of Existing Code', 'Martin Fowler', '220,63', 43, '41odjJlPgHL._SX260_.jpg', 0),
(10, 'Clean Architecture: A Craftsman\'s Guide to Software Structure and Design', 'Robert C. Martin', '148,61', 1, '51JF95r45vL.jpg', 0),
(11, 'Clean Code: A Handbook of Agile Software Craftsmanship', 'Robert C. Martin', '180,04', 16, '51d1qVhmAmL.jpg', 0),
(12, 'Clean Agile: Back to Basics', 'Robert C. Martin', '174,20', 29, '41tc6iwhQUL.jpg', 0),
(13, 'Building Microservices: Designing Fine-Grained Systems', 'Sam Newman', '209,30', 6, '51e6hCWFZNL.jpg', 0),
(14, 'Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems', 'Martin Kleppmann', '82,99', 37, '514xvNk9rTL.jpg', 1),
(30, 'A Maldição do Tigre', 'Colleen Houck', '14.90', 12, '1009090959.jpg', 0);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `administradores`
--
ALTER TABLE `administradores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
