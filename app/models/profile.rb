class Profile < ApplicationRecord
	belongs_to :user
	validates_presence_of :Titel, :Beschreibung, :Name
end
