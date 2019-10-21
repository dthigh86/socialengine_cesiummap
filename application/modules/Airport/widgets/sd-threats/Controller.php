<?php

class Airport_Widget_SdThreatsController extends Engine_Content_Widget_Abstract{
    public function indexAction(){
        if(!Engine_Api::_()->core()->hasSubject()){
            return $this->setNoRender();
        }
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $subject = Engine_Api::_()->core()->getSubject();
        
        $phase = $request->getParam("phase");
        
        $table = Engine_Api::_()->getDbtable('expects', 'airport');
        $select = $table->select()
                ->where("airport_id = ?",$subject->getIdentity());

        if($phase){
            $select = $select->where("phase =?",$phase);
        }
        
        $this->view->paginator = $paginator = Zend_Paginator::factory($select);
        $paginator->setItemCountPerPage($this->_getParam("itemCountPerPage",10));
        $paginator->setCurrentPageNumber($request->getParam("page",1));
    } 
}