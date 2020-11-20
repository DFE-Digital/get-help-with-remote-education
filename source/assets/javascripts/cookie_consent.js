import { checkForCookies, setCookie } from './cookie_helper'

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

if (!cookieConsentGiven()) {
  unhideBanner(); // unhide cookie banner if consent not given
};

document.getElementById("acceptCookies").onclick = acceptAllCookies;
document.getElementById("hideButton").onclick = hideBanner;

export { acceptAllCookies, hideBanner, unhideBanner };