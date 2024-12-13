<?php
include 'koneksi/koneksi.php';

// Cek apakah ID ada di URL
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Validasi ID untuk memastikan itu angka
    if (!is_numeric($id)) {
        die("ID tidak valid!");
    }

    // Step 1: Update user_id di orders menjadi NULL (jika foreign key memungkinkan NULL)
    $updateOrders = "UPDATE orders SET user_id = NULL WHERE user_id = ?";
    $stmtOrders = $conn->prepare($updateOrders);
    $stmtOrders->bind_param("i", $id);
    $stmtOrders->execute();

    // Step 2: Hapus pengguna setelah user_id di orders diubah
    $sql = "DELETE FROM users WHERE user_id = ?";
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die("Error preparing statement: " . $conn->error);
    }

    // Bind parameter dan eksekusi statement
    $stmt->bind_param("i", $id);  // "i" untuk integer
    if ($stmt->execute()) {
        echo "<script>alert('Data berhasil dihapus!'); window.location='data_user.php';</script>";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Tutup statement
    $stmtOrders->close();
    $stmt->close();
} else {
    die("ID tidak diberikan!");
}
?>
