import "bootstrap";
import "../plugins/flatpickr";
import { previewImageOnFileSelect } from '../components/photo_preview.js';
import 'mapbox-gl/dist/mapbox-gl.css'
import { initMapbox } from '../plugins/init_mapbox'
import { loadDynamicBannerText } from '../components/banner.js'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import { selectTab } from '../components/tab.js'
import { jsCardPlayer } from '../components/card.js'
import { jsButtonPlayer } from '../components/button.js'
import { jsPayementPlayer } from '../components/payement.js'


loadDynamicBannerText();
initMapbox();
jsCardPlayer();
jsButtonPlayer();
previewImageOnFileSelect();
selectTab();
jsPayementPlayer();

