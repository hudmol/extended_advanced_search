Sequel.migration do

  up do
    $stderr.puts("Adding text fields to the staff advanced search")
    enum = self[:enumeration].filter(:name => 'staff_field_query_field').select(:id)
    [
      # from core
      "acquisition_type",
      "agents",
      "created_by",
      "last_modified_by",

      # from plugin
      "accession_id_0_u_ustr",
      "accession_id_1_u_ustr",
      "accession_content_description_u_utext",
      "accession_condition_description_u_utext",
      "accession_inventory_u_utext",
      "accession_provenance_u_utext",
      "accession_general_note_u_utext",
      "extent_number_u_ustr",
      "extent_type_u_ustr",
      "extent_container_summary_u_utext",
      "extent_physical_details_u_utext",
      "agent_roles_u_ustr",
      "string_3_u_ustr",
      "text_1_u_utext",
      "text_2_u_utext",
      "text_3_u_utext",
      "text_4_u_utext",
      "text_5_u_utext",
      "enum_2_u_ustr",
    ].each do |field|
      self[:enumeration_value].insert(:enumeration_id => enum, :value => field)
    end

    $stderr.puts("Adding boolean fields to the staff advanced search")
    enum = self[:enumeration].filter(:name => 'boolean_field_query_field').select(:id)
    [
      # from core
      "restrictions_apply",
      "access_restrictions",
      "use_restrictions",

      # from plugin
      "has_external_documents_u_ubool",
      "has_rights_statements_u_ubool",
    ].each do |field|
      self[:enumeration_value].insert(:enumeration_id => enum, :value => field)
    end

    $stderr.puts("Adding date fields to the staff advanced search")
    enum = self[:enumeration].filter(:name => 'date_field_query_field').select(:id)
    [
      # from core
      "accession_date",

      # from plugin

    ].each do |field|
      self[:enumeration_value].insert(:enumeration_id => enum, :value => field)
    end

  end

end

