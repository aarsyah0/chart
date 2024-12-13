<?php
include 'koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $order_id = $_POST['order_id'];
    $status = $_POST['status'];

    $sql = "UPDATE orders SET status = ? WHERE order_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('si', $status, $order_id);

    if ($stmt->execute()) {
        echo "<script>alert('Status berhasil diperbarui'); window.location.href='pengeluaran.php';</script>";
    } else {
        echo "<script>alert('Gagal memperbarui status'); window.location.href='pengeluaran.php';</script>";
    }

    $stmt->close();
    $conn->close();
}
?>
