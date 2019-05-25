window.onload = function() {
    document.body.addEventListener("mousemove", function(event){
        var x = event.pageX - 6 + "px"
        var y = event.pageY + "px"
        document.getElementById("cursor").style.left = x;
        document.getElementById("cursor").style.top = y;
    })
};

$(document).ready(function(){

    let audio = document.getElementById("audio");
    audio.volume = 0.5;

    $('#volume').on('click', function(){
        audio.volume = 0;
        $('#volume').css({
            'display' : 'none'
        });
        $('#volume_off').css({
            'display' : 'block'
        });
    });

    $('#volume_off').on('click', function(){
        audio.volume = 0.5;
        $('#volume_off').css({
            'display' : 'none'
        });
        $('#volume').css({
            'display' : 'block'
        });
    });

    $('#volumeControl').on('change', function(){
        let volumen = $('#volumeControl').val();
        if(volumen > 0){
            volumen = $('#volumeControl').val() / 100 ;
        }
        
        audio.volume = volumen;
    })
});
