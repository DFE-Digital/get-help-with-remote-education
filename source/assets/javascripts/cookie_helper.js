// Used to set, get and check for cookie consent
function checkForCookies(name) {
  return !!getCookie(name);
}

function getCookie(name) {
  let cookieArray = document.cookie.split(';');
  return cookieArray.find(cookieCrumb => cookieCrumb.substring(name.length, 0) === name);
}

function setCookie(name, value, expiry) {
  let date = new Date();
  console.log('woof');
  date.setTime(date.getTime() + (expiry * 24 * 60 * 60 * 1000));
  let expires = "expires=" + date.toUTCString();
  document.cookie = name + "=" + value + ";" + expires + ";path=/; sameSite=none; Secure";
}

export { setCookie, getCookie, checkForCookies }