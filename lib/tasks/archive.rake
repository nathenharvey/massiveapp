namespace :archive do
  task :dump_old_records_to_sql => :environment do
    threshold = 6.months.ago.beginning_of_day
    output_filename = File.join(Rails.root, "#{threshold.strftime('%Y%m%d')}.sql")
    where = "created_at < '#{threshold.strftime("%Y-%m-%d")}'"
    config = ActiveRecord::Base.configurations[RAILS_ENV]
    command = "mysqldump "
    command << " -u#{config['username']} "
    command << " -p#{config['password']} " if config['password'].present?
    command << " --single-transaction "
    command << " --quick "
    command << " --tables "
    command << " --where \"#{where}\" "
    command << " #{config['database']} "
    command << " versions "
    command << " > #{output_filename} "
    # Dump the records
    `#{command}`
    # Delete the records
    VestalVersions::Version.delete_all(["created_at < ?", threshold])
  end
end
