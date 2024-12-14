<?php

require_once("koneksi/koneksi.php");

if(isset($_POST['index']))
{
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
    $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);

    $sql = "SELECT * FROM users WHERE username=:username OR email=:email";
    $stmt = $db->prepare($sql);
    $params = array(
        ":username" => $username,
        ":email" => $username
    );

    $stmt->execute($params);

    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    if($user){
        if(password_verify($password, $user["password"])){
            session_start();
            $_SESSION["user"] = $user;
            if ($user["level"] == 1) {
                header("Location: timeline.php");
            } else {
                header("Location: index.php");
            }
        } else {
            echo "Password salah!";
        }
    } else {
        echo "Pengguna tidak ditemukan!";
    }
}

if(isset($_POST['register'])){

    $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
    $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
    $phone = filter_input(INPUT_POST, 'phone', FILTER_SANITIZE_STRING);
    $address = filter_input(INPUT_POST, 'address', FILTER_SANITIZE_STRING);

    $level = 2;

    $sql = "INSERT INTO users (name, username, email, password, phone, address, level)
            VALUES (:name, :username, :email, :password, :phone, :address, :level)";
    $stmt = $db->prepare($sql);

    $params = array(
        ":name" => $name,
        ":username" => $username,
        ":password" => $password,
        ":email" => $email,
        ":phone" => $phone,
        ":address" => $address,
        ":level" => $level
    );

    $saved = $stmt->execute($params);

    if($saved) {
        header("Location: login.php");
    } else {
        echo "Terjadi kesalahan saat mendaftar. Silakan coba lagi.";
    }
}

?>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Galon Super</title>
    <link rel="stylesheet" href="css/style3.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
  </head>
  <body>
    <div class="container" id="container">
      <div class="form-container register-container">
        <form action="" method="post">
          <h1>Daftar Disini</h1>
          <div class="form-group">
                <input class="form-control" type="text" name="name" placeholder="Nama kamu" />
          </div>
          <div class="form-group">
                <input class="form-control" type="text" name="username" placeholder="Username" />
          </div>
          <div class="form-group">
                <input class="form-control" type="email" name="email" placeholder="Alamat Email" />
          </div>
          <div class="form-group">
                <input class="form-control" type="text" name="phone" placeholder="Nomor Telepon" />
          </div>
          <div class="form-group">
                <input class="form-control" type="text" name="address" placeholder="Alamat" />
          </div>
          <div class="form-group">
                <input class="form-control" type="password" name="password" placeholder="Password" />
          </div>
          <button class="btn btn-success btn-block" name="register">Daftar</button>
        </form>
      </div>

      <div class="form-container login-container">
        <form class="form-lg" action="" method="post">
          <h1>Masuk di sini</h1>
          <div class="form-control2">
          <input class="form-control" type="text" name="username" placeholder="Username atau email" />
          </div>
          <div class="form-control2">
          <input class="form-control" type="password" name="password" placeholder="Password" />
          </div>
          <button class="btn btn-success btn-block" name="index">Login</button>
        </form>
      </div>

      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-left">
            <h1 class="title">Halo Teman Teman!</h1>
            <p>Jika Anda memiliki akun, masuk di sini</p>
            <button class="ghost" id="login">Login</button>
          </div>

          <div class="overlay-panel overlay-right">
            <h1 class="title">Silahkan Login</h1>
            <p>Jika belum memiliki akun Silahkan Registrasi</p>
            <button class="ghost" id="register">Register</button>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
const registerButton = document.getElementById("register");
const loginButton = document.getElementById("login");
const container = document.getElementById("container");

registerButton.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

loginButton.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});
  </script>
</html>
