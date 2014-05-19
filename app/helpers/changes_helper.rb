module ChangesHelper

 def twitter_handles(senates, sep = ", @")
 	 senates.map {|senate| senate.contact.twiter }.join sep

 end
end
