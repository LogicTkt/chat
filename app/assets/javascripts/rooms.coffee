class @Room
  constructor: () ->
    self = this
    self.messages = ko.observableArray()
    if gon.messages.length > 0
      gon.messages.forEach (comment, index, ar) ->
        self.messages.unshift(new Message(comment.id, comment.content))

  appendMessage: (id, content)->
    self = this
    self.messages.unshift(new Message(id, content))

$ ->
  if $('#messages').is '*'
    room = new Room()
    vm.addViewModels( room: room )
