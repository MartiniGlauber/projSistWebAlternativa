<?php
// config.php

// Definição das variáveis de configuração do banco de dados
$host = 'localhost'; // Endereço do servidor de banco de dados, geralmente 'localhost' para um servidor local
$db = 'alternativa_autolocadora'; // Nome do banco de dados que será utilizado
$user = 'root'; // Usuário do banco de dados, 'root' é o usuário padrão no MySQL
$pass = ''; // Senha do usuário do banco de dados, deixe em branco se o usuário 'root' não tiver senha
$charset = 'utf8mb4'; // Conjunto de caracteres a ser utilizado na conexão com o banco de dados, 'utf8mb4' é uma boa escolha para garantir suporte a caracteres especiais e emojis

// Construção do DSN (Data Source Name) para a conexão PDO
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
// Opções para a configuração do PDO
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Configura o PDO para lançar exceções em caso de erros
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Configura o modo de busca padrão para associativo, ou seja, retornará as linhas como arrays associativos
    PDO::ATTR_EMULATE_PREPARES => false, // Desativa a emulação de prepared statements do PDO, garantindo que consultas preparadas sejam executadas de forma nativa pelo MySQL
];

try {
    // Cria uma nova instância de PDO para a conexão com o banco de dados
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    // Captura qualquer exceção lançada durante a tentativa de conexão e lança uma nova exceção com a mensagem de erro e o código
    throw new PDOException($e->getMessage(), (int)$e->getCode());
}
?>