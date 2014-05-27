module CommentsHelper

	def nested_comments(comments)
	 comments.map do |comment, sub_comments|
	    render(comment) + content_tag(:div)
	  end.join.html_safe
	end
end

