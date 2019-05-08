class CommentBroadcastJob < ApplicationJob
  queue_as :default #orders the comments based on when they were received
  
  def perform(comment) #takes a comment and starts a broadcast on ActionCable - each blog has a different channel
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end
  
  private
  
  def render_comment(comment) #calls comments controller and renders partial
    CommentsController.render partial: 'comments/coment', locals: { comment: comment }
  end
end