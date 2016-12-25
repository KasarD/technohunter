$ ->
  $(document).on 'change', '#car_brand_id', (evt) ->
    if $("#car_brand_id option:selected").text() == "Выберите марку..."
      $("#model").hide()
    else
      $("#model").show()

    $.ajax 'update_models',
      type: 'GET'
      dataType: 'script'
      data: {
        brand_id: $("#car_brand_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

  $(document).on 'change', '#car_region_id', (evt) ->
    if $("#car_region_id option:selected").text() == "Выберите регион..."
        $("#city").hide()
    else
        $("#city").show()

    $.ajax 'update_cities',
      type: 'GET'
      dataType: 'script'
      data: {
        region_id: $("#car_region_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")