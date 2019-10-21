<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_Form_Admin_Settings_Level extends Authorization_Form_Admin_Level_Abstract
{
  public function init()
  {
    parent::init();

    // My stuff
    $this
      ->setTitle('Member Level Settings');

    // Element: view
    $this->addElement('Radio', 'view', array(
      'label' => 'Allow Viewing of Airports?',
      'multiOptions' => array(
        1 => 'Yes, allow viewing and subscription of airports.',
        0 => 'No, do not allow airports to be viewed.',
      ),
      'value' => ( $this->isModerator() ? 2 : 1 ),
    ));
    if( !$this->isModerator() ) {
      unset($this->view->options[2]);
    }

    if( !$this->isPublic() ) {

      // Element: comment
      $this->addElement('Radio', 'comment', array(
        'label' => 'Allow Commenting on Airports?',
        'description' => 'Do you want to let members of this level comment on airports?',
        'multiOptions' => array(
          1 => 'Yes, allow members to comment on airports.',
          0 => 'No, do not allow members to comment on airports.',
        ),
        'value' => ( $this->isModerator() ? 2 : 1 ),
      ));
      if( !$this->isModerator() ) {
        unset($this->comment->options[2]);
      }

      // Element: auth_view
      $this->addElement('MultiCheckbox', 'auth_view', array(
        'label' => 'Airport Privacy',
        'multiOptions' => array(
          'everyone' => 'Everyone',
          'registered' => 'Registered Members',
        )
      ));

      // Element: auth_comment
      $this->addElement('MultiCheckbox', 'auth_comment', array(
        'label' => 'Airport Comment Options',
        'multiOptions' => array(
          'everyone' => 'Everyone',
          'registered' => 'Registered Members',
        )
      ));
    }
  }
}