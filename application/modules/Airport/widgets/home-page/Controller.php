<?php

class Airport_Widget_HomePageController extends Engine_Content_Widget_Abstract
{
  public function indexAction()
  {
      $searchApi = Engine_Api::_()->getApi('search', 'core');      
      
      // check public settings
      $require_check = Engine_Api::_()->getApi('settings', 'core')->core_general_search;
      if( !$require_check && !Zend_Controller_Action_HelperBroker::getStaticHelper('RequireUser')->checkRequire() ) {
        $this->setNoRender();
        return;
      }
        
      // Prepare form
      $this->view->form = $form = new Core_Form_Search();
      
      
      // Get available types
      $availableTypes = $searchApi->getAvailableTypes();
      if( is_array($availableTypes) && count($availableTypes) > 0 ) {
        $options = array();
        foreach( $availableTypes as $index => $type ) {
          $options[$type] = strtoupper('ITEM_TYPE_' . $type);
          }
        $form->type->addMultiOptions($options);
      } else {
        $form->removeElement('type');
        }       
        
      // Check form validity?
      $values = array();
      if( $form->isValid($this->_getAllParams()) ) {
        $values = $form->getValues();
        }
      $this->view->query = $query = (string) @$values['query'];
      $this->view->type = $type = (string) @$values['type'];
      $this->view->page = $page = (int) $this->_getParam('page');
      if( $query ) {
        $this->view->paginator = $searchApi->getPaginator($query, $type);
        $this->view->paginator->setCurrentPageNumber($page);
        }
        
      $this->view->viewer = $viewer = Engine_Api::_()->user()->getViewer();

    $require_check = Engine_Api::_()->getApi('settings', 'core')->core_general_search;
    if(!$require_check){
      if( $viewer->getIdentity()){
        $this->view->search_check = true;
      }
      else{
        $this->view->search_check = false;
      }
    }
    else $this->view->search_check = true;        
      } 
}