<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_ThreatController extends Core_Controller_Action_Standard
{
  public function init()
  {
    // @todo this may not work with some of the content stuff in here, double-check
    $subject = null;
    if( !Engine_Api::_()->core()->hasSubject() )
    {
      $id = $this->_getParam('id');
      if( null !== $id )
      {
        $subject = Engine_Api::_()->getItem('airport', $id);
        if( $subject && $subject->getIdentity() )
        {
          Engine_Api::_()->core()->setSubject($subject);
        }
        $this->_helper->requireSubject('airport');
      }else{
          $expect_id = $this->getParam("threat_id");
          $subject = Engine_Api::_()->getItem('airport_threat', $expect_id);
          if( $subject && $subject->getIdentity() ){
            Engine_Api::_()->core()->setSubject($subject);
          }
          $this->_helper->requireSubject('airport_threat');
      }
      
    }
  }

  public function viewAction(){
      $this->view->threat = $subject = Engine_Api::_()->core()->getSubject();
      
      $this->_helper->content
        //->setNoRender()
        ->setEnabled()
        ;
  }
  
  public function createAction()
  {
    $viewer = Engine_Api::_()->user()->getViewer();
    if(!$this->getRequest()->isPost() || !$viewer->getIdentity()){
        return;
    }
    
    $body = $this->getParam("body");
    if(empty(trim($body))){
        return;
    }
    $phase = $this->getParam("phase");
    if(empty($phase)){
        //$phase = "All Planes";
    }
    $subject = Engine_Api::_()->core()->getSubject();
    
    $db = $subject->getTable()->getAdapter();
    $db->beginTransaction();
    try{
        $table = Engine_Api::_()->getDbtable('threats', 'airport');
        $row = $table->createRow();
        $row->setFromArray(array(
            'airport_id' => $subject->getIdentity(),
            'owner_id' => $viewer->getIdentity(),
            'body' => $body,
            'phase' => $phase,
            'imported' => 0
        ));
        $row->save();
        
        $db->commit();
        $this->view->body = $this->view->partial(
            '_threatRow.tpl',
            'airport',
            array('threat' => $row)
        );
    } catch (Exception $ex) {
        $db->rollBack();
        throw $ex;
    }
  }
  
  public function voteAction(){
    $viewer = Engine_Api::_()->user()->getViewer();
    if(!$this->getRequest()->isPost() || !$viewer->getIdentity()){
        return;
    }
    
    $subject = Engine_Api::_()->core()->getSubject();
    $db = $subject->getTable()->getAdapter();
    $db->beginTransaction();
    try{
        $reactionType = $this->getParam("reactionType");
        Engine_Api::_()->getApi("reaction","airport")->toggleReaction($subject,$reactionType);  
        
        if($reactionType == "upvote" && $viewer->getIdentity() != $subject->getOwner()->getIdentity() ){
            Engine_Api::_()->getDbtable('notifications', 'activity')
                ->addNotification($subject->getOwner(), $viewer, $subject, 'threat_upvote', array(
                    'label' => $subject->getShortType()
                ));
        }
        $db->commit();
        $this->view->totalCount = $subject->getTotalVoteCount(true);
    } catch (Exception $ex) {
        $db->rollBack();
        throw $ex;
    }
  }
  
  public function deleteAction()
  {
    $viewer = Engine_Api::_()->user()->getViewer();
    $subject = Engine_Api::_()->core()->getSubject();
    if(!$subject->isOwner($viewer) && !$viewer->isAdmin()){
        return $this->_helper->requireAuth()->forward();
    }

    // In smoothbox
    $this->_helper->layout->setLayout('default-simple');
    
    // Make form
    $this->view->form = $form = new Airport_Form_Threat_Delete();
    
    if( !$subject )
    {
      $this->view->status = false;
      $this->view->error = Zend_Registry::get('Zend_Translate')->_("Threat doesn't exists or not authorized to delete");
      return;
    }

    if( !$this->getRequest()->isPost() )
    {
      $this->view->status = false;
      $this->view->error = Zend_Registry::get('Zend_Translate')->_('Invalid request method');
      return;
    }

    $db = $subject->getTable()->getAdapter();
    $db->beginTransaction();

    try {
      $subject->delete();
      Engine_Api::_()->core()->clearSubject();

      $db->commit();
    } catch( Exception $e ) {
      $db->rollBack();
      throw $e;
    }

    $this->view->status = true;
    $this->view->threat = $subject;
    $this->view->message = Zend_Registry::get('Zend_Translate')->_('The selected threat has been deleted.');
    $this->view->closeSmoothbox = 1;
  }
}