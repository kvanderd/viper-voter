class CommentsController < ApplicationController







  def new
    @comment = Comment.new(:parent_id => params[:parent_id])
    # @comment.parent_id = params[:parent_id]
  @change = Change.find(params[:change_id])
    @comment.change_id = params[:change_id]
  

   
  end

	def create
        @change = Change.find(params[:change_id])
        @comment = @change.comments.create(comment_params)
       
        @comment.parent_id = params["comment"]["parent_id"]
        
        @comment.save!

    respond_to do |format|
        format.html { redirect_to change_path(@change) }
        format.js 
		end
	end




  def comment_params
    params.require(:comment).permit(:parent_id, :content, :id, :change_id, :user_id, :ancestry)
  end



end