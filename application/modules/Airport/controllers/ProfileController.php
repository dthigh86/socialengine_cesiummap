<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_ProfileController extends Core_Controller_Action_Standard
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
      }
    }

    $viewer = Engine_Api::_()->user()->getViewer();
    $this->_helper->requireSubject('airport');
  }

  public function indexAction()
  {
    $subject = Engine_Api::_()->core()->getSubject();
    $viewer = Engine_Api::_()->user()->getViewer();
    
    // Increment view count
    if( !$subject->getOwner()->isSelf($viewer) )
    {
      $subject->view_count++;
      $subject->save();
    }

    // Render
    $this->_helper->content
        ->setNoRender()
        ->setEnabled()
        ;
  }
}