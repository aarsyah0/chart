<?php
include 'koneksi/koneksi.php';

// Ambil data berdasarkan ID
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Validasi ID
    if (!is_numeric($id)) {
        die("ID tidak valid!");
    }

    // Perbaiki query dengan pengecekan error (pastikan kolom yang digunakan benar)
    $sqlGet = "SELECT * FROM users WHERE user_id = $id";  // Ganti 'id' dengan 'user_id' jika perlu
    $result = $conn->query($sqlGet);

    if (!$result) {
        die("Query gagal: " . $conn->error);  // Menampilkan error query jika ada masalah
    }

    if ($result->num_rows === 0) {
        die("Data tidak ditemukan!");
    }

    $data = $result->fetch_assoc();
} else {
    die("ID tidak diberikan!");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $username = $_POST['username'];
    $email = $_POST['email'];
    $level = $_POST['level'];
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];

    // Query update (pastikan kolom yang digunakan benar)
    $sqlUpdate = "UPDATE users SET 
                  username = ?, 
                  email = ?, 
                  level = ?, 
                  name = ?, 
                  phone = ?, 
                  address = ? 
                  WHERE user_id = ?";  // Ganti 'id' dengan 'user_id' jika perlu
    $stmt = $conn->prepare($sqlUpdate);

    if ($stmt === false) {
        die("Error preparing statement: " . $conn->error);  // Menampilkan error jika statement gagal disiapkan
    }

    $stmt->bind_param("ssssssi", $username, $email, $level, $name, $phone, $address, $id);

    if ($stmt->execute()) {
        echo "<script>alert('Data berhasil diubah!'); window.location='data_user.php';</script>";
    } else {
        echo "Error: " . $stmt->error;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="w-50 mx-auto border p-3 mt-5">
    <a href="data_user.php" class="btn btn-primary btn-md mb-3" class="">Kembali Ke Home</a>
        <h3>Update Data User</h3>
        <form action="" method="POST">
            <input type="hidden" name="id" value="<?= htmlspecialchars($data['user_id']) ?>"> <!-- Pastikan menggunakan kolom yang benar -->

            <label for="username">Username</label>
            <input type="text" id="username" name="username" class="form-control" value="<?= htmlspecialchars($data['username']) ?>" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="form-control" value="<?= htmlspecialchars($data['email']) ?>" required>

            <label for="level">Level</label>
            <input type="text" id="level" name="level" class="form-control" value="<?= htmlspecialchars($data['level']) ?>" required>

            <label for="name">Nama</label>
            <input type="text" id="name" name="name" class="form-control" value="<?= htmlspecialchars($data['name']) ?>" required>

            <label for="phone">Telepon</label>
            <input type="text" id="phone" name="phone" class="form-control" value="<?= htmlspecialchars($data['phone']) ?>" required>

            <label for="address">Alamat</label>
            <input type="text" id="address" name="address" class="form-control" value="<?= htmlspecialchars($data['address']) ?>" required>

            <button type="submit" class="btn btn-primary mt-3">Update</button>
        </form>
    </div>
</body>
</html>
