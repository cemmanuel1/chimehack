module ApplicationHelper

	def categories_nav
    @category = Category.all
	end

	# def grab_video_id
 #    (/youtube.com.*(?:\/|v=)([^&$]+)/)
	# end
	
end
