<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_Form_Admin_Airport_Create extends Engine_Form{
    
    public function init(){
        $this->setTitle("Create Airport");
        $this->setAttrib("class","global_form");
        
        $this->addElement('Text', 'title', array(
            'label' => 'Title',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->addElement('textarea', 'description', array(
            'label' => 'Description',
            'allowEmpty' => true,
            //'required' => true,
        ));
        $this->addElement('Text', 'country', array(
            'label' => 'Country',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->addElement('Text', 'region', array(
            'label' => 'Region',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->addElement('Text', 'icao', array(
            'label' => 'ICAO',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->addElement('Text', 'iata', array(
            'label' => 'IATA',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->addElement('Text', '777_200lr', array(
            'label' => '777-200LR',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->addElement('Text', '777_300er', array(
            'label' => '777-300ER',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->addElement('Text', '777f', array(
            'label' => '777F',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->addElement('Text', 'a380', array(
            'label' => 'A380',
            'allowEmpty' => false,
            'required' => true,
        ));
        
        $viewer = Engine_Api::_()->user()->getViewer();
        $this->addElement('hidden', 'owner_id', array(
            'value' => $viewer->getIdentity()
        ));
        
        $this->addElement('Button', 'submit', array(
            'label' => 'Submit',
            'type' => 'submit',
            'ignore' => true,
            'decorators' => array('ViewHelper')
        ));
    }
}