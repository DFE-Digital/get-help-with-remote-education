require "rails_helper"

RSpec.describe "pages/summary.html.erb", type: :view do
  describe "update summary content" do
    before { assign(:today, Date.today) }
    
    let(:update_date) { Date.today }

    describe "with content" do
      let(:html) { render layout: 'pages/summary', locals: { update_date: update_date, show_updates: true, page: 'send', title: 'training-in-assistive-technology', has_content: true } do; end }

      it "displays update details" do
        expect(html).not_to match /data-empty/
        expect(html).to have_no_css('.hidden')
      end
    end

    describe "without content" do
      let(:html) { render layout: 'pages/summary', locals: { update_date: update_date, show_updates: true, page: 'send', title: 'training-in-assistive-technology', has_content: false } do; end }

      it "does not display update details" do
        expect(html).to match /data-empty/
        expect(html).to have_css('.hidden')
      end
    end
  end
end
