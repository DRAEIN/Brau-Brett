class Job < ApplicationRecord
	belongs_to :user
    validates_presence_of :Titel, :Beschreibung, :Ort

    def self.recent
      order("created_at DESC")
	end
end
