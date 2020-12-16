function toggleVisibilityOfSummary(summaryContent, statusText) {
  if(summaryContent.className.indexOf("hidden") > -1) {
    summaryContent.classList.remove("hidden")
    statusText.textContent = "hide updates"
  } else {
    summaryContent.classList.add("hidden")
    statusText.textContent = "show updates"
  }
}

function toggleUpdatesForPage(e) {
  e.preventDefault();

  var summaryContent = 'update-summary-content'
  var showHideStatusText = 'update-summary-show-hide-status'

  if(document.getElementById(summaryContent) && document.getElementById(showHideStatusText)) {
    var summaryContentElement = document.getElementById(summaryContent)
    var statusTextElement = document.getElementById(showHideStatusText)
    toggleVisibilityOfSummary(summaryContentElement, statusTextElement)
  }
}

var updateToggleButton = 'show-hide-updates'

if(document.getElementById(updateToggleButton)) {
  document.getElementById(updateToggleButton).addEventListener("click", toggleUpdatesForPage, false)
}
