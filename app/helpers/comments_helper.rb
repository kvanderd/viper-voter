module CommentsHelper

	def nested_comments(change)
	 change.comments.map do |comment, sub_comments|
	    render(comment) + content_tag(:div, other_nested_comments(sub_comments), :class => "nested_comments")
	  end.join.html_safe
	end
end

