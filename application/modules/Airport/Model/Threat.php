<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_Model_Threat extends Core_Model_Item_Abstract
{
  protected $_parent_type = 'airport';
  protected $_owner_type = 'user';

  public function getParent($recurseType = null) {
      return Engine_Api::_()->getItem("airport", $this->airport_id);
  }
  public function getTitle() {
      return $this->getParent()->getTitle();
  }
  /**
   * Gets an absolute URL to the page to view this item
   *
   * @return string
   */
  public function getHref($params = array())
  {
    $params = array_merge(array(
      'route' => 'airport_threatprofile',
      'reset' => true,
      'threat_id' => $this->getIdentity(),
    ), $params);
    $route = $params['route'];
    $reset = $params['reset'];
    unset($params['route']);
    unset($params['reset']);
    return Zend_Controller_Front::getInstance()->getRouter()
      ->assemble($params, $route, $reset);
  }

  public function membership()
  {
    return new Engine_ProxyObject($this, Engine_Api::_()->getDbtable('membership', 'airport'));
  }

  /**
   * Gets a proxy object for the likes handler
   *
   * @return Engine_ProxyObject
   **/
  public function likes()
  {
    return new Engine_ProxyObject($this, Engine_Api::_()->getDbtable('likes', 'core'));
  }

  /**
   * Gets a proxy object for the comment handler
   *
   * @return Engine_ProxyObject
   * */
  public function comments()
  {
    return new Engine_ProxyObject($this, Engine_Api::_()->getDbtable('comments', 'core'));
  }
  
  public function getTotalVoteCount($formated = false){
      $proxyObject = Engine_Api::_()->getDbTable("votes","airport")->votes($this);
      $totalUpVoteCount = $proxyObject->getVoteCount(1);
      $totalDownVoteCount = $proxyObject->getVoteCount(0);
      $totalVoteCount = $totalUpVoteCount - $totalDownVoteCount;
      if(!$formated){
          return $totalVoteCount;
      }
      return Engine_Api::_()->airport()->formatCount($totalVoteCount);
  }
  public function getCommentCount($formated = false){
      $commentCount = $this->comments()->getCommentCount();
      if(!$formated){
          return $commentCount;
      }
      return Engine_Api::_()->airport()->formatCount($commentCount);
  }
  public function isVote($reactionType = 1, $user = null){
      if(empty($user)){
          $user = Engine_Api::_()->user()->getViewer();
      }
      $proxyObject = Engine_Api::_()->getDbTable("votes","airport")->votes($this);
      return $proxyObject->isVote($user,$reactionType);
  }
  
  public function getAuthorizationItem() {
      return $this->getParent();
  }
}