<?php
// login.php
session_start();
require 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario = $_POST['usuario'];
    $senha = $_POST['senha'];

    // Consulta o usuário no banco de dados
    $stmt = $pdo->prepare('SELECT usuario_id, nome, senha, perfil_id FROM usuarios WHERE email = ?');
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    // Verifica se o usuário existe e se a senha está correta
    if ($user && password_verify($password, $user['senha'])) {
        // Login bem-sucedido, armazena informações na sessão
        $_SESSION['user_id'] = $user['usuario_id'];
        $_SESSION['user_name'] = $user['nome'];
        $_SESSION['user_profile'] = $user['perfil_id'];
        header('Location: dashboard.php'); // Redireciona para a página de dashboard
        exit;
    } else {
        echo 'Email ou senha inválidos';
    }
}
?>