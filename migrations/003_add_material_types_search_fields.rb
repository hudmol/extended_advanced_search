Sequel.migration do

  up do
    $stderr.puts("Adding material type boolean fields to the staff advanced search")
    enum = self[:enumeration].filter(:name => 'boolean_field_query_field').select(:id)
    [
      "material_type_works_of_art_u_ubool",
      "material_type_audiovisual_materials_u_ubool",
      "material_type_books_u_ubool",
      "material_type_electronic_documents_u_ubool",
      "material_type_games_u_ubool",
      "material_type_microforms_u_ubool",
      "material_type_maps_u_ubool",
      "material_type_manuscripts_u_ubool",
      "material_type_photographs_u_ubool",
      "material_type_realia_u_ubool",
      "material_type_serials_u_ubool",
    ].each do |field|
      self[:enumeration_value].insert(:enumeration_id => enum, :value => field)
    end

    # And re-index all accessions
    [:accession].each do |table|
      self[table].update(:system_mtime => Time.now)
    end
  end

end

