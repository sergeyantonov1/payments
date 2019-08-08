class Dropdown
  constructor: (el) ->
    @$el = $(el)

    @_bindEvents()

  _bindEvents: ->
    @$el.dropdown()

new Dropdown(el) for el in $(".js-dropdown")
