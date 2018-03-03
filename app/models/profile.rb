class Profile < ApplicationRecord
	has_attached_file :profileavatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :profileavatar, content_type: /\Aimage\/.*\z/

	belongs_to :user
	validates_presence_of :Titel, :Beschreibung, :Name
end
