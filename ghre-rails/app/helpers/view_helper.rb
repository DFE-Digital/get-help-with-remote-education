module ViewHelper
  def link_to_govuk_content(body, url = body, anchor = "", html_options = { class: "govuk-link" })
    link_to body, "#{url}?utm_source=remote_education#{anchor}", html_options
  end

  def govuk_link_to(body, url = body, html_options = { class: "govuk-link" })
    link_to body, url, html_options
  end
end
