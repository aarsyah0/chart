<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();

if (!isset($_SESSION["user"])) {
    header("Location: ../login.php");
    exit;
}

$user = $_SESSION["user"];
$user_id = $user['user_id'];

$host = 'localhost';
$username = 'root';
$password = '';
$dbname = 'project_wsi';

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

$order_id = isset($_GET['order_id']) ? $_GET['order_id'] : null;

if ($order_id) {
    $query = "SELECT o.order_id, o.total_amount, o.status, o.order_date,
                 p.jenis, p.harga, oi.quantity, p.image_url
          FROM orders o
          JOIN order_items oi ON o.order_id = oi.order_id
          JOIN products p ON oi.product_id = p.id
          WHERE o.order_id = ? AND o.user_id = ?";
    $stmt = $conn->prepare($query);
    if ($stmt === false) {
        die("Error preparing statement: " . $conn->error);
    }
    $stmt->bind_param("ii", $order_id, $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $order_details = [];
        while ($row = $result->fetch_assoc()) {
            $order_details[] = $row;
        }
    } else {
        die("Order tidak ditemukan atau Anda tidak berhak melihat pesanan ini.");
    }

    $stmt->close();
} else {
    die("Order ID tidak valid.");
}

$conn->close();
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Untree.co">
    <link rel="shortcut icon" href="../images/pickup.png">
    <title>Checkout Success</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="custom-navbar navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="../index.php">Galon Super<span>.</span></a>
            <div class="collapse navbar-collapse" id="navbarsFurni">
                <ul class="navbar-nav ms-auto mb-2 mb-md-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="../index.php">Home</a>
                    </li>
                    <li><a class="nav-link" href="product.php">Product</a></li>
                    <li><a class="nav-link" href="about.php">About us</a></li>
                    <li><a class="nav-link" href="services.php">Services</a></li>
                    <li><a class="nav-link" href="contact.php">Contact us</a></li>
                </ul>
                <ul class="navbar-nav mb-2 mb-md-0 ms-5">
                    <li><a class="nav-link" href="cart.php"><img src="../images/cart.svg"></a></li>
                    <li><a class="nav-link" href="../logout.php">Logout (<?php echo $user['username']; ?>)</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="untree_co-section before-footer-section">
        <div class="container">
            <h1 class="mb-5">Checkout Success</h1>
            <p>Terima kasih telah berbelanja! Berikut adalah detail pesanan Anda:</p>

            <div class="order-details">
                <h3>Order ID: <?php echo $order_id; ?></h3>
                <p>Status Pesanan: <?php echo ucfirst($order_details[0]['status']); ?></p>
                <p>Total Pembayaran: Rp.<?php echo number_format($order_details[0]['total_amount'], 2, ',', '.'); ?></p>
                <p>Tanggal Pemesanan: <?php echo date('d-m-Y H:i:s', strtotime($order_details[0]['order_date'])); ?></p>

                <h4>Detail Produk:</h4>
                <table class="table">
                    <thead>
                        <tr>
                            <th class="product-thumbnail">Image</th>
                            <th class="product-name">Product</th>
                            <th class="product-price">Price</th>
                            <th class="product-quantity">Quantity</th>
                            <th class="product-total">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($order_details as $item): ?>
                            <tr>
                            <td class="product-thumbnail">
    <img src="../images/<?php echo $item['image_url']; ?>" alt="Image" class="img-fluid">
</td>

                                <td class="product-name">
                                    <h2 class="h5 text-black"><?php echo $item['jenis']; ?></h2>
                                </td>
                                <td>Rp.<?php echo number_format($item['harga'], 2, ',', '.'); ?></td>
                                <td><?php echo $item['quantity']; ?></td>
                                <td>Rp.<?php echo number_format($item['harga'] * $item['quantity'], 2, ',', '.'); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

            <p><a href="../index.php" class="btn btn-primary btn-lg py-3 btn-block">Back to Home</a></p>
        </div>
    </div>

    <script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>
