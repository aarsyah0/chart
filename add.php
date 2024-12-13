<?php
  include 'koneksi/koneksi.php'

?>

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $jenis = $_POST['jenis'];
    $deskripsi = $_POST['deskripsi'];
    $harga = $_POST['harga'];
    $stok = $_POST['stok'];
    $kategori = $_POST['kategori'];
    
    // Proses upload gambar
    $image_url = '';
    if (isset($_FILES['image']) && $_FILES['image']['error'] === 0) {
        $image_url = "uploads/" . basename($_FILES['image']['name']);
        move_uploaded_file($_FILES['image']['tmp_name'], $image_url);
    }

    $sql = "INSERT INTO products (jenis, deskripsi, harga, stok, kategori, image_url) 
            VALUES ('$jenis', '$deskripsi', '$harga', '$stok', '$kategori', '$image_url')";
    
    if ($conn->query($sql) === TRUE) {
        echo "Data berhasil ditambahkan!";
    } else {
        echo "Error: " . $conn->error;
    }
    header("location: data_galon.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Data Galon</title>
</head>
<body>
    <div class="w-50 mx-auto border p-3 mt-5">
        <a href="data_galon.php" class="btn btn-primary btn-md mb-3" class="">Kembali Ke Home</a>
        <form action="" method="POST" enctype="multipart/form-data">
            <label for="id">id</label>
            <input type="text" id="id" name="id" placeholder="id" class="form-control" required>

            <label for="jenis">Jenis</label>
            <select name="jenis" id="jenis" aria-placeholder="Jenis" class="form-select">
                <option >Pilih jenis</option>
                <option value="Gas_elpiji_3kg">Gas Elpiji 3Kg</option>
                <option value="Tabung_+_Gas_Elpiji_3Kg">Tabung + Gas Elpiji 3Kg</option>
                <option value="Air_Mineral_Aqua_galon_19L">Air Mineral Aqua galon 19L</option>
                <option value="Air_Mineral_Aqua_galon_19L_+_Galon">Air Mineral Aqua galon 19L + Galon</option>
                <option value="Air_Mineral_Galon_Le_Minerale_19L">Air Mineral Galon Le Minerale 19L</option>
                <option value="Air_Mineral_Galon_Cleo_19L">Air Mineral Galon Cleo 19L</option>
                <option value="Air_mineral_Aqua_Karton_600ml">Air mineral Aqua Karton 600ml</option>
                <option value="Air_mineral_Aqua_Karton_1,5L">Air mineral Aqua Karton 1,5 L</option>
                <option value="Air_mineral_Le_Minerale_Karton_1,5L">Air mineral Le Minerale Karton 1,5L</option>
            </select>
           
            <label for="deskripsi">Deskripsi</label>
            <input type="text" id="deskripsi" name="deskripsi" placeholder="Deskripsi" class="form-control" required>

            <label for="harga">Harga</label>
            <input type="number" id="harga" name="harga" placeholder="Harga" class="form-control" required>

            <label for="stok">Stok</label>
            <input type="number" id="stok" name="stok" placeholder="Stok" class="form-control" required>

            <label for="id">Kategori</label>
            <select id="kategori" name="kategori" class="form-control" required>
                <option value="">Pilih Kategori</option>
                <?php

                // Ambil data kategori
                $sql = "SELECT category_id, category_name FROM categories"; // Pastikan product_name tabel benar
                $result = $conn->query($sql);

                if (!$result) {
                    die("Query gagal: " . $conn->error); // Menampilkan error jika query gagal
                }                

                if ($result->num_rows > 0) {
                    // Loop data kategori
                    while ($row = $result->fetch_assoc()) {
                        echo "<option value='" . $row['category_id'] . "'>" . $row['category_name'] . "</option>";
                    }
                } else {
                    echo "<option value=''>Tidak ada kategori</option>";
                }
                ?>
            </select>

            <label for="image_url">Image</label>
            <input type="file" id="image_url" name="image_url" class="form-control" required>
            
            <button class="btn btn-success mt-3" type="submit" name="tambah" value="Tambah Data">Tambah</button>
        </form>
    </div>
   
</body>
</html>