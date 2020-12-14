function setCookie(name, value, expiry) {
  let date = new Date();
  date.setTime(date.getTime() + (expiry * 24 * 60 * 60 * 1000));
  let expires = "expires=" + date.toUTCString();
  document.cookie = name + "=" + value + ";" + expires + ";path=/; sameSite=none; Secure";
}

function updateBanner() {
  document.getElementById("cookieActionsContainer").style.display = "none";
  document.getElementById("cookieConfirmation").style.display = "block";
}

function acceptAllCookies() {
  setCookie("ghre_allow_cookies", true, 365);
  updateBanner();
}

document.getElementById("acceptCookies").onclick = acceptAllCookies;