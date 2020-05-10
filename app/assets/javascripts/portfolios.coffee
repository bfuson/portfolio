# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

set_positions = undefined

set_positions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return

ready = ->
  set_positions() 
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
      # sortupdate method is in:  app/javascripts/html.sortable.js
    updated_order = []
    set_positions()
    $('.card').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax 
      # sets up direct connection to external code / apis such as Rails, or another packages API
      type: 'PUT' 
      # "bundle exec rake routes | grep portfolio"  to see PUT actions.
      # PUT    /portfolios/:id(.:format)          portfolios#update
      url: '/portfolios/sort'
      data: order: updated_order
    return
  return
  
$(document).ready ready