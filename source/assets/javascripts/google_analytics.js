import jsCookie from 'js-cookie';

//Used to access and update google analytics
var currentScript = document.currentScript;
var analyticsID = "";
var cookieSuffix = "";

if (currentScript.hasAttribute("data-ga-id")) {
    analyticsID = currentScript.getAttribute("data-ga-id");
    cookieSuffix = analyticsID.substring(2, analyticsID.length);
}

function initGoogleAnalytics(isDisabled) {
    var gaDisable = 'ga-disable-' + analyticsID 

    window[gaDisable] = isDisabled;
    window.dataLayer = window.dataLayer || [];
    
    function gtag() {
      dataLayer.push(arguments);
    }
    
    gtag('js', new Date());
    gtag('config', analyticsID, {
      'cookie_domain': document.domain
    });
}

function checkForAnalyticsCookies() {
  if (jsCookie.get("_ga") || jsCookie.get("_ga" + cookieSuffix)) {
    return true;
  }
}

function removeAnalyticsCookies() {
    jsCookie.remove("_ga", { path: '/', domain: document.domain });
    jsCookie.remove("_ga_" + cookieSuffix, { path: '/', domain: document.domain });
}

export { initGoogleAnalytics, removeAnalyticsCookies, checkForAnalyticsCookies }
