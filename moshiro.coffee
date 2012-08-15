always = (value) ->
  -> value

spaces = (event) ->
  $(document).asEventStream(event).filter((event) -> event.keyCode == 32).map(always("Space going " + event))

spaces("keydown").merge(spaces("keyup")).distinctUntilChanged().onValue((state) -> console.log(state))

play = (mp3) ->
  audio = new Audio()
  audio.setAttribute("src", mp3)
  audio.load()
  audio.play()

window["start"] = -> play("/moshiro.mp3")
