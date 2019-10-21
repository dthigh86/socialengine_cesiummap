<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_IndexController extends Core_Controller_Action_Standard
{
  public function indexAction()
  {
    $this->view->someVar = 'someVal';
  }
  
  public function suggestAction(){
      $table = Engine_Api::_()->getItemTable('airport');
      $tableName = $table->info("name");
      $select = $table->select();
      if( 0 < ($limit = (int) $this->_getParam('limit', 10)) ) {
        $select->limit($limit);
      }

      if( null !== ($text = $this->_getParam('search', $this->_getParam('value'))) ) {
        $select->where("`$tableName`.`title` LIKE ? OR `$tableName`.`country` LIKE ? OR `$tableName`.`region` LIKE ? OR `$tableName`.`icao` LIKE ? OR `$tableName`.`iata` LIKE ?", '%'. $text .'%');
      }
      $airports = $table->fetchAll($select);
      $data = array();
      foreach($airports as $airport){
          $data[] = array(
            'type'  => 'user',
            'id'    => $airport->getIdentity(),
            'guid'  => $airport->getGuid(),
            'label' => $airport->getTitle(),
            'photo' => $this->view->itemPhoto($airport, 'thumb.icon'),
            'url'   => $airport->getHref(),
            'iata' => $airport->iata
        );
      }
      if( $this->_getParam('sendNow', true) ) {
        return $this->_helper->json($data);
      } else {
        $this->_helper->viewRenderer->setNoRender(true);
        $data = Zend_Json::encode($data);
        $this->getResponse()->setBody($data);
      }
  }
}
