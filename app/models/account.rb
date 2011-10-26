class Account < ActiveRecord::Base

  versioned

  validates :login, :presence => true
  validates :email, :presence => true
  
  def self.send_daily_activity_report
    # Collect activity for yesterday and send an email
  end

end
