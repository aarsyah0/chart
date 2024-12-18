<?php
session_start();
if (!isset($_SESSION["user"])) {
    header("Location: ../login.php");
    exit;
}

$user = $_SESSION["user"];
$user_id = $user['user_id'];
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

		</nav>
		<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>Product</h1>
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
		<!-- End Header/Navigation -->

		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>Product</h1>
							</div>
						</div>
						<div class="col-lg-7">

						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->



        <div class="untree_co-section product-section before-footer-section">
    <div class="container">
    <div class="row">
  <?php
  include('../koneksi/koneksi.php');
  $sql = "SELECT * FROM products";
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
          echo '<div class="col-12 col-md-4 col-lg-3 mb-5">';
          echo '<a class="product-item" href="#">';
          echo '<img src="../images/' . $row['image_url'] . '" class="img-fluid product-thumbnail">';
          echo '<h3 class="product-title">' . $row['jenis'] . '</h3>';
          echo '<strong class="product-price">Rp.' . $row['harga'] . '</strong>';
          echo '</a>';
          echo '<button class="btn btn-primary btn-block mt-2 add-to-cart" data-id="' . $row['id'] . '">Add to Cart</button>';
          echo '</div>';
      }
  } else {
      echo '<p>Tidak ada produk yang tersedia.</p>';
  }
  $conn->close();
  ?>
</div>

    </div>
  </div>


		<!-- Start Footer Section -->
		<footer class="footer-section">
			<div class="container relative">

				<div class="row g-5 mb-5">
					<div class="col-lg-4">
						<div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">Kartini Shop<span>.</span></a></div>
						<p class="mb-4">Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant</p>

						<ul class="list-unstyled custom-social">
							<li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
							<li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
							<li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
							<li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
						</ul>
					</div>

					<div class="col-lg-8">
						<div class="row links-wrap">
							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">About us</a></li>
									<li><a href="#">Services</a></li>
									<li><a href="#">Blog</a></li>
									<li><a href="#">Contact us</a></li>
								</ul>
							</div>

							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">Support</a></li>
									<li><a href="#">Knowledge base</a></li>
									<li><a href="#">Live chat</a></li>
								</ul>
							</div>

							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">Jobs</a></li>
									<li><a href="#">Our team</a></li>
									<li><a href="#">Leadership</a></li>
									<li><a href="#">Privacy Policy</a></li>
								</ul>
							</div>

							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">Nordic Chair</a></li>
									<li><a href="#">Kruzo Aero</a></li>
									<li><a href="#">Ergonomic Chair</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>

				<div class="border-top copyright">
					<div class="row pt-4">
						<div class="col-lg-6">
							<p class="mb-2 text-center text-lg-start">Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a>  Distributed By <a href="https://themewagon.com">ThemeWagon</a> <!-- License information: https://untree.co/license/ -->
            </p>
						</div>

						<div class="col-lg-6 text-center text-lg-end">
							<ul class="list-unstyled d-inline-flex ms-auto">
								<li class="me-4"><a href="#">Terms &amp; Conditions</a></li>
								<li><a href="#">Privacy Policy</a></li>
							</ul>
						</div>

					</div>
				</div>

			</div>
		</footer>
		<!-- End Footer Section -->


		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/tiny-slider.js"></script>
		<script src="js/custom.js"></script>
        <!-- untuk mengatur button add cart dan diarahkan ke add cart  -->
        <script>
 document.addEventListener('DOMContentLoaded', () => {
  const buttons = document.querySelectorAll('.add-to-cart');
  buttons.forEach(button => {
    button.addEventListener('click', () => {
      const productId = button.getAttribute('data-id');

      fetch('add_to_cart.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ product_id: productId })
      })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          alert(data.message);
        } else {
          alert(`Gagal: ${data.message}`);
        }
      })
      .catch(error => console.error('Error:', error));
    });
  });
});


</script>

	</body>

</html>
