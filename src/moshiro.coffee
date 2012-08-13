audio = new Audio
audio.preload = "none"
audio.setAttribute "src", "/Moshiro_8bit/moshiro.mp3"
audio.load()
setTimeout((-> audio.play()), 1000)