class window.AppViewModel
  addViewModel: (view_model_name, view_model) ->
    Object.defineProperty(this, view_model_name, {
      value: view_model,
      writable: false,
      enumerable: true
    })

  addViewModels: (hash) ->
    self = this
    $.each hash, (key, value) ->
      self.addViewModel(key, value)
