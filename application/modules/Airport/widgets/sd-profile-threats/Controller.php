<?php

class Airport_Widget_SdProfileThreatsController extends Engine_Content_Widget_Abstract{
    
    protected $_childCount;
    public function indexAction(){
        // Don't render this if not authorized
        $viewer = Engine_Api::_()->user()->getViewer();
        if( !Engine_Api::_()->core()->hasSubject() ) {
            return $this->setNoRender();
        }

        // Get subject and check auth
        $subject = Engine_Api::_()->core()->getSubject('user');
        if( !$subject->authorization()->isAllowed($viewer, 'view') ) {
            return $this->setNoRender();
        }
        
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $table = Engine_Api::_()->getDbtable('threats', 'airport');
         
        $select = $table->select()
                ->where("owner_id = ?",$subject->getIdentity())
                ->where("imported = ?",0)
                ;
        
        $this->view->paginator = $paginator = Zend_Paginator::factory($select);
        $paginator->setItemCountPerPage($this->_getParam("itemCountPerPage",10));
        $paginator->setCurrentPageNumber($request->getParam("page",1));
        
        if( $paginator->getTotalItemCount() > 0 ) {
            $this->_childCount = $paginator->getTotalItemCount();
        }
        
    } 
    public function getChildCount(){
        return $this->_childCount;
    }
}