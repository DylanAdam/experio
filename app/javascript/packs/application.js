import "bootstrap";
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css'
import { initMapbox } from '../plugins/init_mapbox';

import { loadDynamicBannerText } from '../components/banner.js';

// loadDynamicBannerText();


$(function(){
  $(".fancy-button").mousedown(function(){
    $(this).bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function(){
        $(this).removeClass('active');
    })
     $(this).addClass("active");
  });
});

 // <-- you need to uncomment the stylesheet_pack_tag in the layout!

initMapbox();
