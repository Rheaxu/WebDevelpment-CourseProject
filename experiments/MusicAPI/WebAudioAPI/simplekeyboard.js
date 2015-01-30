/*
 * Simple Key Board
 */

(function () {

    noteASound = new Sound("snd/A.wav");
    noteBSound = new Sound("snd/B.wav");
    noteCSound = new Sound("snd/C.wav");
    noteDSound = new Sound("snd/D.wav");
    noteESound = new Sound("snd/E.wav");
    noteFSound = new Sound("snd/F.wav");
    noteGSound = new Sound("snd/G.wav");
    
    window.addEventListener("keydown", onKeyDown_7);

    function onKeyDown_7(e) {
        switch (e.keyCode) {
            //a
            case 65:
                noteASound.play();
            break;
            //s
            case 83:
                noteBSound.play();
            break;
            //d
            case 68:
                noteCSound.play();
            break;
            //f
            case 70:
                noteDSound.play();
            break;
            //g
            case 71:
                noteESound.play();
            break;
            //h
            case 72:
                noteFSound.play();
            break;
            //j
            case 74:
                noteGSound.play();
            break;
        }
    }
}());