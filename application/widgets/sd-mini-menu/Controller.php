<?php

class Widget_SdMiniMenuController extends Engine_Content_Widget_Abstract
{
  public function indexAction()
  {
    $this->view->viewer = $viewer = Engine_Api::_()->user()->getViewer();
    
    $this->view->navigation = $navigation = Engine_Api::_()
      ->getApi('menus', 'core')
      ->getNavigation('core_mini');

    $request = Zend_Controller_Front::getInstance()->getRequest();
    $this->view->notificationOnly = $request->getParam('notificationOnly', false);
    $this->view->updateSettings = Engine_Api::_()->getApi('settings', 'core')->getSetting('core.general.notificationupdate');
    $this->view->showIcons = $this->_getParam('show_icons', 1);
    
     $this->getElement()->setAttrib('class', 'layout_core_menu_mini');
  }
}