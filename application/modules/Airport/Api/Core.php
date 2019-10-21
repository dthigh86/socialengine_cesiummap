<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_Api_Core extends Core_Api_Abstract
{
    public function formatCount($count = 0){
        if(empty($count) || ($count < 1000 && $count > -1000)){
            return (int)$count;
        }
        
        if($count > 0){
            if($count >= 1000 && $count < 1000000){
                return ($count/1000)."K";
            }
            if($count >= 1000000 && $count < 1000000000){
                return ($count/1000000)."M";
            }
            return ($count/1000000000)."B";
        }
        
        $count = abs($count);
        if($count >= 1000 && $count < 1000000){
            return -($count/1000)."K";
        }
        if($count >= 1000000 && $count < 1000000000){
            return -($count/1000000)."M";
        }
        return -($count/1000000000)."B";
    }
}