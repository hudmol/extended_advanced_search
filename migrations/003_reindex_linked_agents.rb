Sequel.migration do

  up do
    # Reindex any record whose linked agent is 'source' or 'subject' (to match
    # the fields defined in search_definitions.rb)

    [:resource, :event, :accession, :archival_object, :digital_object, :digital_object_component].each do |record_type|
      id_column = :"#{record_type}_id"

      ids_to_update = self[:linked_agents_rlshp]
                      .join(:enumeration_value, :id => :linked_agents_rlshp__role_id)
                      .filter(:enumeration_value__value => ['source', 'subject'])
                      .where { Sequel.~(id_column => nil) }
                      .select(id_column)
                      .map {|row| row[id_column]}
                      .uniq

      self[record_type].filter(:id => ids_to_update).update(:system_mtime => Time.now)
    end
  end

end
