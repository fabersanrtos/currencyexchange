$(document).ready ->
  $('#quantity').on "keyup", ->
    convert_quantity()

  $('#currency').on "change", ->
    convert_quantity()

  $('#currency_destination').on "change", ->
    convert_quantity()

  $('body').on 'click', '#switch_currency', ->
    old_currency = $('#currency').val()
    $('#currency').val($('#currency_destination').val())
    $('#currency_destination').val(old_currency)

    convert_quantity()


  convert_quantity = () ->
    if $('#quantity').val() != ""
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
            currency: $("#currency").val(),
            currency_destination: $("#currency_destination").val(),
            quantity: $("#quantity").val()
            }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text , jqXHR) ->
            $('#result').val(data.value)
    else
      $('#result').val('')


       
