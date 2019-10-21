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

<?php $expect = $this->expect; ?>
<div class="sd-expect-profile-page-section">
    <div class="sd-expect-profile-page-content">
        <div class="sd-expect-title">Title: <span><?php echo $expect->body; ?></span></div>
        <?php if(!empty($expect->phase)): ?>
            <div class="sd-expect-title">Phase: <span><?php echo $expect->phase; ?></span></div>
        <?php endif; ?>
        <div class="sd-threat-date">Posted by <?php echo $this->htmlLink($expect->getOwner()->getHref(),$expect->getOwner()->getTitle()); ?> <span><?php echo $this->timestamp($expect->creation_date) ?></span></div>
    </div>
</div>