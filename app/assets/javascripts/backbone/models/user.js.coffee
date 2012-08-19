class WEB.Models.User extends Backbone.Model
  paramRoot: 'user'
  
  urlRoot: "/users"
  
class WEB.Collections.UsersCollection extends Backbone.Collection
  model: WEB.Models.User
  url: '/users'
