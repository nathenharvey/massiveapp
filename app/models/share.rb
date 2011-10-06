class Share < ActiveRecord::Base

  validates :bookmark_id, :presence => true
  validates :shared_by, :presence => true
  validates :shared_with, :presence => true

end
