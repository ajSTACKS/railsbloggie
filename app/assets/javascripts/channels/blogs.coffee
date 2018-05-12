jQuery(document).on 'turbolink:load', ->
  comments = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscrtiption.create {
      channel: "BlogsChannel"
      blog_id: comments.data('blog-id')
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      comments.append data['comment']
    send_comment: (comment, blog_id) ->
      #we need to know what blog its associated with
      @perform: 'send_comment', comment: comment, blog_id: blog_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    textarea = $this.find('#comment_content')
    #store the cariable in textarea
    if $.trim(textarea.val()).length > 1
      #if true perform function below
      App.global_chat.send_comment textarea.val(),
      comments.data('blog-id'),
      textarea.val('') #this wipes the textarea clean after submit
    e.preventDefault() #like browsersync
    return false
