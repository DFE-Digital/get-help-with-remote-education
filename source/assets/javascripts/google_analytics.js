//Used to access and update google analytics
var currentScript = document.currentScript;
var analyticsID = "";

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
    gtag('config', analyticsID);
}

export { initGoogleAnalytics }
