class Moshiro
  constructor: ->
    @audio = new Audio
    @audio.preload = "none"
    @audio.setAttribute "src", "/Moshiro_8bit/moshiro.mp3"
    @audio.load()
    @audio.addEventListener('ended', -> console.log("That's it!"))

  play: ->
    @audio.play()

m = new Moshiro

window['Moshiro'] = Moshiro