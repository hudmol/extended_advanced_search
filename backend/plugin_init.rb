if !AppConfig[:plugins].include?("material_types")

  puts <<EOF

************************************************************************
***
*** PLUGIN ERROR:
***
*** The extended_advanced_search plugin depends on the material_types
*** plugin.  Please copy this plugin to the `plugins` directory and
*** update your AppConfig[:plugins] configuration.
***
************************************************************************

EOF

  raise "Plugin error: extended_advanced_search requires material_types"
end