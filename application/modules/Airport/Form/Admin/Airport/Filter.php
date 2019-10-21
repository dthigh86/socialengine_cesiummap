<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_Form_Admin_Airport_Filter extends Engine_Form{
    
    public function init(){
        $this
            ->setTitle("Filter Airports")
            ->setAttrib("class","global_form sd-filter-airport")
            ->setMethod('GET');
        
        $this->addElement('Text', 'title', array(
            'label' => 'Title',
        ));
        $this->addElement('Text', 'country', array(
            'label' => 'Country',
        ));
        $this->addElement('Text', 'region', array(
            'label' => 'Region',
        ));
        $this->addElement('Text', 'icao', array(
            'label' => 'ICAO',
        ));
        $this->addElement('Text', 'iata', array(
            'label' => 'IATA',
        ));
        
        $this->addElement('Button', 'submit', array(
            'label' => 'Submit',
            'type' => 'submit',
            'ignore' => true,
            'decorators' => array('ViewHelper')
        ));
    }
}