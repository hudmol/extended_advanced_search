ArchivesSpace Advanced Search Extension
===============

This is an ArchivesSpace plugin to extend the advanced search to index and allow searching on a series of extra record fields.

## Getting Started

Download the latest release from the Releases tab in Github:

  https://github.com/hudmol/extended_advanced_search/releases

Unzip the release and move it to:

    /path/to/archivesspace/plugins

Unzip it:

    $ cd /path/to/archivesspace/plugins
    $ unzip extended_advanced_search.zip -d extended_advanced_search

Enable the plugin by editing the file in `config/config.rb`:

    AppConfig[:plugins] = ['some_plugin', 'extended_advanced_search']

(Make sure you uncomment this line (i.e., remove the leading '#' if present))

See also:

  https://github.com/archivesspace/archivesspace/blob/master/plugins/README.md

You will need to shutdown archivesspace and migrate the database:

     $ cd /path/to/archivesspace
     $ scripts/setup-database.sh

See also:

  https://github.com/archivesspace/archivesspace/blob/master/UPGRADING.md




  
