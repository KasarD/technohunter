$ ->
  $(document).on 'change', '#truck_brand_id', (evt) ->
    if $("#truck_brand_id option:selected").text() == "Выберите марку..."
      $("#model").hide()
    else
      $("#model").show()

    $.ajax 'update_models',
      type: 'GET'
      dataType: 'script'
      data: {
        brand_id: $("#truck_brand_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

  $(document).on 'change', '#truck_region_id', (evt) ->
    if $("#truck_region_id option:selected").text() == "Выберите регион..."
        $("#city").hide()
    else
        $("#city").show()

    $.ajax 'update_cities',
      type: 'GET'
      dataType: 'script'
      data: {
        region_id: $("#truck_region_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")