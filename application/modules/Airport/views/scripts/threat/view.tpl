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
#smoothbox_window #global_content_simple {
    width: 100%;
}
#smoothbox_window {
    padding: 10px;
    box-sizing: border-box;
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

<script type="text/javascript">
window.addEventListener('DOMContentLoaded', function(e) {
    var parent = window.parent;
    var iFrame = parent.document.getElementById("TB_iframeContent");
    var tbWindow = iFrame.getParent("#TB_window");
    tbWindow.addClass("sd-comments-popup");
});
</script>