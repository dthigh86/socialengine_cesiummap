<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Pgservicelayer
 * @author     Stars Developer
 */

class Airport_Api_Reaction extends Core_Api_Abstract {
    public function toggleReaction(Core_Model_Item_Abstract $subject,$reactionType = 1){
        if(strtolower($reactionType) == "like" || strtolower($reactionType) == "upvote"){
            $reactionType = 1;
        }else if(strtolower($reactionType) == "dislike" || strtolower($reactionType) == "downvote"){
            $reactionType = 0;
        }
        $viewer = Engine_Api::_()->user()->getViewer();
        switch ($subject->getType()){            
            //VoteUp/VoteDown
            case "airport":
            case "airport_expect":
            case "airport_threat":
                $proxyObject = Engine_Api::_()->getDbTable("votes","airport")->votes($subject);
                $negativeVoteType = !$reactionType;
                if($proxyObject->isVote($viewer,$reactionType)){ //If voted; remove vote otherwise add vote and remove down vote
                    $proxyObject->removeVote($viewer,$reactionType);
                    if(!$proxyObject->isVote($viewer,$negativeVoteType)){
                        $proxyObject->addVote($viewer,$negativeVoteType);
                    }
                    
                }else{
                    if($proxyObject->isVote($viewer,$negativeVoteType)){
                        $proxyObject->removeVote($viewer,$negativeVoteType);
                    }
                    $proxyObject->addVote($viewer,$reactionType);
                }
                break;
            
            //Default: don't do anything
            default:
                break;
        }
    }
}