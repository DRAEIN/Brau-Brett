class Job < ApplicationRecord
	has_attached_file :avatar, styles: { big: "600x300", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	
	belongs_to :user
    
    validates_presence_of :Titel, :Beschreibung, :Ort

    def self.recent
      order("created_at DESC")
	end

	def self.search(search)
		where('Ort' LIKE ? OR 'Titel' LIKE ? OR 'Beschreibung' LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
	end
end
