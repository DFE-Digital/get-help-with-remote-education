// Used to set, get and check for cookie consent
function checkForCookies(name) {
  return !!getCookie(name);
}

function getCookie(cname) {
  var name = cname + "="
  var decodedCookie = decodeURIComponent(document.cookie)
  var cookieArray = decodedCookie.split(';')

  for(var i = 0; i < cookieArray.length; i++) {
    var cookie = cookieArray[i];
    while (cookie.charAt(0) == ' ') {
      cookie = cookie.substring(1);
    }
    if (cookie.indexOf(name) == 0) {
      return cookie.substring(name.length, cookie.length);
    }
  }
  return "";
}

function setCookie(name, value, expiry) {
  let date = new Date();
  date.setTime(date.getTime() + (expiry * 24 * 60 * 60 * 1000));
  let expires = "expires=" + date.toUTCString();
  document.cookie = name + "=" + value + ";" + expires + ";path=/; sameSite=none; Secure";
}

function allowAnalyticsCookies() {
  if(getCookie("ghre_allow_cookies") === "true") {
    return true
  }
}

export { setCookie, getCookie, checkForCookies, allowAnalyticsCookies }