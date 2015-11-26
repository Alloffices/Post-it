class Bscene < ActiveRecord::Base
	belongs_to :projx
	belongs_to :user

	# image upload with paperclip
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	# video conversion with paperclip-av-transcoder
	has_attached_file :video, styles: {
	    :medium => {
	      :geometry => "640x480",
	      :format => 'mp4'
	    },
	    :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
  	}, :processors => [:transcoder]

end
