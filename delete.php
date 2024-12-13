<?php
include 'koneksi/koneksi.php';


if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "DELETE FROM products WHERE id=$id";
    
    if ($conn->query($sql) === TRUE) {
        echo "Data berhasil dihapus!";
    } else {
        echo "Error: " . $conn->error;
    }

    header("location: data_galon.php");
}
?>