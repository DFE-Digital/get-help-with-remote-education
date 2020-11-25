//Used to access and update google analytics
var currentScript = document.currentScript;
var analyticsID = "";

if (currentScript.hasAttribute("data-ga-id")) {
    analyticsID = currentScript.getAttribute("data-ga-id");
}

function trackPageView() {
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', analyticsID);
}

export { trackPageView }
