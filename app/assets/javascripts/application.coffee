#= require jquery
#= require jquery_ujs
#= require knockout
#= require turbolinks
#= require_self
#= require_tree .

$ ->
  window.vm = new AppViewModel()

  $(window).load ->
    ko.applyBindings(vm)
