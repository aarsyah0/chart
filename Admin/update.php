<?php
include 'koneksi/koneksi.php';

// Ambil data berdasarkan ID
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Validasi ID
    if (!is_numeric($id)) {
        die("ID tidak valid!");
    }

    $sqlGet = "SELECT * FROM products WHERE id = $id";
    $result = $conn->query($sqlGet);

    if ($result->num_rows === 0) {
        die("Data tidak ditemukan!");
    }

    $data = $result->fetch_assoc();
} else {
    die("ID tidak diberikan!");
}
?>

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $jenis = $_POST['jenis'];
    $deskripsi = $_POST['deskripsi'];
    $harga = $_POST['harga'];
    $stok = $_POST['stok'];
    $kategori = $_POST['kategori'];

    // Ambil URL gambar lama untuk fallback
    $sqlGetImage = "SELECT image_url FROM products WHERE id = $id";
    $result = $conn->query($sqlGetImage);
    $row = $result->fetch_assoc();
    $image_url = $row['image_url'];

  // Proses upload gambar jika ada
if (isset($_FILES['image']) && $_FILES['image']['error'] === 0) {
    $targetDir = "images/";
    
    // Pastikan direktori uploads/ ada
    if (!file_exists($targetDir)) {
        if (!mkdir($targetDir, 0777, true)) {
            die("Direktori tujuan tidak ditemukan dan gagal membuatnya: $targetDir");
        }
    }

    $targetFile = $targetDir . basename($_FILES['image']['name']);
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Validasi file gambar
    $allowedTypes = ['jpg', 'jpeg', 'png'];
    if (!in_array($imageFileType, $allowedTypes)) {
        die("Format file tidak diperbolehkan! Hanya JPG, JPEG, dan PNG.");
    }

    if (!is_writable($targetDir)) {
        die("Direktori tujuan tidak memiliki izin tulis: $targetDir");
    }

    // Coba untuk memindahkan file gambar ke direktori tujuan
    if (move_uploaded_file($_FILES['image']['tmp_name'], $targetFile)) {
        $image_url = $targetFile; // Ganti dengan gambar baru
    } else {
        die("Gagal mengunggah gambar dari {$_FILES['image']['tmp_name']} ke $targetFile");
    }
}


    // Query update
    $sqlUpdate = "UPDATE products SET 
                  jenis = ?, 
                  deskripsi = ?, 
                  harga = ?, 
                  stok = ?, 
                  kategori = ?, 
                  image_url = ? 
                  WHERE id = ?";
    $stmt = $conn->prepare($sqlUpdate);
    $stmt->bind_param("ssdissi", $jenis, $deskripsi, $harga, $stok, $kategori, $image_url, $id);

    if ($stmt->execute()) {
        echo "<script>alert('Data berhasil diubah!'); window.location='data_galon.php';</script>";
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
    <title>Update Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="w-50 mx-auto border p-3 mt-5">
    <a href="data_galon.php" class="btn btn-primary btn-md mb-3" class="">Kembali Ke Home</a>
        <h3>Update Data Produk</h3>
        <form action="" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<?= $data['id'] ?>">

            <select name="jenis" id="jenis" aria-placeholder="Jenis" class="form-select">
                <option>Pilih jenis</option>
                <option value="Gas_elpiji_3kg" <?= $data['jenis'] == 'Gas_elpiji_3kg' ? 'selected' : '' ?>>Gas Elpiji 3Kg</option>
                <option value="Tabung_+_Gas_Elpiji_3Kg" <?= $data['jenis'] == 'Tabung_+_Gas_Elpiji_3Kg' ? 'selected' : '' ?>>Tabung + Gas Elpiji 3Kg</option>
                <option value="Air_Mineral_Aqua_galon_19L" <?= $data['jenis'] == 'Air_Mineral_Aqua_galon_19L' ? 'selected' : '' ?>>Air Mineral Aqua galon 19L</option>
                <option value="Air_Mineral_Aqua_galon_19L_+_Galon" <?= $data['jenis'] == 'Air_Mineral_Aqua_galon_19L_+_Galon' ? 'selected' : '' ?>>Air Mineral Aqua galon 19L + Galon</option>
                <option value="Air_Mineral_Galon_Le_Minerale_19L" <?= $data['jenis'] == 'Air_Mineral_Galon_Le_Minerale_19L' ? 'selected' : '' ?>>Air Mineral Galon Le Minerale 19L</option>
                <option value="Air_Mineral_Galon_Cleo_19L" <?= $data['jenis'] == 'Air_Mineral_Galon_Cleo_19L' ? 'selected' : '' ?>>Air Mineral Galon Cleo 19L</option>
                <option value="Air_mineral_Aqua_Karton_600ml" <?= $data['jenis'] == 'Air_mineral_Aqua_Karton_600ml' ? 'selected' : '' ?>>Air mineral Aqua Karton 600ml</option>
                <option value="Air_mineral_Aqua_Karton_1,5L" <?= $data['jenis'] == 'Air_mineral_Aqua_Karton_1,5L' ? 'selected' : '' ?>>Air mineral Aqua Karton 1,5 L</option>
                <option value="Air_mineral_Le_Minerale_Karton_1,5L" <?= $data['jenis'] == 'Air_mineral_Le_Minerale_Karton_1,5L' ? 'selected' : '' ?>>Air mineral Le Minerale Karton 1,5L</option>
            </select>



            <label for="deskripsi">Deskripsi</label>
            <input type="text" id="deskripsi" name="deskripsi" class="form-control" value="<?= $data['deskripsi'] ?>" required>

            <label for="harga">Harga</label>
            <input type="number" id="harga" name="harga" class="form-control" value="<?= $data['harga'] ?>" required>

            <label for="stok">Stok</label>
            <input type="number" id="stok" name="stok" class="form-control" value="<?= $data['stok'] ?>" required>

            <label for="kategori">Kategori</label>
            <select id="kategori" name="kategori" class="form-control" required>
                <option value="">Pilih Kategori</option>
                <?php
                // Ambil data kategori
                $sql = "SELECT category_id, category_name FROM categories"; // Query untuk mengambil data kategori
                $result = $conn->query($sql);

                if (!$result) {
                    die("Query gagal: " . $conn->error); // Menampilkan pesan error jika query gagal
                }

                if ($result->num_rows > 0) {
                    // Loop data kategori dan tambahkan ke dalam opsi
                    while ($row = $result->fetch_assoc()) {
                        // Tambahkan atribut 'selected' jika kategori sesuai dengan data dari database
                        $selected = $data['kategori'] == $row['category_id'] ? 'selected' : '';
                        echo "<option value='" . $row['category_id'] . "' $selected>" . $row['category_name'] . "</option>";
                    }
                } else {
                    echo "<option value=''>Tidak ada kategori</option>";
                }
                ?>
            </select>

            <label for="image">Gambar</label>
            <input type="file" id="image" name="image" class="form-control">
            <small>Gambar saat ini:</small><br>
            <img src="<?= $data['image_url'] ?>" alt="Gambar Produk" width="100"><br>

            <button type="submit" class="btn btn-primary mt-3">Update</button>
        </form>
    </div>
</body>
</html>
