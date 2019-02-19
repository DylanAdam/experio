import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Team", "Colleagues", "Company", "Start-up", "Friends"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };


