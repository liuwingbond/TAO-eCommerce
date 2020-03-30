<div class="container">
    <center><video id="myVideo" width="100%" onended="videoEnded()" autoplay>
        <source src="/CodeIgniter/images/izzue_2017_Spring.mp4" type="video/mp4">
        <source src="movie.ogg" type="video/ogg">
        Your browser does not support the video tag.
    </video></center>
    <br/>
    <script>
        $(document).ready(function(){
            $('#myVideo').on('ended',function(){ $(this).hide(); });
        });
    </script>
</div>