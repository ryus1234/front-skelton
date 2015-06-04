class Hello
  constructor: (@word) ->

  say: ->
    console.log "Hello #{@word}!!"

hello = new Hello('world')
do hello.say

l = document.getElementById 'loader'
l.style.display = "block"
setTimeout ->
  console.log "after 5000ms"
  l.style.display = "none"
  return
,5000
