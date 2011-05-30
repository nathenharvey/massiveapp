class Account < ActiveRecord::Base

  versioned

  validates_presence_of :login, :email

end
