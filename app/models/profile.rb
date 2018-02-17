class Profile < ApplicationRecord
	has_many :jobs
	validates_presence_of :Titel, :Beschreibung, :Name
end
