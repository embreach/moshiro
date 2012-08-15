always = (constant) ->
  -> constant

key = (keyCode) ->
  events = (type) ->
    $(document).asEventStream(type).filter((event) -> event.keyCode == keyCode)

  keydown = events("keydown").map(always("DOWN"))
  keyup = events("keyup").map(always("UP"))
  keydown.merge(keyup).distinctUntilChanged()

spaceKey = key(32)

poses = { UP: "/Moshiro_1frame.png", DOWN: "/Moshiro_2frame.png" }

images = spaceKey.map (direction) -> poses[direction]

images.onValue (image) ->
  # TODO preload
  img = new Image()
  img.src = image
  img.onload = ->
    ctx = $('#game').get(0).getContext('2d')
    ctx.drawImage(img, 0, 0)


play = (mp3) ->
  audio = new Audio()
  audio.setAttribute("src", mp3)
  audio.load()
  audio.play()

spaceKey.take(1).onValue(-> play("/moshiro.mp3"))
