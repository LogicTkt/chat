$ ->
  App.room = App.cable.subscriptions.create { channel: 'RoomChannel', room: $('#room').text(); },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      vm.room.appendMessage(data['message']['id'], data['message']['content'])

    speak: (room, message) ->
      @perform 'speak', room: room, message: message

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak($('#room').text(), event.target.value)
      event.target.value = ''
      event.preventDefault()
