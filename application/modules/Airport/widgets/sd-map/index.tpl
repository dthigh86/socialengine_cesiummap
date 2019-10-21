<style type="text/css">
.sd-map-info-content>div,
.sd-right-map-info>div{
    color: #444e59;
    font-weight: bold;
    margin-bottom: 8px;
}
.sd-map-info-content .sd-airport-name span {
    font-size: 24px;
    font-weight: bold;
}
.sd-map-info-content span {
    font-weight: normal;
}
.sd-map-info-section {
    overflow: hidden;
    padding: 20px;
    box-sizing: border-box;
}
.sd-map-info-content {
    float: left;
}
.sd-right-map-info {
    float: right;
}
/*
.sd-300er-name span {
    color: #00e74d;
}
.sd-200lr-name span {
    color: #ffe400;
}
.sd-777f-name span {
    color: #ff0000;
}
.sd-a380-name span {
    color: #d67e00;
}
*/
@media only screen and (max-width: 800px){
    .sd-map-info-content .sd-airport-name span { font-size: 20px; }
    .sd-map-info-section { padding-right: 0px; padding-left: 0px; }
}
@media only screen and (max-width: 500px){
    .sd-map-info-section>div { float: none; }
}
</style>

<div class="sd-map-info-section">
    <div class="sd-map-info-content">
        <div class="sd-airport-name">Name: <span><?php echo $this->airport->getTitle(); ?></span></div>
        <div class="sd-icao-name">ICAO: <span><?php echo $this->airport->icao; ?></span></div>
        <div class="sd-icao-name">IATA: <span><?php echo $this->airport->iata; ?></span></div>
        <div class="sd-icao-name">Country: <span><?php echo $this->airport->country; ?></span></div>
    </div>
    <div class='sd-right-map-info'>
        <div class="sd-300er-name">B777-300ER: <span><?php echo $this->airport['777_300er']; ?></span></div>
        <div class="sd-200lr-name">B777-200LR: <span><?php echo $this->airport['777_200lr']; ?></span></div>
        <div class="sd-777f-name">B777F: <span><?php echo $this->airport['777f']; ?></span></div>
        <div class="sd-a380-name">A380: <span><?php echo $this->airport['a380']; ?></span></div>
    </div>
</div>