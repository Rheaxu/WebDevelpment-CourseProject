/*
 * Audio Element Code
 */

(function () {

    var note1Sound;
    note1Sound = document.createElement("audio");
    document.body.appendChild(note1Sound);
    note1Sound.setAttribute("src", "snd/piano.mp3");

    var note2Sound;
    note2Sound = document.createElement("audio");
    document.body.appendChild(note2Sound);
    note2Sound.setAttribute("src", "snd/g-piano4.wav");

    var note3Sound;
    note3Sound = document.createElement("audio");
    document.body.appendChild(note3Sound);
    note3Sound.setAttribute("src", "snd/g-piano3.mp3");

    window.addEventListener("keydown", onKeyDown_3);

    function onKeyDown_3(e) {
        switch (e.keyCode) {
            //1
            case 49:
                console.log("key 1 is down");
                note1Sound.play();
            break;

            //2
            case 50:
                console.log("key 2 is down");
                note2Sound.play();
            break;

            //3
            case 51:
                console.log("key 3 is down");
                note3Sound.play();
            break;
        }
    }
}());