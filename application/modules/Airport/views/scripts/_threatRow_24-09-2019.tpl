<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */
?>

<?php $threat = $this->threat; ?>
<li class="sd-threats-listing" id='sd-user-threat-<?php echo $threat->getIdentity(); ?>'>
    <ul class="sd-threats-listing-content">
        <li class="sd-threat-left-section">
            <ul>
                <li class="sd-vote sd-upvote <?php echo $threat->isVote(1)?'primary':''; ?>"><a href="javascript:void(0)" onclick="en4.airport.voteThreat(this,'<?php echo $threat->getIdentity(); ?>','upvote');"></a></li>
                <li class="sd-vote-count"><?php echo $threat->getTotalVoteCount(true); ?></li>
                <li class="sd-vote sd-downvote <?php echo $threat->isVote(0)?'primary':''; ?>"><a href="javascript:void(0)" onclick="en4.airport.voteThreat(this,'<?php echo $threat->getIdentity(); ?>','downvote');"></a></li>
            </ul>
        </li>
        <li class="sd-threat-right-section">
            <ul>
                <li class="sd-threat-content-left-section">
                    <h3 class="sd-threat-title">
                        <a href="javascript:void(0);"><?php echo $threat->body; ?></a>
                    </h3>
                    <ul class="sd-threat-info">
                        <?php if(!empty($threat->phase)): ?>
                            <li class="sd-threat-category"><a href="javascript:void(0);"><?php echo $threat->phase; ?></a></li>
                        <?php endif; ?>
                        <li class="sd-threat-date">Posted by <?php echo $this->htmlLink($threat->getOwner()->getHref(),$threat->getOwner()->getTitle()); ?> <span><?php echo $this->timestamp($threat->creation_date) ?></span></li>
                    </ul>
                </li>
                <li class="sd-threat-content-right-section">
                    <ul>
                        <li class="sd-threat-comments">
                            <a class='sd-threat-comments-count' href="<?php echo $this->url(array('threat_id' => $threat->getIdentity()),'airport_threatprofile',true); ?>"><?php echo $threat->getCommentCount(true); ?></a>
                        </li>
                        <li class="sd-threat-options" id="sd-user-threat-options">
                            <a href="javascript:void(0);" onclick="sdUserThreatsOptions(this);"></a>
                            <ul style="display:none;" class="sd-threats-options-lists">
                                <li><a class='smoothbox' href="<?php echo $this->url(array('action' => 'delete', 'threat_id' => $threat->getIdentity()),'airport_threatprofile',true); ?>">Delete</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</li>
