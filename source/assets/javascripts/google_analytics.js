import jsCookie from 'js-cookie';

//Used to access and update google analytics
var currentScript = document.currentScript;
var analyticsID = "";
var cookieSuffix = "";

if (currentScript.hasAttribute("data-ga-id")) {
    analyticsID = currentScript.getAttribute("data-ga-id");
}

function gtag() {
    dataLayer.push(arguments);
}

function initGoogleAnalytics(isDisabled) {
    var gaDisable = 'ga-disable-' + analyticsID 

    window[gaDisable] = isDisabled;
    window.dataLayer = window.dataLayer || [];
    
    gtag('js', new Date());
    gtag('config', analyticsID, { cookie_domain: window.location.hostname });
}

function removeAnalyticsCookies() {
    if (currentScript.hasAttribute("data-ga-id")) {
      analyticsID = currentScript.getAttribute("data-ga-id");
      cookieSuffix = analyticsID.substring(2, analyticsID.length);
    }
  
    jsCookie.remove("_ga", { path: '/', domain: window.location.hostname });
    jsCookie.remove("_ga_" + cookieSuffix, { path: '/', domain: window.location.hostname });
  }

export { initGoogleAnalytics, removeAnalyticsCookies }
