import "bootstrap";

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
