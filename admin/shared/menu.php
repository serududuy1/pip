<?php if ($_GET['module']=='home'){ ?>
<li class="active">
<?php } else { ?>
<li>
<?php } ?>
  <a href="?module=home"><i class="fa fa-home"></i> <span>Beranda</span></a>
</li>
<?php if ($_SESSION['level']=='admin') { ?>

  <li>
  <a href=""><i class="fa fa-file"></i> <span>Modul Transaksi</span></a>
  <ul class="sub-menu">
    <?php if ($_GET['module']=='invoicebooking'){ ?>
    <li class="active">
    <?php } else { ?>
    <li>
    <?php } ?>
    <a href="?module=invoicebooking">Konfirmasi Pesanan</a></li>

    <?php if ($_GET['module']=='invoicedone'){ ?>
    <li class="active">
    <?php } else { ?>
    <li>
    <?php } ?>
    <a href="?module=invoicedone">Selesai</a></li>

    <?php if ($_GET['module']=='invoicecancel'){ ?>
    <li class="active">
    <?php } else { ?>
    <li>
    <?php } ?>
    <a href="?module=invoicecancel">Cancel</a></li>
  </ul>
</li>

<li>
  <a href=""><i class="fa fa-users"></i> <span>Modul Pengguna</span></a>
  <ul class="sub-menu">

    <?php if ($_GET['module']=='profile'){ ?>
    <li class="active">
    <?php } else { ?>
    <li>
    <?php } ?>
    <a href="?module=profile">Akun Saya</a></li>

    <?php if ($_GET['module']=='guest'){ ?>
    <li class="active">
    <?php } else { ?>
    <li>
    <?php } ?>
    <a href="?module=guest">Tamu</a></li>

  </ul>
</li>
<li>
  <a href=""><i class="fa fa-building"></i> <span>Tambah Data</span></a>
  <ul class="sub-menu">

    <?php if ($_GET['module']=='room'){ ?>
    <li class="active">
    <?php } else { ?>
    <li>
    <?php } ?>
    <a href="?module=room">Kamar</a></li>

    <?php if ($_GET['module']=='roomtype'){ ?>
    <li class="active">
    <?php } else { ?>
    <li>
    <?php } ?>
    <a href="?module=roomtype">Tipe Kamar</a></li>

    <?php if ($_GET['module']=='facility'){ ?>
    <li class="active">
    <?php } else { ?>
    <li>
    <?php } ?>
    <a href="?module=facility">Fasilitas</a></li>

    <?php if ($_GET['module']=='bank'){ ?>
    <li class="active">
    <?php } else { ?>
    <li>
    <?php } ?>
    <a href="?module=bank">Bank</a></li>

  </ul>
</li>

<?php } ?>

<?php if ($_GET['module']=='laporan'){ ?>
<li class="active">
<?php } else { ?>
<li>
<?php } ?>
  <a href="?module=laporan"><i class="fa fa-file-o"></i> <span>Laporan</span></a>
</li>

<?php if ($_GET['module']=='logout'){ ?>
<li class="active">
<?php } else { ?>
<li>
<?php } ?>
  <a href="logout.php"><i class="fa fa-power-off"></i> <span>Logout</span></a>
</li>