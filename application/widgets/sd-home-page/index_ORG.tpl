<style type="text/css">
#global_content {
    display: table;
    height:100vh;
    margin-top:-80px
}
.panel-open .layout_sd_home_page {
    margin-left: 15%;
}
.layout_page_user_index_home {
    display: table-cell;
    margin: auto;
    vertical-align: middle;
}
#core_search_widget h4 {
    border: none;
    color: #fff;
    font-size: 20px;
}
.layout_sd_home_page #searchform {
    padding: 0;
    background-color: transparent;
    float: none;
    padding-bottom: 10px;
}
#core_search_widget input[type=text][type=text] {
    max-width: 600px;
    width: 100%;
    border-radius: 12px 0px 0px 12px;
    outline:none;
    box-shadow: 1px 1px 4px #ffffff;
    padding: 12px 10px;
}
.layout_sd_home_page {
    max-width: 650px;
    margin: auto;
    overflow: hidden;
}   
#core_search_widget button {
    font-size: 0px;
    background-color: #fff;
    padding: 13px;
    margin-left: -5px;
    position: relative;
    top: 1px;
    border-left: 2px solid #7C7C7C;
    border-radius: 0px 12px 12px 0px;
    box-shadow: 1px 1px 4px #ffffff;
    outline: none;
}
#core_search_widget button:before {
    content: "\f002";
    font-family: fontawesome;
    font-size: 18px;
    color: #7c7c7c;
}
#core_search_widget button:hover {
    background-color: #3078c0;
}
#core_search_widget button:hover:before {
 color:#fff;
}
.layout_sd_home_page select#type {
    display: none;
}
@media (max-width: 767px) {
#core_search_widget input[type=text][type=text]{ width: 90% !important;}        
}
@media (max-width: 480px) {
#core_search_widget input[type=text][type=text]{ width: 85% !important;}
#core_search_widget h4{ font-size:18px;}
}
</style>
<div id='core_search_widget'>
    <h4><?php echo $this->translate("Where are you operating to next ?") ?></h4> 
  <?php if($this->search_check):?>
    <div id="searchform" class="global_form_box">
      <?php echo $this->form->setAttrib('class', '')->render($this) ?>
    </div>
  </div>
<?php endif;?>