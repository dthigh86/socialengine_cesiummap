<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */


return array(
    array(
        'title' => 'Sd Map',
        'description' => 'Display Map Info',
        'category' => 'Airport',
        'type' => 'widget',
        'name' => 'airport.sd-map',
    ),
    array(
        'title' => 'Sd Threats',
        'description' => 'Display threats',
        'category' => 'Airport',
        'type' => 'widget',
        'name' => 'airport.sd-threats',
        'isPaginated' => true,
        'defaultParams' => array(
            'itemCountPerPage' => '10',
        ),
        'requirements' => array(
            'subject' => 'airport',
        ),
    ),
    array(
        'title' => 'Sd Past Incident Accidents',
        'description' => 'Display Past Incident Accidents',
        'category' => 'Airport',
        'type' => 'widget',
        'name' => 'airport.sd-past-incident-accidents',
        'isPaginated' => true,
        'defaultParams' => array(
            'itemCountPerPage' => '10',
        ),
        'requirements' => array(
            'subject' => 'airport',
        ),
    ),
    array(
        'title' => 'Home Page',
        'description' => 'Display airports search',
        'category' => 'Airport',
        'type' => 'widget',
        'name' => 'airport.home-page',        
    ),
    array(
        'title' => 'Header Search',
        'description' => 'Display airports search',
        'category' => 'Airport',
        'type' => 'widget',
        'name' => 'airport.header-search',        
    ),
    array(
        'title' => 'Profile Expects',
        'description' => 'Display Profile Expects',
        'category' => 'Airport',
        'type' => 'widget',
        'name' => 'airport.sd-profile-expects',
        'requirements' => array(
            'subject' => 'user',
        ),
    ),
    array(
        'title' => 'Profile Threats',
        'description' => 'Display Profile Threats',
        'category' => 'Airport',
        'type' => 'widget',
        'name' => 'airport.sd-profile-threats',
        'requirements' => array(
            'subject' => 'user',
        ),
    ),
) ?>