/*
 * Final Sound Object
 */

(function () {

    note1Sound = new Sound("snd/piano.mp3");
    note2Sound = new Sound("snd/g-piano4.wav");
    note3Sound = new Sound("snd/g-piano3.mp3");

    note1Sound.setVolume(.1);
    note1Sound.setPan(-1);

    window.addEventListener("keydown", onKeyDown);

    function onKeyDown(e) {
        switch (e.keyCode) {
            //1
            case 49:
                note1Sound.play();
            break;
            //2
            case 50:
                note2Sound.play();
            break;

            //3
            case 51:
                note3Sound.play();
            break;
        }
    }
}());