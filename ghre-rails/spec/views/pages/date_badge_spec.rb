require "rails_helper"

RSpec.describe "pages/date_badge.html.erb", type: :view do
  context "update_date is over 2 weeks ago" do
    let(:last_update) { Time.zone.today }
    let(:shifted_date) { last_update + 15.days }
    let(:html) { render "pages/date_badge.html.erb", update_date: last_update, today: shifted_date }
    it "renders the span tag without the .new class" do
      expect(html).to have_no_css(".new")
    end
  end

  context "update_date is under 2 weeks ago" do
    let(:last_update) { Time.zone.today }
    let(:shifted_date) { last_update + 7.days }
    let(:html) { render "pages/date_badge.html.erb", update_date: last_update, today: shifted_date }
    it "renders the span tag with the .new class" do
      expect(html).to have_css(".new", text: "NEW -")
    end
  end
end
