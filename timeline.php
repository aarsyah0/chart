<?php
require_once("koneksi/koneksi.php"); ?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard Admin</title>
    <link rel="stylesheet" href="css/style2.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
        <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  </head>
  <body>
    <div class="sidebar">
      <div class="logo"></div>
      <ul class="menu">
        <li i0i class="active">
          <a href="timeline.php">
            <i class="fas fa-tachometer-alt"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <li>
          <a href="pengeluaran.php">
            <i class="fas fa-chart-bar"></i>
            <span>Pengeluaran</span>
          </a>
        </li>
        <li>
          <a href="data_user.php">
            <i class="fas fa-briefcase"></i>
            <span>Data User</span>
          </a>
        </li>
        <li>
          <a href="data_galon.php">
            <i class="fas fa-chart-bar"></i>
            <span>Products</span>
          </a>
        </li>
        <li>
          <a href="Settings.html">
            <i class="fas fa-cog"></i>
            <span>Settings</span>
          </a>
        </li>
        <li>
          <a href="logout.php">
            <i class="fas fa-sign-out-alt"></i>
            <span>Logout</span>
          </a>
        </li>
      </ul>
    </div>

    <div class="main--content">
      <div class="header--wrapper">
        <div class="header--title">
          <span>Admin!</span>
          <h2>Dashboard</h2>
        </div>
        <div class="user--info">
          <div class="search--box">
            <i class="fa-solid fa-search"></i>
            <input type="text" placeholder="Search" />
          </div>
          <img src="admin.png" alt="" />
        </div>
      </div>
      <div class="card--container">
        <div class="card--wrapper"></div>

      <div class="card-container"></div>
        <h3 class="main--title">Data Hari ini</h3>
        <div class="card--wrapper">
          <div class="payment--card light-red">
            <div class="card--header">
              <div class="amount">
                <span class="title">
                jumlah pembayaran</span>
                <span class="amount--value">Rp.000.000.00</span>
              </div>
              <i class="fas fa-dollar-sign icon"></i>
            </div>
            <span class="card-detail">**** **** **** 0811</span>
          </div>

          <!-- batas -->

          <div class="payment--card light-yellow">
            <div class="card--header">
              <div class="amount">
                <span class="title">
                jumlah pembayaran</span>
                <span class="amount--value">Rp.000.000.00</span>
              </div>
              <i class="fas fa-list icon dark-purple"></i>
            </div>
            <span class="card-detail">**** **** **** 5093</span>
          </div>

          <!-- batas -->

          <div class="payment--card light-green">
            <div class="card--header">
              <div class="amount">
                <span class="title">
                jumlah pembayaran</span>
                <span class="amount--value">Rp.000.000.00</span>
              </div>
              <i class="fas fa-list icon dark-blue"></i>
            </div>
            <span class="card-detail">**** **** **** 5093</span>
          </div>

          <!-- batas -->

          <div class="payment--card light-blue">
            <div class="card--header">
              <div class="amount">
                <span class="title">
                jumlah pembayaran</span>
                <span class="amount--value">Rp.000.000.00</span>
              </div>
              <i class="fas fa-list icon dark-ocean"></i>
            </div>
            <span class="card-detail">**** **** **** 5093</span>
          </div>

    <!-- Awal Grafik -->

    <div class="chart-container">
    <div class="chart-left">
      <!-- Line Chart -->
      <div class="chart">
        <canvas id="lineChart"></canvas>
      </div>
      <!-- Bar Chart -->
      <div class="chart">
        <canvas id="barChart"></canvas>
      </div>
    </div>

    <div class="chart-right">
      <!-- Pie Chart -->
      <canvas id="pieChart"></canvas>
    </div>
  </div>

  <script>
    // Data penjualan galon selama 3 tahun
    const labels = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];

    const data2021 = [100, 120, 150, 140, 130, 160, 170, 180, 200, 210, 220, 230];
    const data2022 = [130, 140, 160, 150, 140, 170, 180, 190, 210, 220, 230, 240];
    const data2023 = [140, 150, 170, 160, 150, 180, 190, 200, 220, 230, 240, 250];

    // LINE CHART
    const ctxLine = document.getElementById('lineChart').getContext('2d');
    const lineChart = new Chart(ctxLine, {
      type: 'line',
      data: {
        labels: labels, // Label bulan
        datasets: [
          {
            label: 'Penjualan Galon 2021',
            data: data2021,
            borderColor: 'rgba(75, 192, 192, 1)', // Warna garis
            backgroundColor: 'rgba(75, 192, 192, 0.2)', // Warna latar belakang area
            borderWidth: 2
          },
          {
            label: 'Penjualan Galon 2022',
            data: data2022,
            borderColor: 'rgba(153, 102, 255, 1)',
            backgroundColor: 'rgba(153, 102, 255, 0.2)',
            borderWidth: 2
          },
          {
            label: 'Penjualan Galon 2023',
            data: data2023,
            borderColor: 'rgba(255, 159, 64, 1)',
            backgroundColor: 'rgba(255, 159, 64, 0.2)',
            borderWidth: 2
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Penjualan Galon selama 3 Tahun (2021-2023)'
          }
        }
      }
    });

    // BAR CHART
    const ctxBar = document.getElementById('barChart').getContext('2d');
    const barChart = new Chart(ctxBar, {
      type: 'bar',
      data: {
        labels: labels, // Label bulan
        datasets: [
          {
            label: 'Penjualan Galon 2021',
            data: data2021,
            backgroundColor: 'rgba(75, 192, 192, 0.7)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
          },
          {
            label: 'Penjualan Galon 2022',
            data: data2022,
            backgroundColor: 'rgba(153, 102, 255, 0.7)',
            borderColor: 'rgba(153, 102, 255, 1)',
            borderWidth: 1
          },
          {
            label: 'Penjualan Galon 2023',
            data: data2023,
            backgroundColor: 'rgba(255, 159, 64, 0.7)',
            borderColor: 'rgba(255, 159, 64, 1)',
            borderWidth: 1
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Penjualan Galon selama 3 Tahun (Bar Chart)'
          }
        }
      }
    });

    // PIE CHART
    const total2021 = data2021.reduce((a, b) => a + b, 0);
    const total2022 = data2022.reduce((a, b) => a + b, 0);
    const total2023 = data2023.reduce((a, b) => a + b, 0);

    const ctxPie = document.getElementById('pieChart').getContext('2d');
    const pieChart = new Chart(ctxPie, {
      type: 'pie',
      data: {
        labels: ['2021', '2022', '2023'],
        datasets: [{
          data: [total2021, total2022, total2023],
          backgroundColor: ['rgba(75, 192, 192, 0.7)', 'rgba(153, 102, 255, 0.7)', 'rgba(255, 159, 64, 0.7)'],
          borderColor: ['rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)'],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          title: {
            display: true,
            text: 'Total Penjualan Galon per Tahun (Pie Chart)'
          }
        }
      }
    });
  </script>


      <!-- Akhir Grafik -->


        </div>
        </div>
      </div>
    </div>
  </body>
  <style>
    .chart-container {
      display: flex;
      justify-content: space-between;
      margin: 20px auto;
      padding: 20px;
      width: 90%;
    }

    .chart-left {
      display: flex;
      flex-direction: column;
      justify-content: space-around;
      width: 60%; /* Lebar kontainer untuk line chart dan bar chart */
    }

    .chart-right {
      width: 35%; /* Lebar kontainer untuk pie chart */
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .chart {
      height: 250px; /* Ukuran tinggi sedang */
      margin-bottom: 10px;
    }

    canvas {
      width: 100% !important;
      height: 100% !important;
    }
  </style>
</html>
