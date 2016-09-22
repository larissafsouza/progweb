<?php
$usuario = "root";
$senha = "redes123";

# Conexao com mysql via pdo_mysql
try {
	$conn = new PDO("mysql:host=localhost;dbname=gomoku", $usuario, $senha);
	print("Conexao efetuada com sucesso!")
} catch (PDOException $e) {
	echo $e->getMessage();
}

