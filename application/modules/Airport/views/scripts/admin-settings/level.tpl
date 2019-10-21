<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

?>

<h2><?php echo $this->translate("Airports Plugin") ?></h2>

<script type="text/javascript">
  var fetchLevelSettings = function(level_id) {
    window.location.href = en4.core.baseUrl + 'admin/airport/settings/level/id/' + level_id;
    //alert(level_id);
  }
</script>

<?php if( count($this->navigation) ): ?>
  <div class='tabs'>
    <?php
      // Render the menu
      //->setUlClass()
      echo $this->navigation()->menu()->setContainer($this->navigation)->render()
    ?>
  </div>
<?php endif; ?>

<div class='clear'>
  <div class='settings'>
    <?php echo $this->form->render($this) ?>
  </div>

</div>
<script type="text/javascript">
  function showPreview() {
    Smoothbox.open($('show_default_preview'));
  }
</script>

<style type="text/css">
  .is_hidden {
    display: none;
  }
</style>
