# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '#showpopup', (e) ->
  e.preventDefault()
  $('.popup').fadeIn(1500)

$(document).on 'click', '.close2 .fa', (e) ->
  e.preventDefault()
  $('.popup').fadeOut(1500)
