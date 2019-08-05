class Messages
  constructor: (el) ->
    @$el = $(el)

    @_bindEvents()

  _bindEvents: ->
    @$el.on "click", @_closeMessage

  _closeMessage: =>
    @$el.closest(".message").transition("fade")

new Messages(el) for el in $(".message .close")
