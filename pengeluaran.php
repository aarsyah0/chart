<?php
include 'koneksi/koneksi.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Admin - Pengelolaan Pesanan</title>
    <link rel="stylesheet" href="css/style5.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #343a40;
            color: white;
            font-size: 16px;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }

        .table-hover tbody tr:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo"></div>
        <ul class="menu">
            <li><a href="timeline.php"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
            <li class="active"><a href="pengeluaran.php"><i class="fas fa-chart-bar"></i><span>Pengeluaran</span></a></li>
            <li><a href="data_user.php"><i class="fas fa-briefcase"></i><span>Data User</span></a></li>
            <li><a href="data_galon.php"><i class="fas fa-chart-bar"></i><span>Data Galon</span></a></li>
            <li><a href="settings.php"><i class="fas fa-cog"></i><span>Settings</span></a></li>
            <li><a href="index.php"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
        </ul>
    </div>

    <div class="main--content">
        <div class="header--wrapper">
            <div class="header--title">
                <span>Admin!</span>
                <h3><b>Pengelolaan Pesanan</b></h3>
            </div>
            <div class="user--info">
                <div class="search--box">
                    <i class="fa-solid fa-search"></i>
                    <input type="text" placeholder="Search">
                </div>
                <img src="admin.png" alt="">
            </div>
        </div>

        <div class="card--container">
            <div class="card--wrapper">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Nama Pemesan</th>
                            <th>Barang</th>
                            <th>Jumlah</th>
                            <th>Status</th>
                            <th>Total Harga</th>
                            <th>Tanggal Order</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    $sql = "SELECT o.order_id, u.name AS user_name, oi.quantity, o.status, o.total_amount, p.jenis AS product_name, o.order_date
                            FROM orders o
                            JOIN order_items oi ON o.order_id = oi.order_id
                            JOIN products p ON oi.product_id = p.id
                            JOIN users u ON o.user_id = u.user_id
                            ORDER BY o.order_date DESC";

                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr id='order-row-" . $row['order_id'] . "'>";
                            echo "<td>" . $row['user_name'] . "</td>";
                            echo "<td>" . $row['product_name'] . "</td>";
                            echo "<td>" . $row['quantity'] . "</td>";
                            echo "<td class='status-cell'>" . $row['status'] . "</td>";
                            echo "<td>Rp " . number_format($row['total_amount'], 2, ',', '.') . "</td>";
                            echo "<td>" . $row['order_date'] . "</td>";
                            echo "<td>";
                            echo "<form action='update_status.php' method='POST'>";
                            echo "<input type='hidden' name='order_id' value='" . $row['order_id'] . "'>";
                            echo "<select name='status'>";
                            echo "<option value='Pending' " . ($row['status'] == 'Pending' ? 'selected' : '') . ">Pending</option>";
                            echo "<option value='Completed' " . ($row['status'] == 'Completed' ? 'selected' : '') . ">Completed</option>";
                            echo "<option value='Cancelled' " . ($row['status'] == 'Cancelled' ? 'selected' : '') . ">Cancelled</option>";
                            echo "</select>";
                            echo "<button type='submit' class='btn btn-primary btn-sm'>Update</button>";
                            echo "</form>";
                            echo "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='7'>No orders found</td></tr>";
                    }

                    $conn->close();
                    ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
