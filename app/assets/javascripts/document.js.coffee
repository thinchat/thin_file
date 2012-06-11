$ ->
  uploadHandler()
  $(':file').change ->
    file = this.files[0]
    name = file.name
    size = file.size
    type = file.type

uploadHandler = ->
  $('.file_upload').click ->
    data = new FormData $('form')[0]
    $.ajax({
      type: 'POST',
      url: 'http://localhost:3000/api/documents',
      data: data,
      cache: false,
      contentType: false,
      processData: false,
      success: (response) ->
        provideLink(response.file.url)
      })

provideLink = (url) ->
  alert url
