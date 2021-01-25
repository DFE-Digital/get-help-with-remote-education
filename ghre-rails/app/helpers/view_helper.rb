module ViewHelper
  def link_to_govuk_content(body, url = body, html_options = { class: "govuk-link" })
    link_to body, url + "?utm_source=remote_education", html_options
  end
end