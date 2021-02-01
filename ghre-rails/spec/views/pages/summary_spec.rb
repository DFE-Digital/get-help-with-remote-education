require "rails_helper"

RSpec.describe "pages/summary.html.erb", type: :view do
  describe "update summary content" do
    before { assign(:today, Time.zone.today) }

    let(:update_date) { Time.zone.today }

    describe "with content" do
      let(:html) { render partial: "pages/summary", locals: { update_date: update_date, show_updates: true, page: "send", has_content: true } }

      it "displays update details" do
        expect(html).not_to have_selector("[data-empty]")
        expect(html).to have_no_css(".hidden")
      end
    end

    describe "without content" do
      let(:html) { render partial: "pages/summary", locals: { update_date: update_date, show_updates: true, page: "send", has_content: false } }

      it "does not display update details" do
        expect(html).to have_selector("[data-empty]")
        expect(html).to have_css(".hidden")
      end
    end
  end
end
