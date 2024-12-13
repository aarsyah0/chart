<?php

require_once("koneksi/koneksi.php");

if(isset($_POST['index'])){

    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
    $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);

    $sql = "SELECT * FROM users WHERE username=:username OR email=:email";
    $stmt = $db->prepare($sql);

    // bind parameter ke query
    $params = array(
        ":username" => $username,
        ":email" => $username
    );

    $stmt->execute($params);

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // jika user terdaftar
    if($user){
        // verifikasi password
        if(password_verify($password, $user["password"])){
            // buat Session
            session_start();
            $_SESSION["user"] = $user;
            // login sukses, alihkan ke halaman timeline
            header("Location: timeline.php");
        }
    }
}

require_once("koneksi/koneksi.php");

if(isset($_POST['register'])){

    // filter data yang diinputkan
    $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
    // enkripsi password
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
    $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);


    // menyiapkan query
    $sql = "INSERT INTO users (name, username, email, password)
            VALUES (:name, :username, :email, :password)";
    $stmt = $db->prepare($sql);

    // bind parameter ke query
    $params = array(
        ":name" => $name,
        ":username" => $username,
        ":password" => $password,
        ":email" => $email
    );

    // eksekusi query untuk menyimpan ke database
    $saved = $stmt->execute($params);

    // jika query simpan berhasil, maka user sudah terdaftar
    // maka alihkan ke halaman login
    if($saved) header("Location: login.php");
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
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
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
          <div class="form-group" action>

                <input class="form-control" type="text" name="name" placeholder="Nama kamu" />
            </div>

            <div class="form-group">

                <input class="form-control" type="text" name="username" placeholder="Username" />
            </div>

            <div class="form-group">

                <input class="form-control" type="email" name="email" placeholder="Alamat Email" />
            </div>

            <div class="form-group">

                <input class="form-control" type="password" name="password" placeholder="Password" />
            </div>

            <button class="btn btn-success btn-block" name="register">Daftar</button>
          <!-- <span>atau gunakan akun Anda</span>
          <div class="social-container">
            <a href="#" class="social"
              ><i class="fa-brands fa-facebook-f"></i
            ></a>
            <a href="#" class="social"><i class="fa-brands fa-google"></i></a>
            <a href="#" class="social"><i class="fa-brands fa-tiktok"></i></a>
          </div> -->
        </form>
      </div>

      <div class="form-container login-container">
        <form class="form-lg" action="" method="post">
          <h1>Masuk di sini</h1>
          <div class="form-control2">

          <input class="form-control" type="text" name="username" placeholder="Username atau email" />
            <small class="email-error-2"></small>
            <span></span>
          </div>
          <div class="form-control2">

          <input class="form-control" type="password" name="password" placeholder="Password" />
            <small class="password-error-2"></small>
            <span></span>
          </div>

          <!-- <div class="content">
            <div class="checkbox">
              <input type="checkbox" name="checkbox" id="checkbox" />
              <label for="">Ingat</label>
            </div>
            <div class="pass-link">
              <a href="#">Lupa kata sandi Anda?</a>
            </div>
          </div> -->
          <button class="btn btn-success btn-block" name="index">Login</button>
          <!-- <span>Atau gunakan akun Anda</span>
          <div class="social-container">
            <a href="#" class="social"
              ><i class="fa-brands fa-facebook-f"></i
            ></a>
            <a href="#" class="social"><i class="fa-brands fa-google"></i></a>
            <a href="#" class="social"><i class="fa-brands fa-tiktok"></i></a>
          </div> -->
        </form>
      </div>

      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-left">
            <h1 class="title">
              Halo <br />
              Teman Teman!
            </h1>
            <p>Jika Anda memiliki akun, masuk di sini</p>
            <button class="ghost" id="login">
              Login
              <i class="fa-solid fa-arrow-left"></i>
            </button>
          </div>

          <div class="overlay-panel overlay-right">
            <h1 class="title">
              Silahkan Login<br />

            </h1>
            <p>
              Jika belum memiliki akun Silahkan Registrasi
            </p>
            <button class="ghost" id="register">
              Register
              <i class="fa-solid fa-arrow-right"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script > // Animations
const registerButton = document.getElementById("register");
const indexButton = document.getElementById("index");
const loginButton = document.getElementById("login");
const container = document.getElementById("container");

registerButton.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

loginButton.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});</script>
</html>
