
function hideBanner(event) {
  event.preventDefault();

  const banner = document.getElementById('appCookieBanner');
  banner.classList.add("hidden");
}

document.getElementById("hideButton").onclick = hideBanner;