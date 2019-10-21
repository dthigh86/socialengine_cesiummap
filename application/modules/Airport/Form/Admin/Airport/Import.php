<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_Form_Admin_Airport_Import extends Engine_Form
{
    public function init(){
        $this->setTitle("Import Airports");
        $this->setAttrib("class","global_form_popup");
        
        $this->addElement('File', 'Filedata', array(
            'label' => 'Csv File',
            'required' => true,
            'AllowEmpty' => false
        ));
        $this->Filedata->addValidator('Extension', false, 'csv');
        
        $this->addElement('Button', 'submit', array(
            'label' => 'Start Import',
            'type' => 'submit',
            'ignore' => true,
            'decorators' => array('ViewHelper')
        ));

        $this->addElement('Cancel', 'cancel', array(
            'label' => 'cancel',
            'link' => true,
            'prependText' => ' or ',
            'href' => '',
            'onClick'=> 'javascript:parent.Smoothbox.close();',
            'decorators' => array(
              'ViewHelper'
            )
        ));
        $this->addDisplayGroup(array('submit', 'cancel'), 'buttons');
    }
}