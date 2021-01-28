require "rails_helper"

RSpec.describe "pages/links_with_topics.html.erb", type: :view do
  describe "updated content" do
    let(:html) { render partial: 'links_with_topics', locals: {
        links: [
          {
            title: "example",
            href: "https://www.example.com",
            topics: 11,
            updated: true,
            show_updates: true
          }
        ]
      }
    }

    it "has data-updated attribute" do
      expect(html).to have_selector('[data-updated]')
    end

    it "has a data-qa attribute" do
      expect(html).to have_selector('[data-qa="updated-content__highlighted"]')
    end
  end

  describe "no updated content" do
    let(:html) { render partial: 'links_with_topics', locals: {
        links: [
          {
            title: "example",
            href: "https://www.example.com",
            topics: 11
          }
        ]
      }
    }

    it "does not have data-updated attribute" do
      expect(html).to_not have_selector('[data-updated]')
    end

    it "does not have a data-qa attribute" do
      expect(html).to_not have_selector('[data-qa]')
    end
  end

  describe "pluralization" do
    describe "with 1 topic" do
      let(:html) { render partial: 'links_with_topics', locals: {
          links: [
            {
              title: "example",
              href: "https://www.example.com",
              topics: 1
            }
          ]
        }
      }
      
      it "doesn't pluralize the word topic" do
        expect(html).to have_text("example - 1 topic")
      end
    end

    describe "with multiple topics" do
      let(:html) { render partial: 'links_with_topics', locals: {
          links: [
            {
              title: "example",
              href: "https://www.example.com",
              topics: 5
            }
          ]
        }
      }
      
      it "pluralizes the word topic" do
        expect(html).to have_text("example - 5 topics")
      end
    end
  end
end