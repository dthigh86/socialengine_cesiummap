<style type="text/css">
.sd-filter-airport {
    margin: 30px 0px 15px;
    overflow: hidden;
}
.sd-filter-airport .form-elements>div {
    float: left;
    overflow: hidden;
    width: 16%;
}    
.sd-filter-airport .form-elements>div+div {
    margin-left: 15px;
}
.sd-filter-airport button#submit {
    margin-top: 18px;
    float: right;
}
.sd-filter-airport h3 {
    margin-bottom: 10px;
}
.sd-filter-airport .form-label {
    margin-bottom: 3px;
}
.sd-filter-airport input {
    width: 100%;
    box-sizing: border-box;
}
</style>


<script type="text/javascript">

function multiDelete()
{
  return confirm("<?php echo $this->translate("Are you sure you want to delete the selected airports?") ?>");
}

function selectAll()
{
  var i;
  var multidelete_form = $('multidelete_form');
  var inputs = multidelete_form.elements;
  for (i = 1; i < inputs.length; i++) {
    if (!inputs[i].disabled) {
      inputs[i].checked = inputs[0].checked;
    }
  }
}
</script>

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
<?php 
    echo $this->htmlLink(array('route' => 'admin_default', 'module' => 'airport', 'controller' => 'manage', 'action' => 'import'), $this->translate('Import Airports'), array(
        'class' => 'smoothbox buttonlink',
        'style' => 'background-image: url(' . $this->layout()->staticBaseUrl . 'application/modules/Core/externals/images/admin/new_category.png);'
    )) 
?>
      
<?php 
    echo $this->htmlLink(array('route' => 'admin_default', 'module' => 'airport', 'controller' => 'manage', 'action' => 'create'), $this->translate('Create Airport'), array(
        'class' => 'buttonlink',
        'style' => 'background-image: url(' . $this->layout()->staticBaseUrl . 'application/modules/Core/externals/images/admin/new_category.png);'
    )) 
?>
<br />

<?php echo $this->form->render(); ?>

<br />
<?php if( count($this->paginator) ): ?>
  <form id='multidelete_form' method="post" action="<?php echo $this->url();?>" onSubmit="return multiDelete()">
  <table class='admin_table'>
    <thead>
      <tr>
        <th class='admin_table_short'><input onclick='selectAll();' type='checkbox' class='checkbox' /></th>
        <th class='admin_table_short'><?php echo $this->translate("ID") ?></th>
        <th><?php echo $this->translate("Title") ?></th>
        <th><?php echo $this->translate("Country") ?></th>
        <th><?php echo $this->translate("Region") ?></th>
        <th><?php echo $this->translate("ICAO") ?></th>
        <th><?php echo $this->translate("IATA") ?></th>
        <th><?php echo $this->translate("777-200LR") ?></th>
        <th><?php echo $this->translate("777-300ER") ?></th>
        <th><?php echo $this->translate("777F") ?></th>
        <th><?php echo $this->translate("A380") ?></th>
        <th><?php echo $this->translate("Creation Date") ?></th>
        <th><?php echo $this->translate("Options") ?></th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($this->paginator as $item): ?>
        <tr>
          <td><input type='checkbox' class='checkbox' name='delete_<?php echo $item->airport_id;?>' value='<?php echo $item->airport_id ?>' /></td>
          <td><?php echo $item->airport_id ?></td>
          <td><?php echo $item->title ?></td>
          <td><?php echo $item->country ?></td>
          <td><?php echo $item->region ?></td>
          <td><?php echo $item->icao ?></td>
          <td><?php echo $item->iata ?></td>
          <td><?php echo $item['777_200lr'] ?></td>
          <td><?php echo $item['777_300er'] ?></td>
          <td><?php echo $item['777f'] ?></td>
          <td><?php echo $item->a380 ?></td>
          <td><?php echo $this->locale()->toDateTime($item->creation_date) ?></td>
          <td>
            <a href="<?php echo $this->url(array('id' => $item->airport_id), 'airport_profile') ?>">
              <?php echo $this->translate("view") ?>
            </a>
            |
            <?php echo $this->htmlLink(array('route' => 'admin_default', 'module' => 'airport', 'controller' => 'manage', 'action' => 'edit', 'id' => $item->airport_id), 
                $this->translate('edit'), 
                array('class' => '',)) 
            ?>
            |
            <?php echo $this->htmlLink(
                array('route' => 'admin_default', 'module' => 'airport', 'controller' => 'manage', 'action' => 'delete', 'id' => $item->airport_id),
                $this->translate("delete"),
                array('class' => 'smoothbox')) 
            ?>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>

  <br />

  <div class='buttons'>
    <button type='submit'><?php echo $this->translate("Delete Selected") ?></button>
  </div>
  </form>

  <br />

    <div>
        <?php echo $this->paginationControl($this->paginator, null, null, array(
          'pageAsQuery' => true,
          'query' => $this->formValues,
        )); ?>
    </div>

<?php else: ?>
  <div class="tip">
    <span>
      <?php echo $this->translate("There are no airports created yet.") ?>
    </span>
  </div>
<?php endif; ?>
