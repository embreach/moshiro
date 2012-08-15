class Moshiro
  constructor: ->
    @audio = new Audio
    @audio.preload = "none"

  play: (mp3) ->
    @audio.setAttribute "src", mp3
    @audio.load()
    @audio.play()

window["Moshiro"] = Moshiro