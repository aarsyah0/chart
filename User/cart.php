<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();

if (!isset($_SESSION["user"])) {
    header("Location: ../login.php");
}
// fungsi untuk menambahkan ke order
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
// aksi untuk melakukan checkout
if (isset($_GET['action']) && $_GET['action'] == 'checkout') {
    $query = "SELECT c.cart_id, p.id AS product_id, p.harga, c.quantity
              FROM cart c
              JOIN products p ON c.product_id = p.id
              WHERE c.user_id = ?";

    $stmt = $conn->prepare($query);
    if ($stmt === false) {
        die("Error preparing statement: " . $conn->error);
    }

    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $total_amount = 0;
    $order_items = [];
    while ($row = $result->fetch_assoc()) {
        $order_items[] = $row;
        $total_amount += $row['harga'] * $row['quantity'];
    }
    $order_query = "INSERT INTO orders (user_id, total_amount, status, order_date)
                    VALUES (?, ?, 'Pending', NOW())";
    $order_stmt = $conn->prepare($order_query);
    $order_stmt->bind_param("id", $user_id, $total_amount);
    $order_stmt->execute();
    $order_id = $conn->insert_id;
    foreach ($order_items as $item) {
        $order_item_query = "INSERT INTO order_items (order_id, product_id, quantity)
                             VALUES (?, ?, ?)";
        $order_item_stmt = $conn->prepare($order_item_query);
        $order_item_stmt->bind_param("iii", $order_id, $item['product_id'], $item['quantity']);
        $order_item_stmt->execute();
    }

    $delete_query = "DELETE FROM cart WHERE user_id = ?";
    $delete_stmt = $conn->prepare($delete_query);
    $delete_stmt->bind_param("i", $user_id);
    $delete_stmt->execute();

    header("Location: checkout_success.php?order_id=" . $order_id);
    exit;
}
// untuk update pesanan di cart
if (isset($_POST['update_cart'])) {
    $cart_id = $_POST['cart_id'];
    $new_quantity = $_POST['quantity'];
    $update_query = "UPDATE cart SET quantity = ? WHERE cart_id = ?";
    $stmt = $conn->prepare($update_query);
    $stmt->bind_param("ii", $new_quantity, $cart_id);
    $stmt->execute();
    header("Location: cart.php");
    exit;
}

if (isset($_GET['remove'])) {
    $cart_id = $_GET['remove'];
    $delete_query = "DELETE FROM cart WHERE cart_id = ?";
    $stmt = $conn->prepare($delete_query);
    $stmt->bind_param("i", $cart_id);
    $stmt->execute();
    header("Location: cart.php");
    exit;
}

$query = "SELECT c.cart_id, p.jenis, p.harga, c.quantity, p.image_url
          FROM cart c
          JOIN products p ON c.product_id = p.id
          WHERE c.user_id = ?";
$stmt = $conn->prepare($query);
if ($stmt === false) {
    die("Error preparing statement: " . $conn->error);
}

$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
if ($result === false) {
    die("Error executing query: " . $stmt->error);
}

$cart_items = [];
while ($row = $result->fetch_assoc()) {
    $cart_items[] = $row;
}
$stmt->close();
$conn->close();
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Untree.co">
    <link rel="shortcut icon" href="../images/pickup.png">
    <title>Keranjang Belanja</title>
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

    <!-- Start Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="intro-excerpt">
                        <h1>Cart</h1>
                        <p class="mb-4">Toko kami menyediakan kebutuhan air dan gas elpiji anda <br> Khususnya untuk daerah Kota Mojokerto dan sekitarnya</p>
                        <p><a href="" class="btn btn-secondary me-2">Shop Now</a><a href="#" class="btn btn-white-outline">Explore</a></p>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="hero-img-wrap">
                        <img src="../images/pickup.png" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->

    <div class="untree_co-section before-footer-section">
        <div class="container">
            <div class="row mb-5">
                <form class="col-md-12" method="post">
                    <div class="site-blocks-table">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Image</th>
                                    <th class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-total">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $total_price = 0;
                                foreach ($cart_items as $item):
                                    $total_item = $item['harga'] * $item['quantity'];
                                    $total_price += $total_item;
                                ?>
                                    <tr>
                                        <td class="product-thumbnail">
                                            <img src="../images/<?php echo $item['image_url']; ?>" alt="Image" class="img-fluid">
                                        </td>
                                        <td class="product-name">
                                            <h2 class="h5 text-black"><?php echo $item['jenis']; ?></h2>
                                        </td>
                                        <td class="product-price"><?php echo number_format($item['harga'], 0, ',', '.'); ?> IDR</td>
                                        <td class="product-quantity">
                                            <form action="cart.php" method="POST">
                                                <input type="hidden" name="cart_id" value="<?php echo $item['cart_id']; ?>">
                                                <input type="number" name="quantity" value="<?php echo $item['quantity']; ?>" min="1" class="form-control" style="width: 60px;">
                                                <button type="submit" name="update_cart" class="btn btn-primary">Update</button>
                                            </form>
                                        </td>
                                        <td class="product-total"><?php echo number_format($total_item, 0, ',', '.'); ?> IDR</td>
                                        <td class="product-remove">
                                            <a href="cart.php?remove=<?php echo $item['cart_id']; ?>" class="btn btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <a href="product.php" class="btn btn-outline-primary">Continue Shopping</a>
                        </div>
                        <div class="col-md-6 text-md-end">
                            <p class="h4">Total: <?php echo number_format($total_price, 0, ',', '.'); ?> IDR</p>
                            <a href="cart.php?action=checkout" class="btn btn-primary">Checkout</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <footer class="site-footer border-top">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-12 text-center">
                    <p>Galon Super &copy; 2024</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>
