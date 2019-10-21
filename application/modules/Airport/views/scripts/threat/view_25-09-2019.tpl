<style type="text/css">
.sd-expect-profile-page-content>div{
    font-weight: bold;
    margin-bottom: 8px;
}
.sd-expect-profile-page-content span {
    font-weight: normal;
}
.sd-expect-profile-page-content a {
    color: #fff !important;
}
</style>

<?php $threat = $this->threat; ?>
<div class="sd-expect-profile-page-section">
    <div class="sd-expect-profile-page-content">
        <div class="sd-expect-title">Title: <span><?php echo $threat->body; ?></span></div>
        <?php if(!empty($threat->phase)): ?>
            <div class="sd-expect-title">Phase: <span><?php echo $threat->phase; ?></span></div>
        <?php endif; ?>
        <div class="sd-threat-date">Posted by <?php echo $this->htmlLink($threat->getOwner()->getHref(),$threat->getOwner()->getTitle()); ?> <span><?php echo $this->timestamp($threat->creation_date) ?></span></div>
    </div>
</div>