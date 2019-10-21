<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Core
 * @copyright  Copyright 2006-2010 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: index.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     John
 */
?>

<div class="sd-footer-links">
    <?php $i = 0; ?>
    <?php foreach( $this->navigation as $item ):
      $attribs = array_diff_key(array_filter($item->toArray()), array_flip(array(
        'reset_params', 'route', 'module', 'controller', 'action', 'type',
        'visible', 'label', 'href'
      )));
      $i++;
      ?>
      <?php if($i > 1): ?>
        &nbsp;-&nbsp;
      <?php endif; ?>
      <?php echo $this->htmlLink($item->getHref(), $this->translate($item->getLabel()), $attribs) ?>
    <?php endforeach; ?>
</div>
<div class="sd-footer-copyright">
    <?php echo $this->translate('Copyright &copy;%s. Threat-Forward.com. All Rights Reserved.', date('Y')) ?>
</div>
<?php if( 1 !== count($this->languageNameList) ): ?>
    &nbsp;-&nbsp;
    <form method="post" action="<?php echo $this->url(array('controller' => 'utility', 'action' => 'locale'), 'default', true) ?>" style="display:inline-block">
      <?php $selectedLanguage = $this->translate()->getLocale() ?>
      <?php echo $this->formSelect('language', $selectedLanguage, array('onchange' => '$(this).getParent(\'form\').submit();'), $this->languageNameList) ?>
      <?php echo $this->formHidden('return', $this->url()) ?>
    </form>
<?php endif; ?>

<?php if( !empty($this->affiliateCode) ): ?>
  <div class="affiliate_banner">
    <?php 
      echo $this->translate('Powered by %1$s', 
        $this->htmlLink('http://www.socialengine.com/?source=v4&aff=' . urlencode($this->affiliateCode), 
        $this->translate('SocialEngine Community Software'),
        array('target' => '_blank')))
    ?>
  </div>
<?php endif; ?>
