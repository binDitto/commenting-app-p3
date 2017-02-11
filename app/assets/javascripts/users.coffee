# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.useract', (e) ->
  e.preventDefault()
  $('.useractions').fadeToggle(500)
  e.stopPropagation()

$(document).click ->
  if $('.useractions').show()
    $('.useractions').hide()
