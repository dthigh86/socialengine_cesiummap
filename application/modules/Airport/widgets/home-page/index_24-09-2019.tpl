<?php
  if (APPLICATION_ENV == 'production')
    $this->headScript()
      ->appendFile($this->layout()->staticBaseUrl . 'externals/autocompleter/Autocompleter.min.js');
  else
    $this->headScript()
      ->appendFile($this->layout()->staticBaseUrl . 'externals/autocompleter/Observer.js')
      ->appendFile($this->layout()->staticBaseUrl . 'externals/autocompleter/Autocompleter.js')
      ->appendFile($this->layout()->staticBaseUrl . 'externals/autocompleter/Autocompleter.Local.js')
      ->appendFile($this->layout()->staticBaseUrl . 'externals/autocompleter/Autocompleter.Request.js');
?>

<script type=text/javascript>
en4.core.runonce.add(function() {
    var autocompleter = new Autocompleter.Request.JSON('query', en4.core.baseUrl+'airports/suggest', {
        'minLength': 1,
        'delay' : 250,
        'selectMode': 'pick',
        'autocompleteType': 'message',
        'multiple': false,
        'className': 'message-autosuggest airport-autosuggest',
        'filterSubset' : true,
        'tokenFormat' : 'object',
        'tokenValueKey' : 'label',
        'cache': false,
        'injectChoice': function(token){
          if(token.type == 'user'){
            var choice = new Element('li', {
              'class': 'autocompleter-choices',
              'html': "",
              'id':token.label
            });
            new Element('a', {
              'html': this.markQueryValue(token.label+' - '+token.iata),
              'class': 'autocompleter-choice',
              'href': token.url
            }).inject(choice);
            this.addChoiceEvents(choice).inject(this.choices);
            choice.store('autocompleteChoice', token);
          }
          else {
            var choice = new Element('li', {
              'class': 'autocompleter-choices airports',
              'id':token.label
            });
            new Element('div', {
              'html': this.markQueryValue(token.label+' - '+token.iata),
              'class': 'autocompleter-choice'
            }).inject(choice);
            this.addChoiceEvents(choice).inject(this.choices);
            choice.store('autocompleteChoice', token);
          }
            
        }
    });
    autocompleter.doAddValueToHidden = function(name, toID, hideLoc, newItem, list){
        
    };
    
    $("searchform").addEvent("submit",function(event){
        event.preventDefault();
        autocompleter.query();
    });
});    
</script>
<style type="text/css">
#global_content {
    display: table;
    height:100vh;
    margin-top:-80px
}
.panel-open .layout_airport_home_page {
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
.layout_airport_home_page #searchform {
    padding: 0;
    background-color: transparent;
    float: none;
    padding-bottom: 10px;
    padding-left:3px;
}
#core_search_widget input[type=text][type=text] {
    max-width: 600px;
    width: 100%;
    border-radius: 12px 0px 0px 12px;
    outline:none;
    box-shadow: 1px 1px 4px #ffffff;
    padding: 12px 10px;
}
.layout_airport_home_page {
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
.layout_airport_home_page select#type {
    display: none;
}
ul.airport-autosuggest > li img {
    display: none;
}
ul.airport-autosuggest > li:hover {
    background-color: #2e4b6a;
}
ul.airport-autosuggest > li.autocompleter-selected {
    background-color: #334960;
}
ul.airport-autosuggest{
    background: #3c5e82;
    border-radius: 3px;
    margin-bottom: 20px;
}
ul.airport-autosuggest > li.autocompleter-choices a {
    font-size: 13px;
    display:block;
    padding:5px 10px;
}
ul.airport-autosuggest > li.autocompleter-choices {
    padding: 0px;
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