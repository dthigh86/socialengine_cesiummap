<?php


class Airport_Form_Admin_Airport_Edit extends Airport_Form_Admin_Airport_Create {

    public $_error = array();
    protected $_item;

    public function getItem(){
        return $this->_item;
    }

    public function setItem(Core_Model_Item_Abstract $item){
        $this->_item = $item;
        return $this;
    }

    public function init() {
        parent::init();
        $this->setTitle('Edit Airport');

        $this->submit->setLabel('Save Changes');
    }
}