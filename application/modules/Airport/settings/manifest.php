<?php return array (
  'package' => 
  array (
    'type' => 'module',
    'name' => 'airport',
    'version' => '4.10.3p6',
    'path' => 'application/modules/Airport',
    'title' => 'SD - Airports',
    'description' => 'SD - Airports',
    'author' => 'Stars Developer',
    'callback' => 
    array (
      'class' => 'Engine_Package_Installer_Module',
    ),
    'actions' => 
    array (
      0 => 'install',
      1 => 'upgrade',
      2 => 'refresh',
      3 => 'enable',
      4 => 'disable',
    ),
    'directories' => 
    array (
      0 => 'application/modules/Airport',
    ),
    'files' => 
    array (
      0 => 'application/languages/en/airport.csv',
    ),
  ),
  // Items ---------------------------------------------------------------------
  'items' => array(
    'airport',
    'airport_expect',
    'airport_threat',
  ),
  // Routes --------------------------------------------------------------------
  'routes' => array(
    'airport_extended' => array(
      'route' => 'airports/:controller/:action/*',
      'defaults' => array(
        'module' => 'airport',
        'controller' => 'index',
        'action' => 'index',
      ),
      'reqs' => array(
        'controller' => '\D+',
        'action' => '\D+',
      )
    ),
    'airport_general' => array(
      'route' => 'airports/:action/*',
      'defaults' => array(
        'module' => 'airport',
        'controller' => 'index',
        'action' => 'browse',
      ),
      'reqs' => array(
        'action' => '(suggest)',
      )
    ),
    'airport_specific' => array(
      'route' => 'airports/:action/:airport_id/*',
      'defaults' => array(
        'module' => 'airport',
        'controller' => 'airport',
        'action' => 'index',
      ),
      'reqs' => array(
        'action' => '(edit|delete|join|leave|cancel|accept|invite|style)',
        'airport_id' => '\d+',
      )
    ),
    'airport_profile' => array(
      'route' => 'airport/:id/:slug/*',
      'defaults' => array(
        'module' => 'airport',
        'controller' => 'profile',
        'action' => 'index',
        'slug' => '',
      ),
      'reqs' => array(
        'id' => '\d+',
      )
    ),
    'airport_expectprofile' => array(
      'route' => 'airport/expect/:action/:expect_id/*',
      'defaults' => array(
        'module' => 'airport',
        'controller' => 'expect',
        'action' => 'view',
      ),
      'reqs' => array(
        'expect_id' => '\d+',
      )
    ),
    'airport_threatprofile' => array(
      'route' => 'airport/threat/:action/:threat_id/*',
      'defaults' => array(
        'module' => 'airport',
        'controller' => 'threat',
        'action' => 'view',
      ),
      'reqs' => array(
        'threat_id' => '\d+',
      )
    ),
  )
); ?>