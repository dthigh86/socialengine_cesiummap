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

<?php
  $themes = Engine_Api::_()->getDbtable('themes', 'core')->fetchAll();
  $activeTheme = $themes->getRowMatching('active', 1);
  $manifest = APPLICATION_PATH . '/application/themes/' . $activeTheme->name . '/manifest.php';
  $themeManifest = null;
  if( file_exists($manifest) ) {
    $themeManifest = require($manifest);
  }
?>
<div id='core_menu_mini_menu'>
  <ul>
    <?php foreach( $this->navigation as $item ): ?>
      <?php $submenus = $item->getPages(); ?>
      <li>
        <?php
          $linkTitle = '';
          $subclass = '';

          if( stripos($activeTheme->name, 'insignia') !== false || (isset($themeManifest['options']) && isset($themeManifest['options']['menu-icons'])) ) {
            $linkTitle = $this->translate(strip_tags($item->getLabel()));
            if( $this->showIcons ) {
              $subclass = ' show_icons';
            }
          }
          $class = !empty($item->class) ? $item->class . $subclass : null;
        ?>
        <?php $href = $item->getHref(); ?>
        <?php echo $this->htmlLink($href, $this->translate($item->getLabel()), array_filter(array(
        'class' => $class,
        'alt' => ( !empty($item->alt) ? $item->alt : null ),
        'target' => ( !empty($item->target) ? $item->target : null ),
        'title' => $linkTitle,
        ))) ?>
        
        <?php if(!empty($submenus)): ?>
            <ul class="sd_settings_dropdown dropDownMenuMini" style="display: none;">
                <?php foreach($submenus as $submenu): ?>
                    <li>
                        <?php
                          $linkTitle = '';
                          $subclass = '';

                          if( stripos($activeTheme->name, 'insignia') !== false || (isset($themeManifest['options']) && isset($themeManifest['options']['menu-icons'])) ) {
                            $linkTitle = $this->translate(strip_tags($submenu->getLabel()));
                            if( $this->showIcons ) {
                              $subclass = ' show_icons';
                            }
                          }
                          $class = !empty($item->class) ? $item->class . $subclass : null;
                        ?>
                        <?php echo $this->htmlLink($submenu->getHref(), $this->translate($submenu->getLabel()), array_filter(array(
                        'class' => $class,
                        'alt' => ( !empty($submenu->alt) ? $item->alt : null ),
                        'target' => ( !empty($submenu->target) ? $item->target : null ),
                        'title' => $linkTitle,
                        ))) ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>
        
      </li>
    <?php endforeach; ?>
  </ul>
</div>