<style type='text/css'>
form.global_form {
    border: 1px solid #cccccc;
    max-width: 500px;
    margin: 0px auto;
    border-radius: 5px;
    padding: 20px;
    box-sizing: border-box;
}
form.global_form input, 
form.global_form select, 
form.global_form textarea {
    max-width: 100%;
    width: 100%;
    box-sizing: border-box;
    outline: none;
}
form.global_form button {
    margin-top: 20px;
}
form.global_form div.form-label {
    margin-bottom: 2px;
}
form.global_form .form-wrapper {
    margin-top: 12px;
}
form.global_form h3 {
    font-size: 20px;
    text-align: center;
    margin-bottom: 20px;
}
</style>

<h2>
  <?php echo $this->translate("Airports Plugin") ?>
</h2>

<?php if( count($this->navigation) ): ?>
  <div class='tabs'>
    <?php
      // Render the menu
      //->setUlClass()
      echo $this->navigation()->menu()->setContainer($this->navigation)->render()
    ?>
  </div>
<?php endif; ?>

<br />

<?php echo $this->form->render(); ?>