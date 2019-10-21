<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_AdminManageController extends Core_Controller_Action_Admin
{

  public function indexAction()
  {
    $this->view->navigation = $navigation = Engine_Api::_()->getApi('menus', 'core')
      ->getNavigation('airport_admin_main', array(), 'airport_admin_main_manage');

    if ($this->getRequest()->isPost())
    {
      $values = $this->getRequest()->getPost();
      foreach ($values as $key=>$value) {
        if ($key == 'delete_' . $value)
        {
          $airport = Engine_Api::_()->getItem('airport', $value);
          if(!empty($airport)){
              $airport->delete();
          }          
        }
      }
    }
    
    $page = $this->_getParam('page',1);
    $this->view->paginator = Engine_Api::_()->getItemTable('airport')->getAirportPaginator(array(
      'orderby' => 'admin_id',
    ));
    $this->view->paginator->setItemCountPerPage(25);
    $this->view->paginator->setCurrentPageNumber($page);
  }

  public function deleteAction()
  {
    // In smoothbox
    $this->_helper->layout->setLayout('admin-simple');
    $id = $this->_getParam('id');
    $this->view->airport_id=$id;
    // Check post
    if( $this->getRequest()->isPost())
    {
      $db = Engine_Db_Table::getDefaultAdapter();
      $db->beginTransaction();

      try
      {
        $airport = Engine_Api::_()->getItem('airport', $id);
        $airport->delete();
        $db->commit();
      }

      catch( Exception $e )
      {
        $db->rollBack();
        throw $e;
      }

      $this->_forward('success', 'utility', 'core', array(
          'smoothboxClose' => 10,
          'parentRefresh'=> 10,
          'messages' => array('')
      ));
    }
    // Output
    $this->renderScript('admin-manage/delete.tpl');
  }
  
  public function importAction(){
      $this->view->form = $form = new Airport_Form_Admin_Airport_Import();
      
      if(!$this->getRequest()->isPost()){
          return;
      }
      if(!$form->isValid($this->getRequest()->getPost())){
          return;
      }
      
      $table = Engine_Api::_()->getItemTable('airport');
      $db = $table->getDefaultAdapter();
      $db->beginTransaction();
      try{
          $file = $_FILES['Filedata'];
          $csvFilePath = APPLICATION_PATH . DIRECTORY_SEPARATOR . 'temporary'.DS.rand(999,9999999999999).".csv";
          if(move_uploaded_file($file["tmp_name"], $csvFilePath)){
              $table->importFile($csvFilePath);
          }else{
              return $form->addError("Error uploading file. Please check permissions on temporary folder.");
          }
          $db->commit();
          
          return $this->_forward('success', 'utility', 'core', array(
            'smoothboxClose' => 1000,
            'parentRefresh' => 10,
            'messages' => array('Airports have been imported.')
          ));
      } catch (Exception $ex) {
          $db->rollBack();
      }
  }
}