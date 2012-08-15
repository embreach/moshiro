always = (constant) ->
  -> constant

key = (keyCode) ->
  events = (type) ->
    $(document).asEventStream(type).filter((event) -> event.keyCode == keyCode)

  keydown = events("keydown").map(always("DOWN"))
  keyup = events("keyup").map(always("UP"))
  keydown.merge(keyup).distinctUntilChanged()

spaceKey = key(32)

loadImage = (url) ->
  promise = $.Deferred()
  img = new Image()
  img.onload = -> promise.resolve img
  img.src = url
  promise

play = (mp3) ->
  audio = new Audio()
  audio.setAttribute("src", mp3)
  audio.load()
  audio.play()

# TODO also load mp3 before starting
$.when(loadImage('../Moshiro_1frame.png'), loadImage('../Moshiro_2frame.png')).done (frame1, frame2) ->
  poses = { UP: frame1, DOWN: frame2 }

  images = spaceKey.map (direction) -> poses[direction]

  canvas = $('#game').get(0).getContext('2d')
  canvas.font = "bold 12px sans-serif"
  canvas.fillText("Tap or press space to start", 248, 43)

  images.onValue (image) ->
    canvas.drawImage(image, 0, 0)

  $('#loading').hide()
  $('#game').show()

  canvas.dra

  spaceKey.take(1).onValue(-> play("../moshiro.mp3"))
