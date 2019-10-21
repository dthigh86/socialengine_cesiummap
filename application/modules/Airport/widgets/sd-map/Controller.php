<?php

class Airport_Widget_SdMapController extends Engine_Content_Widget_Abstract
{
    public function indexAction(){
        if( !Engine_Api::_()->core()->hasSubject() ) {
            return $this->setNoRender();
        }

        $subject = Engine_Api::_()->core()->getSubject('airport');
        $this->view->airport = $subject;
    }

}