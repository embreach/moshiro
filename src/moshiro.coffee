class Player
  constructor: ->
    @audio = new Audio
    @audio.preload = "none"

  play: (mp3) ->
    @audio.setAttribute "src", mp3
    @audio.load()
    @audio.play()

class Moshiro
  constructor: ->
    new Player().play("/moshiro.mp3")

window["Moshiro"] = Moshiro