$(document).ready ->
  $('#quantity').on "keyup", ->
    console.log($('#quantity').val())
    if $('#quantity').val() != ""
      convert_quantity()
    else
      $('#result').val('')

  $('body').on 'click', '#switch_currency', ->
    old_currency = $('#currency').val()
    old_currency_destination = $('#currency_destination').val()
    $('#currency_destination').val(old_currency)
    $('#currency').val(old_currency_destination)
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



       
