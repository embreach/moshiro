class Moshiro
  constructor: ->
    @audio = new Audio
    @audio.preload = "none"
    @audio.addEventListener('play', -> console.log("Play"))
    @audio.addEventListener('loadeddata', -> console.log("Loaded data"))
    @audio.addEventListener('playing', -> console.log("Playing"))
    @audio.addEventListener('ended', -> console.log("Ended"))
    @audio.addEventListener('timeupdate', -> document.getElementById("Tock").innerHTML = '<b>' + new Date() + '</b>')

  play: ->
    @audio.setAttribute "src", "/Moshiro_8bit/moshiro.mp3"
    @audio.load()
    @audio.play()

window['Moshiro'] = Moshiro