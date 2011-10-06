class Account < ActiveRecord::Base

  versioned

  validates :login, :presence => true
  validates :email, :presence => true

end
