class AddAttachmentProfileavatarToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :profileavatar
    end
  end

  def self.down
    remove_attachment :profiles, :profileavatar
  end
end
