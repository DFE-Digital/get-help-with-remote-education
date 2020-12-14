import jsCookie from 'js-cookie';

//Used to access and update google analytics
var currentScript = document.currentScript;
var analyticsID = "";
var cookieSuffix = "";

if (currentScript.hasAttribute("data-ga-id")) {
  analyticsID = currentScript.getAttribute("data-ga-id");
  cookieSuffix = analyticsID.substring(2, analyticsID.length);
}

function triggerAnalyticsEvent(category, action) {
  var options = {
    eventCategory: category,
    eventAction: action,
    transport: "beacon"
  }

  ga("send", "event", options);
};

function initExternalLinkTracking() {
  // This will attach event listeners to all links with hrefs that point to external resource.

  var externalLinkSelector = 'a[href^="http"]:not([href*="' + window.location.hostname + '"])';

  function trackClickEvent(event) {
    triggerAnalyticsEvent("External Link Clicked", event.target.getAttribute("href"));
  };

  var links = document.querySelectorAll(externalLinkSelector);

  for (let i = 0; i < links.length; i++) {
    links[i].addEventListener("click", trackClickEvent);
  }
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

  initExternalLinkTracking();
}

function allowAnalyticsCookies() {
  if(jsCookie.get("ghre_allow_cookies") === "true") {
    return true
  } else {
    return false
  }
}

if(allowAnalyticsCookies()) {
  initGoogleAnalytics(false);
}

export { initGoogleAnalytics, removeAnalyticsCookies, checkForAnalyticsCookies }
