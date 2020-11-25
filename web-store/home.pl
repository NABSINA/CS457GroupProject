
sub HomePage {

print <<ENDOFTEXT;

<center>
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- jQuery and JS bundle w/ Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <br><br><br>
    <div class="title">
        <h1 id="greeting"></h1>
        <h1>Welcome to Macrocenter</h1>
    </div>
    <div class="fullscreen-bg">
        <video class="fullscreen-bg__video"
            muted
            src="https://dm0qx8t0i9gc9.cloudfront.net/watermarks/video/NrM0QFs3gilniuv44/videoblocks-hands-typing-on-computer-keyboard-moving-camera-business-man-working-on-laptop-pc-in-office_somiz0hy24__5d2a1f05f27e7dbdb95e3bf2da0f9767__P360.mp4"
            autoplay
            loop="true"
            type="video/mp4">
        </video>
    </div>
</center>
<style>
    body {
        background-color: #AAAAAA;
    }
    .title {
        text-shadow: 2px 2px #000000;
        color: white;
        width: 99vw;
    }
    .fullscreen-bg {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        height: 100vh;
        overflow: hidden;
        z-index: -100;
    }
    .fullscreen-bg__video {
        position: absolute;
        top: 0;
        left: 0;
        width: 100vw;
    }
</style>
<script>
    const nowHours = new Date().getHours();
    console.log(nowHours);
    const timeGreeting = nowHours < 12 ? 'Morning' : nowHours < 18 ? 'Afternoon' : 'Evening';
    document.getElementById('greeting').innerHTML = 'Good ' + timeGreeting;
</script>

ENDOFTEXT

}

1; #return true
