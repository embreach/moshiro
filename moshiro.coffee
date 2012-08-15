class Music
  constructor: (mp3) ->
    @audio = new Audio
    @audio.setAttribute "src", mp3
    @audio.load()
    @audio.play()

class Keyboard
  constructor: ->
    spaces = $(document).asEventStream("keydown").filter((event) -> event.keyCode == 32)
    spaces.onValue((state) -> console.log(state))

class Moshiro
  constructor: ->
    new Music("/moshiro.mp3")

window["Moshiro"] = Moshiro