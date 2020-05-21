class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
    
        @comment.save
    
        redirect_to travel_path(@comment.travel_id)
    end
    
    def comment_params
        params.require(:comment).permit(:author_name, :body, :travel_id)
    end
end
