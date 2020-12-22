function toggleVisibilityOfSummary(summaryContent, statusText, updatedSections) {
  if(summaryContent.className.indexOf("hidden") > -1) {
    summaryContent.classList.remove("hidden")
    statusText.textContent = "hide updates"
    for(var i = 0; i < updatedSections.length; i++) {
      updatedSections[i].classList.add("active")
    }
  } else {
    summaryContent.classList.add("hidden")
    statusText.textContent = "show updates"
    for(var i = 0; i < updatedSections.length; i++) {
      updatedSections[i].classList.remove("active")
    }
  }
}

function toggleUpdatesForPage(e) {
  e.preventDefault();

  var summaryContent = 'update-summary-content'
  var showHideStatusText = 'update-summary-show-hide-status'
  var updatedSections = '[data-updated]'

  if(document.getElementById(summaryContent) && document.getElementById(showHideStatusText)) {
    var summaryContentElement = document.getElementById(summaryContent)
    var statusTextElement = document.getElementById(showHideStatusText)
    var updatedSectionElements = document.querySelectorAll(updatedSections)
    toggleVisibilityOfSummary(summaryContentElement, statusTextElement, updatedSectionElements)
  }
}

var updateToggleButton = 'show-hide-updates'

if(document.getElementById(updateToggleButton)) {
  document.getElementById(updateToggleButton).addEventListener("click", toggleUpdatesForPage, false)
}
