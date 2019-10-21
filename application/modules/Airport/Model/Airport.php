<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_Model_Airport extends Core_Model_Item_Abstract
{
  protected $_parent_type = 'user';

  protected $_owner_type = 'user';

  /**
   * Gets an absolute URL to the page to view this item
   *
   * @return string
   */
  public function getHref($params = array())
  {
    $params = array_merge(array(
      'route' => 'airport_profile',
      'reset' => true,
      'id' => $this->getIdentity(),
      'slug' => $this->getSlug(),
    ), $params);
    $route = $params['route'];
    $reset = $params['reset'];
    unset($params['route']);
    unset($params['reset']);
    return Zend_Controller_Front::getInstance()->getRouter()
      ->assemble($params, $route, $reset);
  }

  public function getParent($recurseType = null)
  {
    return $this->getOwner('user');
  }

  public function setPhoto($photo)
  {
    if( $photo instanceof Zend_Form_Element_File ) {
      $file = $photo->getFileName();
    } else if( is_array($photo) && !empty($photo['tmp_name']) ) {
      $file = $photo['tmp_name'];
    } else if( is_string($photo) && file_exists($photo) ) {
      $file = $photo;
    } else {
      throw new Airport_Model_Exception('invalid argument passed to setPhoto');
    }

    $name = basename($file);
    $path = APPLICATION_PATH . DIRECTORY_SEPARATOR . 'temporary';
    $params = array(
      'parent_type' => 'airport',
      'parent_id' => $this->getIdentity()
    );
    
    // Save
    $storage = Engine_Api::_()->storage();
    
    // Resize image (main)
    $image = Engine_Image::factory();
    $image->open($file)
      ->resize(720, 720)
      ->write($path.'/m_'.$name)
      ->destroy();

    // Resize image (profile)
    $image = Engine_Image::factory();
    $image->open($file)
      ->resize(330, 660)
      ->write($path.'/p_'.$name)
      ->destroy();

    // Resize image (normal)
    $image = Engine_Image::factory();
    $image->open($file)
      ->resize(140, 160)
      ->write($path.'/in_'.$name)
      ->destroy();

    // Resize image (icon)
    $image = Engine_Image::factory();
    $image->open($file);

    $size = min($image->height, $image->width);
    $x = ($image->width - $size) / 2;
    $y = ($image->height - $size) / 2;

    $image->resample($x, $y, $size, $size, 48, 48)
      ->write($path.'/is_'.$name)
      ->destroy();

    // Store
    $iMain = $storage->create($path.'/m_'.$name, $params);
    $iProfile = $storage->create($path.'/p_'.$name, $params);
    $iIconNormal = $storage->create($path.'/in_'.$name, $params);
    $iSquare = $storage->create($path.'/is_'.$name, $params);

    $iMain->bridge($iProfile, 'thumb.profile');
    $iMain->bridge($iIconNormal, 'thumb.normal');
    $iMain->bridge($iSquare, 'thumb.icon');

    // Remove temp files
    @unlink($path.'/p_'.$name);
    @unlink($path.'/m_'.$name);
    @unlink($path.'/in_'.$name);
    @unlink($path.'/is_'.$name);

    // Update row
    $this->modified_date = date('Y-m-d H:i:s');
    $this->photo_id = $iMain->file_id;
    $this->save();

    return $this;
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

  // Internal hooks

  protected function _postInsert()
  {
    if( $this->_disableHooks ) return;
    
    parent::_postInsert();
    
    // Create auth stuff
    $context = Engine_Api::_()->authorization()->context;
    foreach( array('everyone', 'registered', 'member') as $role ) {
      $context->setAllowed($this, $role, 'view', true);
    }
  }

  protected function _delete()
  {
    if( $this->_disableHooks ) return;

    //Delete other data
    
    parent::_delete();
  }
}