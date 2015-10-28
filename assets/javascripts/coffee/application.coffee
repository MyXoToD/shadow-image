$(document).ready ->
  app.init()

app =
  init: ->
    @bind_events()

  bind_events: ->
    $(window).scroll =>
      @header_parallax()

    $(document).on 'click', '.btn-more', (e) ->
      $('html,body').animate
        scrollTop: $('.header-wrapper').height() + 'px'
      , 1000

    $(document).on 'change', '.file-upload', @process_file

  process_file: (e) ->
    file = this.files[0]
    reader = new FileReader()
    reader.addEventListener 'load', (event) ->
      loaded_file = event.target
      app.image2shadow loaded_file.result
    reader.readAsDataURL file

  image2shadow: (img_src) ->
    img = new Image()
    img.crossOrigin = "Anonymous"
    img.src = img_src

    img.onload = ->
      $('.code, .image-preview, .preview, .preview-shadow, .avg-color').show()
      c = document.querySelector '.image-preview'
      ctx = c.getContext '2d'
      img_width = img.width
      img_height = img.height

      c.setAttribute 'width', img_width
      c.setAttribute 'height', img_height

      ctx.drawImage img, 0, 0

      imgd = ctx.getImageData 0, 0, img_width, img_height
      pix = imgd.data

      code = ""
      bg = ""
      x = 0
      y = 0
      r = 0
      g = 0
      b = 0
      i = 0

      while i < pix.length
        progress = Math.round(100 / pix.length * i)
        console.log 'Progress: ' + progress + '%'

        r += pix[i]
        g += pix[i+1]
        b += pix[i+2]

        hex = app.rgbToHex(pix[i], pix[i+1], pix[i+2])

        if i > 0
          code += x + 'px ' + y + 'px ' + hex + ', '
        if i is 0
          bg = hex
          $('.preview-shadow').css 'background-color', hex
        if x < img_width - 1
          x++
        else
          x = 0
          y++

        i += 4
      code = code.substring 0, code.length - 2
      $('.preview-shadow').css 'box-shadow', code
      $('.preview-shadow').css 'margin-bottom', img_height + 20 + 'px'
      code = 'width: 1px;\nheight: 1px;\nbackground-color: ' + bg + ';\nbox-shadow: ' + code + ';'
      $('.code').html code
      r = Math.round(r / pix.length / 4)
      g = Math.round(g / pix.length / 4)
      b = Math.round(b / pix.length / 4)
      $('.avg-color span').css 'background-color', app.rgbToHex r, g, b

  componentToHex: (c) ->
    hex = c.toString(16)
    if hex.length == 1 then '0' + hex else hex

  rgbToHex: (r, g, b) ->
    '#' + @componentToHex(r) + @componentToHex(g) + @componentToHex(b)

  header_parallax: ->
    if $(window).width() > 600
      y_pos = ($(window).scrollTop() / 5) * -1
      $(".header-wrapper").css("background-position", "50% " + y_pos + "px")