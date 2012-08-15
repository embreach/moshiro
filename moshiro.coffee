always = (constant) ->
  -> constant

key = (keyCode) ->
  events = (type) -> $(document).asEventStream(type).filter((event) -> event.keyCode == keyCode)
  keydown = events("keydown").map(always("DOWN"))
  keyup = events("keyup").map(always("UP"))
  keydown.merge(keyup).toProperty("UP").distinctUntilChanged()

space = key(32)

play = (mp3) ->
  audio = new Audio()
  audio.setAttribute("src", mp3)
  audio.load()
  audio.play()

images = space.map((direction) -> if direction == "UP" then "/Moshiro_1frame.png" else "/Moshiro_2frame.png")

images.onValue((image) -> )

img = new Image()
img.onload = ->
  ctx = $('#game').get(0).getContext('2d')
  ctx.drawImage(img, 0, 0)
img.src = "/Moshiro_1frame.png"

window["start"] = -> play("/moshiro.mp3")
