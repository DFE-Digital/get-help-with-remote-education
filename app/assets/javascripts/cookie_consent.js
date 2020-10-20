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
    date.setTime(date.getTime() + (expiry * 24 * 60 * 60 * 1000));
    let expires = "expires=" + date.toUTCString();
    document.cookie = name + "=" + value + ";" + expires + ";path=/;";
}

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
    setCookie("seen_cookie_message", 'yes', 365);
    updateBanner();
}


document.getElementById("acceptCookies").onclick = acceptAllCookies;
document.getElementById("hideButton").onclick = hideBanner;
