<style type="text/css">
.sd-content-wrapper {
    margin-top: 50px;
}
.layout_right {
    width: 400px;
    padding: 20px;
    box-sizing: border-box;
}
#signup_account_form input, 
#signup_account_form select,
#signup_account_form textarea {
    border-radius: 4px;
    width: 100%;
    margin: 0;
    max-width: none;
    border: 1px solid #ddd;
    padding: 8px;
    outline: none;
}
.layout_right label {
    font-size: 14px;
    font-weight: 700;
    color: #fff;
}
.layout_right h2 {
    font-size: 20px;
    font-weight: 600;
    color: #fff;
}
.layout_right h2 span {
    font-size: 17px;
}
.layout_right .form-element {
    min-width: 0;
    max-width: 100%;
    width: 100%;
}
.layout_right #signup_account_form input[type="checkbox"] {
    width: 8%;
    float: left;
    margin-top: 4px;
}
.layout_right #signup_account_form label.null {
    float: left;
    width: 91%;
}
.layout_right .global_form a {
    color: #FFBA00;
}
.layout_right #submit-element{
  text-align:center;
  margin-top:5px;
}
div .layout_right .form-label{
  text-align:left;
  padding: 0;
  margin-bottom: 5px;
}
.global_form div>input+p{
 display:none;
}
.layout_right h2 {
    display: none;
}
.layout_right button{
    background-color: #FFBA00;
    border-radius: 4px;
    text-transform:capitalize;
}
.sd-intro {
    padding-top: 150px;
    padding-right: 80px;
}
.sd-intro h1 {
    font-size: 30px;
    color: #fff;
    font-weight: 600;
}
.sd-intro p {
    color: #fff;
    text-align:justify;
}
div#core_menu_mini_menu {
    display: none !important;
    background: transparent;
}
.layout_core_menu_mini {
    background-color: transparent;
}
.layout_right .form-elements {
    padding: 0px;
    margin-top: 0px;
}
.layout_right #submit-label {
    display: none;
}
@media (max-width: 767px){
    .layout_middle{ margin-top:0px;padding: 0px 0px 20px;box-sizing: border-box;}    
    .sd-intro { padding:0px;}
    .sd-login-form { 
        width: 100%;
        margin: auto;
        max-width: 400px;
        float: none;
        clear: both;
     }
     .login-form #remember-element{ margin-top: 5px; margin-bottom: 0;}
     #loginoptions-wrapper{ margin-left: 30px;margin-top: 10px;text-align: center;}
    .login-form div.form-element { width: 100%;}
    .login-form .global_form input[type=email], 
    .login-form .global_form input[type=password] { width: 100%;}
    .login-form .global_form #remember-wrapper, 
    .login-form .global_form #forgot-wrapper { clear: none;width:auto;}
    .layout_right{ width: 100%;}
    .login-form #submit-element { text-align:center;}
    .login-form .form-wrapper{ margin-right: 0px; width: 100%;}
    .login-form .global_form>div{ float:none;}
    .sd-intro h1{ text-align:center; font-size:22px}
    .layout_middle .layout_page_header:after {
        content: "";
        background: #ff0050 linear-gradient(141deg, #f100df 0, #ff0050 80%, #ff0050 150%);
        height: 2px;
        width: 100%;
        display: block;
        margin-top: 20px;
    }
}
@media (max-width: 600px){
    #loginoptions-wrapper{ margin-left:0px;}
    .login-form #forgot-element{ margin-left: 0px;}
    .global_left_panel .layout_core_menu_logo, .global_left_panel .layout_core_menu_mini{ 
        width: auto !important; 
        float: left; 
        display:block !important;
    }
    .layout_right{ padding:0px 0px 20px;}
    .layout_right h2 span{ font-size:16px;}
    .layout_right h2 { font-size: 18px;}
    .sd_core_menu_logo{ display:none;}
    #global_header .layout_core_menu_logo{ margin-bottom: 0;margin-top: -8px;}
}
</style>
<div class="sd-content-wrapper">
  <div class="layout_right">
   <?php echo $this->signup_form->render($this); ?>
  </div>
  <div class="layout_middle">
    <div class="sd-intro">  
     <h1><?php echo $this->translate("Follow your interest") ?></h1>
     <p><?php echo $this->translate("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.") ?></p>
    </div>
  </div>  
</div>
