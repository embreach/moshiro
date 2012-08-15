always = (constant) ->
  -> $('#debug').text(constant); constant

key = (keyCode) ->
  events = (type) ->
    $(document).asEventStream(type).filter((event) -> event.keyCode == keyCode)

  keydown = events("keydown").map(always("DOWN"))
  keyup = events("keyup").map(always("UP"))
  keydown.merge(keyup).distinctUntilChanged()

spaceKey = key(32)

# TODO Cleanup
touches = ->
  touch = $('body').asEventStream('touchstart').map(always("DOWN"))
  cantTouch = $('body').asEventStream('touchend').map(always("UP"))
  touch.merge(cantTouch)

direction = spaceKey.merge(touches())

loadImage = (url) ->
  promise = $.Deferred()
  img = new Image()
  img.onload = -> promise.resolve img
  img.src = url
  promise

# Can't pre-load, since iOs only allows media downloads to start from user events
playAudio = (url) ->
  audio = new Audio()
  audio.setAttribute("src", url)
  audio.load()
  audio.play()

$.when(loadImage('../Moshiro_1frame.png'), loadImage('../Moshiro_2frame.png')).done (frame1, frame2) ->
  poses = { UP: frame1, DOWN: frame2 }

  images = direction.map (current) -> poses[current]

  canvas = $('#game').get(0).getContext('2d')
  canvas.font = "bold 12px sans-serif"
  canvas.fillText("Tap or press space to start", 248, 43)

  images.onValue (image) ->
    canvas.drawImage(image, 0, 0)

  $('#loading').hide()
  $('#game').show()

  # TODO Another loading indicator here
  direction.take(1).onValue ->
    playAudio("../moshiro.mp3")
