import { initAll } from 'govuk-frontend';
import * as cookieOptions from './cookie_consent';

initAll();

if(!cookieOptions.checkForCookies("ghre_allow_cookies")) {
    cookieOptions.unhideBanner(); // Hide cookies if consent already given
};

document.getElementById("acceptCookies").onclick = cookieOptions.acceptAllCookies;
document.getElementById("hideButton").onclick = cookieOptions.hideBanner;