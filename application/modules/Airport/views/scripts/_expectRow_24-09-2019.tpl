<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */
?>

<?php $expect = $this->expect; ?>
<li class="sd-threats-listing" id='sd-user-expect-<?php echo $expect->getIdentity(); ?>'>
    <ul class="sd-threats-listing-content">
        <li class="sd-threat-left-section">
            <ul>
                <li class="sd-vote sd-upvote <?php echo $expect->isVote(1)?'primary':''; ?>"><a href="javascript:void(0)" onclick="en4.airport.vote(this,'<?php echo $expect->getIdentity(); ?>','upvote');"></a></li>
                <li class="sd-vote-count"><?php echo $expect->getTotalVoteCount(true); ?></li>
                <li class="sd-vote sd-downvote <?php echo $expect->isVote(0)?'primary':''; ?>"><a href="javascript:void(0)" onclick="en4.airport.vote(this,'<?php echo $expect->getIdentity(); ?>','downvote');"></a></li>
            </ul>
        </li>
        <li class="sd-threat-right-section">
            <ul>
                <li class="sd-threat-content-left-section">
                    <h3 class="sd-threat-title">
                        <a href="javascript:void(0);"><?php echo $expect->body; ?></a>
                    </h3>
                    <ul class="sd-threat-info">
                        <?php if(!empty($expect->phase)): ?>
                            <li class="sd-threat-category"><a href="javascript:void(0);"><?php echo $expect->phase; ?></a></li>
                        <?php endif; ?>
                        <li class="sd-threat-date">Posted by <?php echo $this->htmlLink($expect->getOwner()->getHref(),$expect->getOwner()->getTitle()); ?> <span><?php echo $this->timestamp($expect->creation_date) ?></span></li>
                    </ul>
                </li>
                <li class="sd-threat-content-right-section">
                    <ul>
                        <li class="sd-threat-comments">
                            <a class='sd-threat-comments-count' href="<?php echo $this->url(array('expect_id' => $expect->getIdentity()),'airport_expectprofile',true); ?>"><?php echo $expect->getCommentCount(true); ?></a>
                        </li>
                        <li class="sd-threat-options" id="sd-threat-options">
                            <a href="javascript:void(0);" onclick="sdThreatsOptions(this);"></a>
                            <ul style="display:none;" class="sd-threats-options-lists">
                                <li><a class='smoothbox' href="<?php echo $this->url(array('action' => 'delete', 'expect_id' => $expect->getIdentity()),'airport_expectprofile',true); ?>">Delete</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</li>
