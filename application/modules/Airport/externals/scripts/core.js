/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


(function() { // START NAMESPACE
var $ = 'id' in document ? document.id : window.$;

en4.airport = {
    vote : function(element, parent_id, vote_type) {
        if(!en4.user.viewer.id){
            return;
        }
        var li = $(element).getParent("li");
        if(li.hasClass("primary")){
            return;
        }        
        var parent = $(element).getParent(".sd-threat-left-section");
        parent.getElements(".sd-vote").removeClass("primary");
        li.addClass("primary");
        var voteCountElement = parent.getElement(".sd-vote-count");
        en4.core.request.send(new Request.JSON({
            url : en4.core.baseUrl+'airport/expect/vote',
            data : {
                expect_id : parent_id,
                reactionType : vote_type,
                format: 'json'
            },
            onComplete: function(responseJSON) {
                voteCountElement.set("html",responseJSON.totalCount);
            }
        }));     
    },
    voteThreat : function(element, parent_id, vote_type) {
        if(!en4.user.viewer.id){
            return;
        }
        var li = $(element).getParent("li");
        if(li.hasClass("primary")){
            return;
        }        
        var parent = $(element).getParent(".sd-threat-left-section");
        parent.getElements(".sd-vote").removeClass("primary");
        li.addClass("primary");
        var voteCountElement = parent.getElement(".sd-vote-count");
        en4.core.request.send(new Request.JSON({
            url : en4.core.baseUrl+'airport/threat/vote',
            data : {
                threat_id : parent_id,
                reactionType : vote_type,
                format: 'json'
            },
            onComplete: function(responseJSON) {
                voteCountElement.set("html",responseJSON.totalCount);
            }
        }));     
    },
};

})(); // END NAMESPACE