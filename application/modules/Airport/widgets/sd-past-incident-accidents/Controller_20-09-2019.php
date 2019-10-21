<?php

class Airport_Widget_SdPastIncidentAccidentsController extends Engine_Content_Widget_Abstract{
    public function indexAction(){
        if(!Engine_Api::_()->core()->hasSubject()){
            return $this->setNoRender();
        }
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $subject = Engine_Api::_()->core()->getSubject();
        $table = Engine_Api::_()->getDbtable('threats', 'airport');
        if($request->getParam("format") != "html"){
            $table->import($subject);
        }        
        
        $select = $table->select()
                ->where("airport_id = ?",$subject->getIdentity())
                ->where("imported = ?",0)
                ;
        
        $this->view->paginator = $paginator = Zend_Paginator::factory($select);
        $paginator->setItemCountPerPage($this->_getParam("itemCountPerPage",10));
        $paginator->setCurrentPageNumber($request->getParam("page",1));
        
        
        $selectThreats = $table->select()
                ->where("airport_id = ?",$subject->getIdentity())
                ->where("imported = ?",1)
                ;
        
        $this->view->threats = $threats = Zend_Paginator::factory($selectThreats);
        $threats->setItemCountPerPage($this->_getParam("itemCountPerPage",10));
        $threats->setCurrentPageNumber($request->getParam("page",1));
    } 
}