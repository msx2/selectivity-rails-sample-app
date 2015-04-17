$(document).on 'ready page:load', ->
  $('[data-toggle="selectivity"]').selectivity()

  $('[data-toggle="selectivity-email"]').selectivity
    inputType: 'Email'
