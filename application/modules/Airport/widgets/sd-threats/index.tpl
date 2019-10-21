<style type="text/css">
.sd-threats-listing-content a{
    cursor: pointer;
    text-decoration: none;
}
.sd-threat-left-section .sd-upvote a:before {
    content: "\f062";
    font-family: fontawesome;
    font-size: 17px;
    color: #646d73;
}
.sd-threat-left-section .sd-downvote a:before {
    content: "\f063";
    font-family: fontawesome;
    font-size: 17px;
    color: #646d73;
}
.sd-vote-count {
    width: 25px;
    color: #1A1A1B;
    font-weight: bold;
}
.sd-threat-left-section li{
    display: inline-block;
    vertical-align: middle;
}
.sd-threat-left-section>ul{
    text-align: center;
}
.sd-threats-section {
    background-color: #2c4961;
    padding: 10px 5px;
    box-sizing: border-box;
    text-align: center;
    position: relative;
}
.sd-threats-listing-content {
    overflow: hidden;
    background-color: #f0f7fd;
}
.sd-threat-left-section {
    float: left;
    width: 70px;
    padding: 8px 2px;
    box-sizing: border-box;
}
.sd-threat-right-section {
    overflow: hidden;
    background-color: #fff;
    padding: 8px 10px;
    box-sizing: border-box;
}
.sd-threat-title a{
    color: #444e59;
    font-weight: bold;
    font-size: 16px;
}
.sd-threat-category a {
    color: #444e59;
    font-weight: 600;
}
.sd-threat-info>li{
    display: inline-block;
    vertical-align: top;
}
.sd-threat-date,
.sd-threat-date a,
.sd-threat-date span{
    color: #787C7E;
    text-decoration: none;
}
h3.sd-threat-title {
    padding: 0px;
    margin-bottom: 0px;
}
.sd-threat-category:after {
    content: "-";
    margin-left: 5px;
    margin-right: 5px;
    color: #787C7E;    
}
.sd-threat-content-left-section {
    float: left;
    width: 90%;
}
.sd-threat-content-right-section {
    float: right;
}
.sd-threat-comments-count {
    color: #646d73;
    font-weight: bold;
}
.sd-threat-comments-count:before {
    content: "\f27a";
    font-family: fontawesome;
    margin-right: 4px;
}
.sd-threat-options>a:before {
    content: "\f141";
    font-family: fontawesome;
    color: #646d73;
}
.sd-threat-comments-count {
    min-width: 60px;
    margin-right: 10px;
    color: #646d73 !important;
}
.sd-threat-comments-count:hover {
    color: #1c2735 !important;    
}
.sd-threat-content-right-section>ul>li {
    display: inline-block;
    vertical-align: middle;
}
.sd-threats-options-active .sd-threats-options-lists{
    display: block !Important;
}
.sd-threats-options-lists {
    position: absolute;
    background-color: #eee;
    border-radius: 10px;
    margin-left: -75px;
    margin-top: 5px;
    padding: 3px 5px;
    box-sizing: border-box;
    z-index: 1;
    max-width: 100px;
    width: 100%;
}
.sd-threats-options-lists a {
    color: #444e59;
    font-weight: 600;
    padding: 4px 10px;
    box-sizing: border-box;
    display: block;
}
.sd-threats-options-lists:before {
    content: "";
    border-color: transparent transparent #eeeeee transparent;
    border-style: solid;
    border-width: 0px 10px 10px 10px;
    height: 0px;
    width: 0px;
    position: absolute;
    top: -10px;
    right: 10px;
}
.sd-threats-options-lists>li+li {
    border-top: 1px solid #fff;
}
.sd-threats-input-section {
    overflow: hidden;
    padding: 20px 10px 10px;
    box-sizing: border-box;
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-direction: row;
}

.sd-threats-input-section .sd-filter-options {
    max-width: 100px;
    width: 100%;
}
.sd-threats-input-section input {
    font-size: 16px;
    line-height: 24px;
    text-align: left;
    outline: none;
    border: none;
    padding: 10px;
    width: 78%;
    border-radius: 20px;
    box-sizing: border-box;
}
.sd-threats-section>h3 {
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    padding: 0px;
    display: inline-block;
}
.sd-threats-input-section button {
    border-radius: 20px;
    background-color: transparent;
    border: 2px solid #fff;
    padding: 5px 10px;
    text-transform: CAPITALIZE;
    max-width: 100px;
    width: 100%;
    outline: none;
    font-size: 14px;
    line-height: 18px;
    box-sizing: border-box;
}
.sd-threats-input-section button img {
    margin-left: 5px;
    vertical-align: middle;    
}
.sd-filter-options-active .sd-filter-options-lists{
    display: block !Important;
}
.sd-filter-options>a {
    padding: 5px;
    box-sizing: border-box;
    display: inline-block;
    border: 2px solid #fff;
    width: 100%;
    text-align: center;
    font-size: 14px;
    line-height: 18px;
}
.sd-filter-options>a:hover{
    color: #fff;
}
.sd-filter-options-lists {
    position: absolute;
    background-color: #eee;
    border-radius: 10px;
    margin-top: 12px;
    padding: 3px 5px;
    z-index: 1;
    max-width: 110px;
    width: 100%;
    box-sizing: border-box;
}
.sd-filter-options-lists a {
    color: #444e59;
    font-weight: 600;
    padding: 4px 10px;
    box-sizing: border-box;
    display: block;
}
.sd-filter-options-lists>li+li {
    border-top: 1px solid #fff;
}
.sd-filter-options>a:after {
    content: "\f0d7";
    font-family: fontawesome;
    padding-left: 6px;
    font-size: 18px;
    vertical-align: middle;
}
.sd-filter-options-lists:before {
    content: "";
    border-color: transparent transparent #eeeeee transparent;
    border-style: solid;
    border-width: 0px 10px 10px 10px;
    height: 0px;
    width: 0px;
    position: absolute;
    top: -10px;
    right: 10px;
}
.sd-threats-listings>li+li {
    border-top: 1px solid #f5f5f5;
}
.sd-expects-filter-section,
.sd-threats-filter-section{
    position: absolute;
    right: 5px;
    top: 14px;
    max-width: 200px;
    width: 100%;
}
.sd-expects-filter-options,
.sd-threats-filter-options{
    text-align: right;
}
.sd-expects-filter-options:before,
.sd-threats-filter-options:before{
    content: "\f0b0";
    font-family: fontawesome;
    display: inline;
    margin-right: 3px;
}
.sd-expects-filter-options>a,
.sd-threats-filter-options>a{
    padding: 3px 5px;
    box-sizing: border-box;
    border: 2px solid #fff;
    width: 100%;
    text-align: center;
    font-size: 14px;
    line-height: 18px;
    display: inline;
    color: #fff;
}
.sd-expects-filter-options>a:after,
.sd-threats-filter-options>a:after {
    content: "\f0d7";
    font-family: fontawesome;
    padding-left: 6px;
    font-size: 18px;
    vertical-align: middle;
}
.sd-expects-filter-options-lists,
.sd-threats-filter-options-lists{
    position: absolute;
    background-color: #eee;
    border-radius: 10px;
    margin-top: 12px;
    right: -2px;
    padding: 3px 5px;
    z-index: 2;
    max-width: 110px;
    width: 100%;
    box-sizing: border-box;
}
.sd-expects-filter-options-lists:before,
.sd-threats-filter-options-lists:before{
    content: "";
    border-color: transparent transparent #eeeeee transparent;
    border-style: solid;
    border-width: 0px 10px 10px 10px;
    height: 0px;
    width: 0px;
    position: absolute;
    top: -10px;
    right: 10px;
}
.sd-expects-filter-options-active .sd-expects-filter-options-lists,
.sd-threats-filter-options-active .sd-threats-filter-options-lists{
    display: block !important;
}
.sd-expects-filter-options-lists>li+li,
.sd-threats-filter-options-lists>li+li{
    border-top: 1px solid #fff;
}
.sd-expects-filter-options-lists a,
.sd-threats-filter-options-lists a{
    color: #444e59;
    font-weight: 600;
    padding: 4px 10px;
    box-sizing: border-box;
    display: block;
    text-align: left;
}
.sd-threats-listings .tip{
    background-color: #fff;
    padding: 8px 10px;
    box-sizing: border-box;
    color: #444e59;
    font-weight: bold;
    font-size: 16px;
}
@media only screen and (max-width: 1200px){
    .sd-threats-input-section input{ width: 65%; }
}
@media only screen and (max-width: 800px){
    .sd-threats-section>h3 { font-size: 20px; }
    .sd-threat-left-section .sd-upvote a:before,
    .sd-threat-left-section .sd-downvote a:before { font-size: 16px; }
    .sd-threats-input-section { padding: 20px 0px 10px; }
    .sd-threats-input-section input { width: 58%; }
    .sd-vote-count { font-size: 14px; width: 50px; }
    .sd-threat-left-section { width: 60px; }
    .sd-threat-info>li { font-size: 14px; }
    .sd-threat-comments-count { font-size: 14px; margin-right: 5px; }
    .sd-threat-right-section { padding: 8px; }
    .sd-threat-date:before { margin-left: 2px; margin-right: 2px; }   
}
@media only screen and (max-width: 680px){
    .sd-threat-content-left-section { width: 100%; margin-bottom: 3px; }
    .sd-threats-input-section>* {
        float: none !important;
        display: block;
        width: 100% !important;
        box-sizing: border-box;
        margin: 0px auto !important;
    }
    .sd-threats-input-section input { margin: 10px 0px !important; }
    .sd-threat-left-section li { display: block; margin: 0px auto; width: 100%; }
    .sd-vote-count { margin: 5px 0px !important; }
    .sd-expects-filter-section, 
    .sd-threats-filter-section {
        position: static;
        display: block;
        width: 100%;
        max-width: 100%;
        margin-bottom: 15px;
    }
    .sd-threats-input-section { display: block; }
}
@media only screen and (max-width: 550px){
    .sd-threat-info>li { display: block; }
    .sd-threat-date:before { content: none; }
    h3.sd-threat-title { line-height: 20px; }
}
</style>

<div class="sd-threats-section">
    <h3>What can I expect?</h3>
    <div class="sd-expects-filter-section">
        <div id="sd-expects-filter-options" class="sd-expects-filter-options">
            <a href="javascript:void(0);" onclick="sdExpectsFilterOptions(this);" class="sd-expects-filter-selected">Select</a>
            <ul class="sd-expects-filter-options-lists" style="display:none;">
                <li><a href="javascript:void(0);" onclick="expectFilter(this, 'All');">All</a></li>
                <li><a href="javascript:void(0);" onclick="expectFilter(this, 'Flight');">Flight</a></li>
                <li><a href="javascript:void(0);" onclick="expectFilter(this, 'Arrival');">Arrival</a></li>
                <li><a href="javascript:void(0);" onclick="expectFilter(this, 'Ground');">Ground</a></li>
                <li><a href="javascript:void(0);" onclick="expectFilter(this, 'Departure');">Departure</a></li>
            </ul>
            <input type="hidden" id='expect-filter-value' value="">
        </div>
    </div>
    <div class="sd-threats-content">
        <ul class="sd-threats-listings" id="sd-threats-listings">
            <?php if($this->paginator->getTotalItemCount() > 0): ?>
                <?php foreach($this->paginator as $expect): ?>
                    <?php echo $this->partial(
                        '_expectRow.tpl',
                        'airport',
                        array('expect' => $expect)
                    ); ?>
                <?php endforeach; ?>
            <?php else: ?>
                <li class="tip">
                    No Expect Found
                </li>
            <?php endif; ?>
        </ul>
        
        <?php if($this->paginator->count() > $this->paginator->getCurrentPageNumber()): ?>
            <a href="javascript:void(0);" class="sd_view_more" onclick="loadMoreExpects(this,<?php echo $this->paginator->getCurrentPageNumber()+1; ?>);"><?php echo $this->translate("View More"); ?></a>
        <?php endif; ?>
    </div>
    <?php if($this->viewer()->getIdentity()): ?>
    <div class="sd-threats-input-section">
        <div id="sd-filter-options" class="sd-filter-options">
            <a href="javascript:void(0);" onclick="sdFilterOptions(this);" class="sd-filter-selected">Phase</a>
            <ul class="sd-filter-options-lists" style="display:none;">
                <li><a href="javascript:void(0);" onclick="selectThreatOption(this);">Flight</a></li>
                <li><a href="javascript:void(0);" onclick="selectThreatOption(this);">Arrival</a></li>
                <li><a href="javascript:void(0);" onclick="selectThreatOption(this);">Ground</a></li>
                <li><a href="javascript:void(0);" onclick="selectThreatOption(this);">Departure</a></li>
            </ul>
        </div>
        <input type="text" class="sd_expect_body" placeholder="Select phase of flight and enter STAR, SID, approach, vectors, runway, taxiways etc.">
        <button type="submit" onclick="postExpect(this);">Submit</button>
    </div>
    <?php endif; ?>
</div>


<script type="text/javascript">
function sdFilterOptions(elm){
    var sdParent = elm.getParent("#sd-filter-options");
    sdParent.toggleClass("sd-filter-options-active");
}    
function sdThreatsOptions(elm){
    var sdParent = elm.getParent("#sd-threat-options");
    sdParent.toggleClass("sd-threats-options-active");
}
function selectThreatOption(element){
    var parent = $(element).getParent(".sd-filter-options");
    parent.getElement(".sd-filter-selected").set("html",element.get("html"));
    parent.toggleClass("sd-filter-options-active");
    parent.getElements(".sd-filter-options-lists li").removeClass("active");
    element.getParent("li").addClass("active");
}
<?php if($this->viewer()->getIdentity()): ?>
function postExpect(element){
    var parent = $(element).getParent(".sd-threats-input-section");
    var body = parent.getElement(".sd_expect_body").get("value");
    if(body.trim().length <= 0){
        return;
    }
    var phase = '';
    if(parent.getElement(".sd-filter-options-lists li.active")){
        phase = parent.getElement(".sd-filter-options-lists li.active a").get("html");
    }
    var loader = en4.core.loader.clone();
    loader.addClass("sd_loader");
    loader.inject(element,"bottom");
    element.set("disabled","disabled");
    var request = new Request.JSON({
        url : "<?php echo $this->url(array('controller' => 'expect', 'action' => 'create'),'airport_extended',true); ?>",
        data : {
            format : 'json',
            id: en4.core.subject.id,
            body: body,
            phase: phase
        },
        onSuccess : function(responseJSON) {
            loader.destroy();
            element.set("disabled",null);
            parent.getElement(".sd_expect_body").set("value","");+
            Elements.from(responseJSON.body).inject($('sd-threats-listings'));
            Smoothbox.bind($('sd-threats-listings'));
        }
    });
    request.send();
}
<?php endif; ?>

function sdExpectsFilterOptions(elm){
    var sdParent = elm.getParent("#sd-expects-filter-options");
    sdParent.toggleClass("sd-expects-filter-options-active");
}
function expectFilter(elm, value){
    var parent = $(elm).getParent("#sd-expects-filter-options");
    parent.getElement(".sd-expects-filter-selected").set("html",value);
    parent.toggleClass("sd-expects-filter-options-active");
    parent.getElements(".sd-expects-filter-options-lists li").removeClass("active");
    elm.getParent("li").addClass("active");
    
    var sdExpectInput = parent.getElement("#expect-filter-value");
    if(value === "All"){
        sdExpectInput.value = "";
    }else{
        sdExpectInput.value = value;
    }
    sdFilterExpects(value);
}
function sdFilterExpects(value){
    if(value === "All"){
        value = "";
    }
    var loader = en4.core.loader.clone();
    loader.addClass("sd_loader");
    //loader.inject(element,"bottom");
    var request = new Request.HTML({
        url : "<?php echo $this->url(array('module' => 'core', 'controller' => 'widget', 'action' => 'index', 'content_id' => $this->identity), 'default', true) ?>",
        data : {
            format : 'html',
            subject: en4.core.subject.guid,
            page: 1,
            phase: value
        },
        onSuccess : function(responseTree, responseElements, responseHTML, responseJavaScript) {
            //loader.destroy();
            var div = new Element("div",{
                html: responseHTML
            });
            var content = div.getElement(".layout_airport_sd_threats");
            if(!content){
                return;
            }
            var sdExpects = $$(".layout_airport_sd_threats")[0];
            var sdListsContent = sdExpects.getElement(".sd-threats-content");
            var sdLists = sdExpects.getElement("#sd-threats-listings");
            sdLists.destroy();
            
            var responseLists = div.getElement("#sd-threats-listings");
            responseLists.inject(sdListsContent,"top");
            
            Smoothbox.bind($('sd-threats-listings'));
            
            var viewMore = sdExpects.getElement(".sd_view_more");
            if(viewMore){
                viewMore.destroy();
            }
            var responseViewMore = div.getElement(".sd_view_more");
            if(responseViewMore){
                responseViewMore.inject(sdListsContent,"bottom");
            }
        }
    });
    request.send();
}
function loadMoreExpects(element,page){
    var sdExpectValue = $("expect-filter-value").value;
    
    var loader = en4.core.loader.clone();
    loader.addClass("sd_loader");
    $(element).empty();
    loader.inject(element,"bottom");
    var request = new Request.HTML({
        url : "<?php echo $this->url(array('module' => 'core', 'controller' => 'widget', 'action' => 'index', 'content_id' => $this->identity), 'default', true) ?>",
        data : {
            format : 'html',
            subject: en4.core.subject.guid,
            page: page,
            phase: sdExpectValue
        },
        onSuccess : function(responseTree, responseElements, responseHTML, responseJavaScript) {
            loader.destroy();
            var div = new Element("div",{
                html: responseHTML
            });
            var content = div.getElement(".layout_airport_sd_threats");
            if(!content){
                return;
            }
            var lis = div.getElements(".sd-threats-listings > li");
            if(lis.length <= 0){
                return;
            }
            lis.inject($('sd-threats-listings'));
            Smoothbox.bind($('sd-threats-listings'));
            var viewMore = div.getElement(".sd_view_more");
            if(!viewMore){
                element.destroy();
                return;
            }
            viewMore.inject(element,"after");
            element.destroy();
        }
    });
    request.send();
}
</script>