import { cookieConsentValue, consentToCookies, withdrawCookieConsent } from './cookie_consent'

function submitCookiePreferences(e) {
  e.preventDefault();
  let inputs = e.target.getElementsByTagName('input');
  for (var i = 0; i < inputs.length; i++) {
    if (inputs[i].checked) {
      if (inputs[i].value === 'cookie-consent-accept') {
        consentToCookies();
      }

      if (inputs[i].value === 'cookie-consent-deny') {
        withdrawCookieConsent();
      }
    }
  }
  document.querySelector('div[data-cookie-confirmation]').style.display = 'block';
}

if(cookieConsentValue() == 'true') {
  document.querySelector('input[value="cookie-consent-accept"]').checked = true;
}

document.getElementById('cookie-preferences-form').addEventListener("submit", submitCookiePreferences, false)