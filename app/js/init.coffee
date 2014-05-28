
require('nw.gui').Window.get().showDevTools();
fs = require('fs')

$(->

  # $('#saveFile').on('click', ->
  #   LZADialog.saveFileAs((file)->
  #     path = file.path
  #     filename = file.name
  #     dir = path.replace(filename, '')

  #     if not filename.match('.json') then filename = filename + '.json'

  #     dummyData = {
  #       music: on
  #       volume: true
  #       array: [1,2,3]
  #       nested:
  #         hello: 'world'
  #     }

  #     fs.writeFile(dir + filename, JSON.stringify(dummyData), (err) ->
  #       if err
  #         alert err
  #       else
  #         alert 'Save file in: ' + dir + filename

  #       )
  #     )
  #   )

  $('#loadFile').on('click', ->
    LZADialog.selectFile({}, (file)->
      path = file.path
      filename = file.name
      dir = path.replace(filename, '')
      data = new FileReader()
      data.readAsText(file)

      data.onloadend = ->
        try
          fileContents = JSON.parse(data.result)
          alert('Successfully read file!')
          console.log(fileContents)
        catch e
          alert('Unreadable file')
        
      )
    )




  )