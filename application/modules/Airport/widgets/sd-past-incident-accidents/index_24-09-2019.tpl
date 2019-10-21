<style type="text/css">
.layout_sd_past_incident_accidents {
    margin-top: 50px;
    margin-bottom: 100px;
}
.sd-pia-listing-content a{
    cursor: pointer;
    text-decoration: none;
}
.sd-pia-listings {
    background-color: #fff;
}
.sd-pia-right-section a {
    color: #444e59;
    font-weight: 700;
}
li.sd-pia-listing {
    padding: 6px 10px 7px;
    box-sizing: border-box;
}
.sd-pia-left-section img {
    width: 20px;
    margin-right: 10px;
}
.sd-pia-left-section {
    float: left;
}
.sd-pia-right-section{
    padding-left: 30px;
}
.sd-pia-listings>li:nth-of-type(2n+1) {
    background-color: #f0f7fd;
}
.sd-pia-content input {
    width: 100%;
    border-radius: 20px;
    border: none;
    padding: 10px;
    font-size: 18px;
    text-align: center;
    font-weight: bold;
    margin-bottom: 20px;
    margin-top: 10px;
    outline: none;
}
.layout_airport_sd_past_incident_accidents {
    margin-top: 50px;
    margin-bottom: 50px;
}
.sd-pia-section {
    background-color: #2c4961;
    padding: 10px 5px;
    margin-top: 50px;
}
@media only screen and (max-width: 800px){
    li.sd-pia-listing { padding: 6px 5px 7px; }
    .sd-pia-content input { font-size: 16px; }
}
@media only screen and (max-width: 550px){
    .sd-pia-content input { font-size: 16px; line-height: 24px; font-weight: normal; }
}
</style>

<div class="sd-threats-section">
    <h3>Threats</h3>
    <div class="sd-threats-filter-section">
        <div id="sd-threats-filter-options" class="sd-threats-filter-options">
            <a href="javascript:void(0);" onclick="sdThreatsFilterOptions(this);" class="sd-threats-filter-selected">Select</a>
            <ul class="sd-threats-filter-options-lists" style="display:none;">
                <li><a href="javascript:void(0);" onclick="threatFilter(this, 'All');">All</a></li>
                <li><a href="javascript:void(0);" onclick="threatFilter(this, 'All Planes');">All Planes</a></li>
                <li><a href="javascript:void(0);" onclick="threatFilter(this, '777-200LR');">777-200LR</a></li>
                <li><a href="javascript:void(0);" onclick="threatFilter(this, '777-300ER');">777-300ER</a></li>
                <li><a href="javascript:void(0);" onclick="threatFilter(this, '777F');">777F</a></li>
                <li><a href="javascript:void(0);" onclick="threatFilter(this, 'A380');">A380</a></li>
            </ul>
            <input type="hidden" id='threat-filter-value' value="">
        </div>
    </div>
    
    <div class="sd-threats-content">
        <ul class="sd-threats-listings" id="sd-user-threats-listings">
            <?php if($this->paginator->getTotalItemCount() > 0): ?>
                <?php foreach($this->paginator as $threat): ?>
                    <?php echo $this->partial(
                        '_threatRow.tpl',
                        'airport',
                        array('threat' => $threat)
                    ); ?>
                <?php endforeach; ?>
            <?php else: ?>
                <div class="tip">
                    <span>No Threat Found</span>
                </div>
            <?php endif; ?>
        </ul>
        
        <?php if($this->paginator->count() > $this->paginator->getCurrentPageNumber()): ?>
            <a href="javascript:void(0);" class="sd_view_more sd_user_threats_view_more" onclick="loadMoreUserThreats(this,<?php echo $this->paginator->getCurrentPageNumber()+1; ?>);"><?php echo $this->translate("View More"); ?></a>
        <?php endif; ?>
    </div>
    <?php if($this->viewer()->getIdentity()): ?>
    <div class="sd-threats-input-section">
        <div id="sd-filter-threat-options" class="sd-filter-options">
            <a href="javascript:void(0);" onclick="sdFilterThreatOptions(this);" class="sd-filter-selected">All Planes</a>
            <ul class="sd-filter-options-lists" style="display:none;">
                <li class="active"><a href="javascript:void(0);" onclick="selectUserThreatOption(this);">All Planes</a></li>
                <li><a href="javascript:void(0);" onclick="selectUserThreatOption(this);">777-200LR</a></li>
                <li><a href="javascript:void(0);" onclick="selectUserThreatOption(this);">777-300ER</a></li>
                <li><a href="javascript:void(0);" onclick="selectUserThreatOption(this);">777F</a></li>
                <li><a href="javascript:void(0);" onclick="selectUserThreatOption(this);">A380</a></li>
            </ul>
        </div>
        <input type="text" class="sd_expect_body" placeholder="Threat Data Entry Bar">
        <button type="submit" onclick="postThreat(this);">Submit</button>
    </div>
    <?php endif; ?>
</div>

<div class="sd-pia-section">
    <div class="sd-pia-content">
        <ul class="sd-pia-listings" id='sd-pia-listings'>
            <?php foreach($this->threats as $threat): ?>
                <li class="sd-pia-listing">
                    <ul class="sd-pia-listing-content">
                        <li class="sd-pia-left-section">
                            <img src="<?php echo $this->layout()->staticBaseUrl; ?>application/modules/Airport/externals<?php echo $threat->icon; ?>">
                        </li>
                        <li class="sd-pia-right-section">
                            <a href="javascript:void(0);"><?php echo $threat->title; ?></a>
                        </li>
                    </ul>
                </li>
            <?php endforeach; ?>            
        </ul>
        <?php if($this->threats->count() > $this->threats->getCurrentPageNumber()): ?>
            <a href="javascript:void(0);" class="sd_view_more sd_other_view_more" onclick="loadMoreThreats(this,<?php echo $this->threats->getCurrentPageNumber()+1; ?>);"><?php echo $this->translate("View More"); ?></a>
        <?php endif; ?>
    </div>
</div>

<script type="text/javascript">
function sdFilterThreatOptions(elm){
    var sdParent = elm.getParent("#sd-filter-threat-options");
    sdParent.toggleClass("sd-filter-options-active");
}
function sdUserThreatsOptions(elm){
    var sdParent = elm.getParent("#sd-user-threat-options");
    sdParent.toggleClass("sd-threats-options-active");
}
function selectUserThreatOption(element){
    var parent = $(element).getParent(".sd-filter-options");
    parent.getElement(".sd-filter-selected").set("html",element.get("html"));
    parent.toggleClass("sd-filter-options-active");
    parent.getElements(".sd-filter-options-lists li").removeClass("active");
    element.getParent("li").addClass("active");
}
<?php if($this->viewer()->getIdentity()): ?>
function postThreat(element){
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
        url : "<?php echo $this->url(array('controller' => 'threat', 'action' => 'create'),'airport_extended',true); ?>",
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
            Elements.from(responseJSON.body).inject($('sd-user-threats-listings'));
            Smoothbox.bind($('sd-user-threats-listings'));
        }
    });
    request.send();
}
<?php endif; ?>

function sdThreatsFilterOptions(elm){
    var sdParent = elm.getParent("#sd-threats-filter-options");
    sdParent.toggleClass("sd-threats-filter-options-active");
}
function threatFilter(elm, value){
    var parent = $(elm).getParent("#sd-threats-filter-options");
    parent.getElement(".sd-threats-filter-selected").set("html",value);
    parent.toggleClass("sd-threats-filter-options-active");
    parent.getElements(".sd-threats-filter-options-lists li").removeClass("active");
    elm.getParent("li").addClass("active");
    
    var sdThreatInput = parent.getElement("#threat-filter-value");
    if(value === "All"){
        sdThreatInput.value = "";
    }else{
        sdThreatInput.value = value;
    }
    sdFilterThreats(value);
}
function sdFilterThreats(value){
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
            var content = div.getElement(".layout_airport_sd_past_incident_accidents");
            if(!content){
                return;
            }
            var sdThreats = $$(".layout_airport_sd_past_incident_accidents")[0];
            var sdListsContent = sdThreats.getElement(".sd-threats-content");
            var sdLists = sdThreats.getElement("#sd-user-threats-listings");
            sdLists.destroy();
            
            var responseLists = div.getElement("#sd-user-threats-listings");
            responseLists.inject(sdListsContent,"top");
            
            Smoothbox.bind($('sd-threats-listings'));
            
            var viewMore = sdThreats.getElement(".sd_user_threats_view_more");
            if(viewMore){
                viewMore.destroy();
            }
            var responseViewMore = div.getElement(".sd_user_threats_view_more");
            if(responseViewMore){
                responseViewMore.inject(sdListsContent,"bottom");
            }
        }
    });
    request.send();
}
function loadMoreUserThreats(element,page){
    var sdThreatValue = $("threat-filter-value").value;

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
            phase: sdThreatValue
        },
        onSuccess : function(responseTree, responseElements, responseHTML, responseJavaScript) {
            loader.destroy();
            var div = new Element("div",{
                html: responseHTML
            });
            var content = div.getElement(".layout_airport_sd_past_incident_accidents");
            if(!content){
                return;
            }
            var lis = div.getElements(".sd-threats-listings > li");
            if(lis.length <= 0){
                return;
            }
            lis.inject($('sd-user-threats-listings'));
            Smoothbox.bind($('sd-user-threats-listings'));
            var viewMore = div.getElement(".sd_user_threats_view_more");
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

<script type="text/javascript">
function loadMoreThreats(element,page){
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
        },
        onSuccess : function(responseTree, responseElements, responseHTML, responseJavaScript) {
            loader.destroy();
            var div = new Element("div",{
                html: responseHTML
            });
            var content = div.getElement(".layout_airport_sd_past_incident_accidents");
            if(!content){
                return;
            }
            var lis = div.getElements(".sd-pia-listings > li");
            if(lis.length <= 0){
                return;
            }
            lis.inject($('sd-pia-listings'));
            var viewMore = div.getElement(".sd_other_view_more");
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