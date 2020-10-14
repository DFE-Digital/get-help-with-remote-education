import { initAll } from 'govuk-frontend';
import { test } from './cookie_consent'

initAll();

document.getElementById("acceptCookies").onclick = test;