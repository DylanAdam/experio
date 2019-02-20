import "bootstrap";
import "../plugins/flatpickr"

import { loadDynamicBannerText } from '../components/banner.js';

loadDynamicBannerText();


$(function(){
  $(".fancy-button").mousedown(function(){
    $(this).bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function(){
        $(this).removeClass('active');
    })
     $(this).addClass("active");
  });
});

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
