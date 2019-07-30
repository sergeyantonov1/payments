class Messages
  constructor: (el) ->
    @$el = $(el)

    bindEvents()

  _bindEvents: ->
    @$el.addEventListener("click", closeMessage())

  _closeMessage: ->
    @$el.closest(".message").transition "fade"
    return

new Messages(el) for el in $(".message .close")
