<?php

include "../config/fungsi_indotgl.php";
include "../config/class_paging.php";

$aksi="modul/mod_facility/facility_aksi.php";

switch($_GET['act']) {
  // Tampil
  default:
  ?>
  <!-- Content -->
  <div class="cl-mcont">
    <div class="row">
      <div class="col-sm-12 col-md-12">
        <div class="block-flat">
          <div class="content">
            <!-- ========== Button ========== -->
            <form method="get" action='<?php echo '?module=facility&'.$_SERVER['PHP_SELF'] ?>'>
              <div class='btn-navigation'>
                <div class='pull-right'>
                  <a class="btn btn-primary" href="?module=facility&act=tambah"><i class="fa fa-plus-circle"></i> Tambah Fasilitas</a>
                </div>
                <div class='pull-right'>
                  <a class="btn btn-primary" href="?module=facility"><i class="fa fa-times-circle"></i> Bersihkan Pencarian</a>
                </div>
              </div>
              <div class='row'>
                <div class='btn-search'>Cari Berdasarkan Fasilitas :</div>
                  <div class='col-md-3 col-sm-12'>
                    <div class="input-group">
                      <input type=hidden name=module value=facility>
                      <input type="text" name="kata" class="form-control" value=""/>
                      <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary" type="button">
                          <i class="fa fa-search"></i>
                        </button>
                      </span>
                    </div>
                  </div>
                  <div class='col-md-3 col-sm-12'>

                  </div>
                </div>
              </form>
              <!-- ========== End Button ========== -->
              <!-- ========== Table ========== -->
              <div class="table-responsive">
                <table class="hover">
                  <thead class="primary-emphasis">
                    <tr>
                      <th width="30">#</th>
                      <th width="200">Fasilitas</th>
                      <th width="80">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php
                  if (empty(isset($_GET['kata']))) {
                    $p      = new Paging;
                    $batas  = 10;
                    $posisi = $p->cariPosisi($batas);

                    $result=mysqli_query($connect,"SELECT * FROM facility LIMIT $posisi,$batas");
                    $jmldata = mysqli_num_rows(mysqli_query($connect,"SELECT * FROM facility"));
                    if(mysqli_num_rows($result) === 0) {
                    ?>
                    <tr>
                      <td class="center" colspan="10">Data kosong...</td>
                    </tr>
                    <?php } else {
                    $no = $posisi+1;
                    while ($r=mysqli_fetch_array($result)) {
                    ?>
                    <tr>
                      <td class="center"><?php echo $no ?></td>
                      <td><?php echo $r['facility_name'] ?></td>
                      <?php if ($_SESSION['level']=='admin') { ?>
                      <td align="center">
                        <!-- ========== EDIT DETAIL HAPUS ========== -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-default btn-xs">Actions</button>
                          <button type="button" class="btn btn-primary btn-xs dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                          </button>
                          <ul class="dropdown-menu pull-right" role="menu">
                            <li>
                              <a href="?module=facility&act=edit&id=<?php echo $r['facility_id'] ?>" title="Edit <?php echo $r['facility_name'] ?>"><i class='fa fa-pencil'></i> Edit</a>
                            </li>
                            <li>
                              <a href="?module=facility&act=detail&id=<?php echo $r['facility_id'] ?>" title="Detail <?php echo $r['facility_name'] ?>"><i class='fa fa-eye'></i> Detail</a>
                            </li>
                            <li>
                              <a href="javascript:;" data-id="<?php echo $r['facility_id'] ?>" data-toggle="modal" data-target="#modal-konfirmasi" title="Hapus <?php echo $r['facility_name'] ?>"><i class='fa fa-trash-o'></i> Hapus</a>
                            </li>
                          </ul>
                        </div>
                        <!-- ========== End EDIT DETAIL HAPUS ========== -->
                      </td>
                      <?php $no++;
                    } ?>
                    </tr>
                    <?php }
                      $jmldata = mysqli_num_rows(mysqli_query($connect,"SELECT * FROM facility"));
                      $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
                      $linkHalaman = $p->navHalaman($_GET['halaman'], $jmlhalaman);
                    }?>
                  </tbody>
                </table>
                <div id='pagination'>
                       <div class='pagination-left'>Total : <?php echo $jmldata ?></div>
                       <div class='pagination-right'>
                           <ul class="pagination">
                               <?php echo $linkHalaman ?>
                           </ul>
                       </div>
                   </div>
                <?php } else {
                  $p      = new Paging;
                  $batas  = 10;
                  $posisi = $p->cariPosisi($batas);
                  $search = $_GET['kata'];

                  $result=mysqli_query($connect,"SELECT * FROM facility WHERE facility_name LIKE '%$search%' LIMIT $posisi,$batas");
                  if(mysqli_num_rows($result) === 0) {
                  $jmldata = mysqli_num_rows(mysqli_query($connect,"SELECT * FROM facility WHERE facility_name LIKE '%$search%'"));
                  ?>
                  <tr>
                    <td class="center" colspan="10">Data kosong...</td>
                  </tr>
                  <?php } else {
                  $no = $posisi+1;
                  while ($r=mysqli_fetch_array($result)) {
                  ?>
                  <tr>
                    <td class="center"><?php echo $no ?></td>
                    <td><?php echo $r['facility_name'] ?></td>
                    <td class="center"><?php echo tgl_indo($r['facility_created']); ?></td>
                    <td class="center"><?php echo tgl_indo($r['facility_updated']); ?></td>
                    <td align="center">
                      <!-- ========== EDIT DETAIL HAPUS ========== -->
                      <div class="btn-group">
                        <button type="button" class="btn btn-default btn-xs">Actions</button>
                        <button type="button" class="btn btn-primary btn-xs dropdown-toggle" data-toggle="dropdown">
                          <span class="caret"></span>
                          <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <ul class="dropdown-menu pull-right" role="menu">
                          <li>
                            <a href="?module=facility&act=edit&id=<?php echo $r['facility_id'] ?>" title="Edit <?php echo $r['facility_name'] ?>"><i class='fa fa-pencil'></i> Edit</a>
                          </li>
                          <li>
                            <a href="?module=facility&act=detail&id=<?php echo $r['facility_id'] ?>" title="Detail <?php echo $r['facility_name'] ?>"><i class='fa fa-eye'></i> Detail</a>
                          </li>
                          <li>
                            <a href="javascript:;" data-id="<?php echo $r['facility_id'] ?>" data-toggle="modal" data-target="#modal-konfirmasi" title="Hapus <?php echo $r['facility_name'] ?>"><i class='fa fa-trash-o'></i> Hapus</a>
                          </li>
                        </ul>
                      </div>
                      <!-- ========== End EDIT DETAIL HAPUS ========== -->
                    </td>
                  </tr>
                  <?php
                      $no++;
                    }
                    $jmldata = mysqli_num_rows(mysqli_query($connect,"SELECT * FROM facility WHERE facility_name LIKE '%$search%'"));
                    $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
                    $linkHalaman = $p->navHalaman($_GET['halaman'], $jmlhalaman);
                  }?>
                </tbody>
              </table>
              <div id='pagination'>
                     <div class='pagination-left'>Total : <?php echo $jmldata ?></div>
                     <div class='pagination-right'>
                         <ul class="pagination">
                             <?php echo $linkHalaman ?>
                         </ul>
                     </div>
                 </div>
              <?php } ?>
              <!-- ========== End Table ========== -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Content -->

    <!-- ========== Modal Konfirmasi ========== -->
    <div id="modal-konfirmasi" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Konfirmasi</h4>
          </div>
          <div class="modal-body" style="background:#d9534f;color:#fff">
            Apakah Anda yakin ingin menghapus data ini?
          </div>
          <div class="modal-footer">
            <a href="javascript:;" class="btn btn-danger" id="hapus-facility">Ya</a>
            <button type="button" class="btn btn-default" data-dismiss="modal">Tidak</button>
          </div>
        </div>
      </div>
    </div>
    <!-- ========== End Modal Konfirmasi ========== -->
  <?php
  break;

  // Form Tambah
  case "tambah": ?>
  <div class="cl-mcont">
    <div class="row">
      <div class="col-md-12">
        <div class="block-flat">
          <div class="content">
            <form role="form" class="form-horizontal" action="<?php echo $aksi ?>?module=facility&act=tambah" method="post" enctype="multipart/form-data" parsley-validate novalidate>
              <h3 class="title">Tambah Fasilitas</h3>
              <div class="table-responsive">
                <table class="table no-border hover">
                  <tbody class="no-border-y">
                    <tr>
                      <td width=150>
                        <label for="facility_name" class="control-label" >Fasilitas <span class="required">*</span></label>
                      </td>
                      <td>
                        <input name="facility_name" type="text" required class="form-control input-sm" id="facility_name" placeholder="Masukan Fasilitas"/>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div
            </form>
          </div>
          <div class='center'>
            <input class="btn btn-primary" type="submit" name="simpan" value="Simpan Data">
            <input class="btn btn-default" type="reset" name="batal" value="Batalkan" onclick="location.href='?module=facility'"/>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php
  break;

  // Form Edit
  case "edit":
  $result =mysqli_query($connect,"SELECT * FROM facility WHERE facility_id='$_GET[id]'");
  $r      = mysqli_fetch_array($result);
  ?>
  <div class="cl-mcont">
    <div class="row">
      <div class="col-md-12">
        <div class="block-flat">
          <div class="content">
            <form role="form" class="form-horizontal" action="<?php echo $aksi ?>?module=facility&act=edit" method="post" enctype="multipart/form-data" parsley-validate novalidate>
              <input name="facility_id" hidden type="text" value='<?php echo $r['facility_id'] ?>'/>
              <h3 class="title">Ubah Fasilitas</h3>
              <div class="table-responsive">
                <table class="table no-border hover">
                  <tbody class="no-border-y">
                    <tr>
                      <td width="180">
                        <label for="facility_name" class="control-label" >Fasilitas <span class="required">*</span></label>
                      </td>
                      <td>
                        <input name="facility_name" type="text" required class="form-control input-sm" id="facility_name" placeholder="Masukan Fasilitas" value='<?php echo $r['facility_name'] ?>'/>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div
            </form>
          </div>
          <div class='center'>
            <input class="btn btn-primary" type="submit" name="simpan" value="Ubah Data">
            <input class="btn btn-default" type="reset" name="batal" value="Batalkan" onclick="location.href='?module=facility'"/>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php
  break;

  // Form Detail
  case "detail":
  $result =mysqli_query($connect,"SELECT * FROM facility WHERE facility_id='$_GET[id]'");
  $r      = mysqli_fetch_array($result);
  ?>
  <div class="cl-mcont">
    <div class="row">
      <div class="col-md-12">
        <div class="block-flat">
          <div class="content">
            <form role="form" class="form-horizontal" action="?module=facility&act=edit&id=<?php echo $r['facility_id'] ?>" method="post" enctype="multipart/form-data" parsley-validate novalidate>
              <h3 class="title">Detail Fasilitas</h3>
              <div class="table-responsive">
                <table class="table no-border hover">
                  <tbody class="no-border-y">
                    <tr>
                      <td width="130">
                        <label class="control-label">ID</label>
                      </td>
                      <td class="detail"><?php echo $r['facility_id'] ?></td>
                    </tr>
                    <tr>
                      <td width="130">
                        <label class="control-label">Fasilitas</label>
                      </td>
                      <td class="detail"><?php echo $r['facility_name'] ?></td>
                    </tr>
                    <tr>
                      <td width="130">
                        <label class="control-label">Dibuat</label>
                      </td>
                      <td class="detail"><?php echo tgl_indo($r['facility_created']); ?></td>
                    </tr>
                    <tr>
                      <td width="130">
                        <label class="control-label">Terakhir diubah</label>
                      </td>
                      <td class="detail"><?php echo tgl_indo($r['facility_updated']); ?></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </form>
          </div>
          <div class='center'>
            <input class="btn btn-primary" type="submit" name="simpan" value="Edit Data">
            <input class="btn btn-default" type="reset" name="batal" value="Batalkan" onclick="location.href='?module=facility'"/>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php
  break;
} ?>
