<section id='cart_items'>
  <div class='container'>
    <div class='breadcrumbs'>
      <ol class='breadcrumb'>
        <li><a href=''>Home</a></li>
        <li class='active'>Shopping Cart</li>
      </ol>
    </div>
    <div class='table-responsive cart_info'>
      <table class='table table-condensed'>
        <thead>
          <tr class='cart_menu'>
            <td class='image'>Item</td>
            <td class='description'>Description</td>

            <td class='status'>Status</td>
            <td class='deliver_date'>deliver_date</td>

          </tr>
        </thead>
        <tbody>

          <?php
          foreach ($orderDetails->result() as $row) {
            echo "

            <tr>
            <td class='cart_product'>
            <a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."
            '><img src='". $row->image_url ."
            ' alt='' width='150px'></a>
            </td>
            <td class='cart_description'>
            <h4><a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'>" . $row->name . "</a></h4>
            <p>Clothes ID: ". $row->clothes_id ."
            </p>
            </td>

            <td class='cart_description'>
            <p>". $row->order_status ."</p>
            </td>

                          <td class='cart_description'>
            <p>". $row->deliver_date ."</p>
            </td>

            </tr>

            ";}
            ?>
          </tbody>
        </table>
      </div>
    </div>
</section> <!--/#cart_items-->
