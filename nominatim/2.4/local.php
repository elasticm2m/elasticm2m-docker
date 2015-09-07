<?php
   // Configure Postgres/Postgis versions
   @define('CONST_Postgresql_Version', '9.3');
   @define('CONST_Postgis_Version', '2.1');

   // Use upgraded version of Osmosis
   @define('CONST_Osmosis_Binary', '/usr/bin/osmosis');

   // Configure base URL for the nominatim website
   @define('CONST_Website_BaseURL', '/');

   // Configure the target update file and update intervals
   //@define('CONST_Replication_Url', 'http://download.geofabrik.de/europe-updates');
   //@define('CONST_Replication_MaxInterval', '86400');     // Process each update separately, osmosis cannot merge multiple updates
   //@define('CONST_Replication_Update_Interval', '86400');  // How often upstream publishes diffs
   //@define('CONST_Replication_Recheck_Interval', '900');   // How long to sleep if no update found yet
