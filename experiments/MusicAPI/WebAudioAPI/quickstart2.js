/*
 * Web Audio Code
 */

(function () {

    if (typeof AudioContext == "function") {
        var ac = new AudioContext();
    } else if (typeof webkitAudioContext == "function") {
        var ac = new webkitAudioContext();
    }

    //var ac = new webkitAudioContext();

    var note1Sound;

    var getnote1 = new XMLHttpRequest();
    getnote1.open("GET", "snd/piano.mp3", true);
    getnote1.responseType = "arraybuffer";
    getnote1.onload = function () {
        ac.decodeAudioData(getnote1.response, function (buffer) {
            note1Sound = buffer;
        });
    }

    getnote1.send();

    window.addEventListener("keydown", onKeyDown);

    function onKeyDown(e) {
        switch (e.keyCode) {
            //1
            case 49:
                var playSound = ac.createBufferSource();
                playSound.buffer = note1Sound;
                playSound.connect(ac.destination);
                // In newer Web Audio API, the noteOn() has been renamed as start()
                playSound.start(0);
                break;

                //2
            case 50:
                //
                break;

                //3
            case 51:
                //
                break;
        }
    }
}());