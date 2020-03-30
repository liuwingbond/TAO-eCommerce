<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-9">
                <!--Comments-->
                <div class="response-area">
                    <h2>Comment</h2>
                    <ul class="media-list">
                        <li class="media">

                            <a class="pull-left" href="#">
                                <img class="media-object" src="/CodeIgniter/images/blog/man-two.png" alt="">
                            </a>
                            <div class="media-body">
                                <ul class="sinlge-post-meta">
                                    <li>
                                        <?php
                                        echo ("<p id='demo'></p><script>document.getElementById('demo').innerHTML = Date();</script>");
                                        ?>
                                    </li>
                                </ul>
                                <p>
                                    <?php
                                    foreach($query_comment->result() as $comment){
                                        echo $comment->comment;
                                    }?>
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
