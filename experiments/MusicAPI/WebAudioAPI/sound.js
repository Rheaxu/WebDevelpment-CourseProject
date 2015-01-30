/*
 * This is our sound object
 * Reserver the sound variable as an object function
 */

function Sound(source,level) {
    if (!window.audioContext) {
        audioContext = new webkitAudioContext;
    }
    var that = this;    // that referce to the current top level sound object
    that.source = source;
    that.buffer = null;
    that.isLoaded = false;
    that.panner = audioContext.createPanner();
    that.volume = audioContext.createGain();

    if (!level) {
        that.volume.gain.value = 1;
    } else {
        that.volume.gain.value = level;
    }

    var getSound = new XMLHttpRequest();
    getSound.open("GET", that.source, true);
    getSound.responseType = "arraybuffer";
    getSound.onload = function () {
        audioContext.decodeAudioData(getSound.response, function (buffer) {
            // this refers the to current scope
            that.buffer = buffer;
            that.isLoaded = true;
        });
    }
    getSound.send();
}

Sound.prototype.play = function () {
    if (this.isLoaded === true) {
        var playSound = audioContext.createBufferSource();
        playSound.buffer = this.buffer;
        playSound.connect(this.panner);
        this.panner.connect(this.volume);
        this.volume.connect(audioContext.destination);
        playSound.start(0);
    }
}

Sound.prototype.setVolume = function (level) {
    this.volume.gain.value = level;
}

Sound.prototype.setPan = function (xValue) {
    this.panner.setPosition(xValue, 0, 0);
}