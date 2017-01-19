Sequel.migration do

  up do
    [:archival_object].each do |table|
      self[table].update(:system_mtime => Time.now)
    end
  end

end

