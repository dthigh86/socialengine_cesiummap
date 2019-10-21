<?php

class Widget_SdLandingPageController extends Engine_Content_Widget_Abstract
{
  public function indexAction()
  {
    $this->view->login_form = $form = new User_Form_Login();
    $this->view->signup_form = $form = new User_Form_Signup_Account();

     return;
  }
}