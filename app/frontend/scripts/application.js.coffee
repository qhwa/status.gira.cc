checkOnline = (dom, uri) ->
  dom = $(dom)

  $(dom).removeClass(['online', 'offline'])
  $('.checking', dom).show()

  $.ajax(uri).done (data) ->
    ol = data == 'online'
    $('.checking', dom).hide()
    dom.toggleClass('online', ol).toggleClass('offline', !ol)


jQuery ($) ->

  checkAll = ->
    checkOnline $('#web-primary'), 'web/primary'
    checkOnline $('#web-secondary'), 'web/secondary'
    checkOnline $('#tunnel-primary'), 'tunnel/primary'
    checkOnline $('#tunnel-secondary'), 'tunnel/secondary'
    checkOnline $('#shadow-primary'), 'shadow/primary'
    checkOnline $('#shadow-secondary'), 'shadow/secondary'

    console.log 'check'
    setTimeout checkAll, 10000

  checkAll()
