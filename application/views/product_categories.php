<script>
  function submitForm() {

  }
</script>

<section>
  <div class="container">
    <div class="row">
        <div class="left-sidebar">
      <div class="col-sm-3">
          <h2>Category</h2>
          <div class="panel-group category-products" id="accordian"><!--category-productsr-->
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a  href="/CodeIgniter/index.php/store/product/all">

                    Clothes
                  </a>
                </h4>
              </div>
              <div id="sportswear" class="panel-collapse collapse">
                <div class="panel-body">
                  <ul>
                    <!--use sql statement to get the clothes brand-->
                    <?php foreach ($type_model as $row) { ?>
                      <li><a href="#"><?= $row['name'] ?></a></li>
                    <?php } ?>
                  </ul>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#accordian" href="#mens">
                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                    Men
                  </a>
                </h4>
              </div>
              <div id="mens" class="panel-collapse collapse">
                <div class="panel-body">
                <form id="gender" method="get" action="">
                  <ul>


                  <?php
    foreach ($menType->result() as $row) {
      echo "
      <li><a href='/CodeIgniter/index.php/store/product/".$row->type_id."' onclick=submitForm()>".$row->type."</a></li>
      <input type='hidden' form='gender' value='1' name='gender'/>
      ";}
      ?>



                  </ul>
                </div>
              </div>
            </div>

            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#accordian" href="#womens">
                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                    Women
                  </a>
                </h4>
              </div>
              <div id="womens" class="panel-collapse collapse">
                <div class="panel-body">
                  <ul>
                    <?php
    foreach ($womenType->result() as $row) {
      echo "
      <li><a href='/CodeIgniter/index.php/store/product/".$row->type_id."' onclick=submitForm()>".$row->type."</a></li>
      <input type='hidden' form='gender' value='2' name='gender'/>
      ";}
      ?>
                  </ul>
                </div>
              </div>
            </div>

          </div><!--/category-products-->
        </div>
      </div>
