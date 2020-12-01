import { checkForCookies, getCookie, setCookie } from './cookie_helper';
import { initGoogleAnalytics, removeAnalyticsCookies, checkForAnalyticsCookies } from './google_analytics';

function updateBanner() {
  document.getElementById("cookieActionsContainer").style.display = "none";
  document.getElementById("cookieConfirmation").style.display = "block";
}

function unhideBanner() {
  document.getElementById("appCookieBanner").style.display = "block";
}

function hideBanner() {
  document.getElementById("appCookieBanner").style.display = "none";
}

function acceptAllCookies() {
  setCookie("ghre_allow_cookies", true, 365);
  updateBanner();
}

function cookieConsentGiven() {
  return checkForCookies("ghre_allow_cookies");
}

function consentToCookies() {
  setCookie("ghre_allow_cookies", true, 365);
}

function withdrawCookieConsent() {
  setCookie("ghre_allow_cookies", false, 365);
  removeAnalyticsCookies();
}

function cookieConsentValue() {
  return getCookie("ghre_allow_cookies");
}

function allowAnalyticsCookies() {
  if(getCookie("ghre_allow_cookies") === "true") {
    return true
  } else {
    return false
  }
}

if (!cookieConsentGiven()) {
  unhideBanner(); // unhide cookie banner if consent not given
}

document.getElementById("acceptCookies").onclick = acceptAllCookies;
document.getElementById("hideButton").onclick = hideBanner;

if (allowAnalyticsCookies()) {
  initGoogleAnalytics(false);
} else if (checkForAnalyticsCookies()) {
  removeAnalyticsCookies();
} else {

}

export { acceptAllCookies, hideBanner, unhideBanner, consentToCookies, withdrawCookieConsent, cookieConsentValue }