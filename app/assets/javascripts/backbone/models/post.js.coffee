class WEB.Models.Post extends Backbone.Model
    
  defaults: ->
    'body': null
    'title': null
    'user_id': WEB.currentUser.id
    'team_id': WEB.currentUser.get('team_id')
    'likes': []
    'image_id': null
        
  fetchUser: (userId) ->
    $.ajax
      type: 'GET'
      dataType: 'json'
      url: '/users/' + userId
      success: (data) =>
        @set user: data
  
  fetchLikes: (postId) ->
    $.ajax
      type: 'GET'
      dataType: 'json'
      url: '/posts/' + postId + '/likes'
      success: (data) =>
        @set likes: data
  
  fetchTeam: (teamId) ->
    $.ajax
      type: 'GET'
      dataType: 'json'
      url: '/teams/' + teamId
      success: (data) =>
        @set team: data
  
  fetchImage: (postId) ->
    $.ajax
      type: 'GET'
      dataType: 'json'
      url: '/posts/' + postId + '/image'
      success: (data) =>
        @set image: data
  
  asJSON: =>
    post = _.clone this.attributes
    return _.extend post, {user: this.get('user'), likes: this.get('likes'), team: this.get('team'), image: this.get('image')}
    
  like: (postId) ->
    $.ajax
      type: 'POST'
      dataType: 'json'
      url: '/like?post_id=' + postId + '&user_id=' + WEB.currentUser.id
      
  unlike: (postId) ->
    $.ajax
      type: 'DELETE'
      dataType: 'json'
      url: '/unlike?post_id=' + postId + '&user_id=' + WEB.currentUser.id
  
  addToBucket: (bucketId) ->
    $.ajax
      type: 'POST'
      dataType: 'json'
      url: '/bucket/' + bucketId + '/add_post/' + @get('id')
      
  removeFromBucket: (bucketId) ->
    $.ajax
      type: 'DELETE'
      dataType: 'json'
      url: '/bucket/' + bucketId + '/remove_post/' + @get('id')
   
class WEB.Collections.PostsCollection extends Backbone.Collection
  model: WEB.Models.Post