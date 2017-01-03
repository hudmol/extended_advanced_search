Sequel.migration do

  up do
    [:event].each do |table|
      self[table].update(:system_mtime => Time.now)
    end
  end

end

