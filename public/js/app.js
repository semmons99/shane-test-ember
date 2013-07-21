App = Ember.Application.create();

DS.RESTAdapter.reopen({
  url: "http://shane-test-api.herokuapp.com"
});

App.Store = DS.Store.extend({
});

App.User = DS.Model.extend({
  login:      DS.attr("string"),
  email:      DS.attr("string"),
  first_name: DS.attr("string"),
  last_name:  DS.attr("string")
});

App.IndexRoute = Ember.Route.extend({
  model: function() {
    return App.User.find()
  }
});
