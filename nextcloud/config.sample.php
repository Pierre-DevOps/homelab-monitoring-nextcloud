<?php
$CONFIG = array (
  'instanceid' => 'xxxxxxxxxxxx',
  'passwordsalt' => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  'secret' => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  'trusted_domains' =>
  array (
    0 => 'IP_SERVEUR',
    1 => 'nextcloud.lab.local',
    2 => 'IP_CLIENT',
  ),
  'datadirectory' => '/var/www/nextcloud/data',
  'dbtype' => 'mysql',
  'version' => '32.0.2.2',
  'overwrite.cli.url' => 'http://IP_SERVEUR',
  'dbname' => 'nextcloud',
  'dbhost' => 'localhost',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'MOT_DE_PASSE_BDD',
  'installed' => true,
  'allow_local_remote_servers' => true,
  'overwriteprotocol' => 'http',
  'overwritehost' => 'IP_SERVEUR',
  'trusted_proxies' =>
  array (
    0 => 'IP_CLIENT',
  ),
);