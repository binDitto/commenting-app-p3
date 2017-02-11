# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#showpopup').click (e) ->
    e.preventDefault()
    $('.popup').fadeIn(2000)

  $('.close2 .fa').click (e) ->
    e.preventDefault()
    $('.popup').fadeOut(2000)
