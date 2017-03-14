require 'rails_helper'

describe "Articles_title_search" do
  context "#index" do
    it "returns all the articles  with a title 'like' the search" do
      author = create(:author)
      cancer_article_one = author.articles.create!(title: "Blah Blah Cancer surviror", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      cancer_article_two = author.articles.create!(title: "Blah Cancer Blah non-surviror", featured: false, body: "Little Bo-Pepe  survided cancer - not", published: true)
      cancer_article_one = author.articles.create!(title: "Blah Blah Cancer almost surviror", featured: false, body: "Cancer survided little Bo-pepe. Almost.", published: true)
      non_cancer_article = author.articles.create!(title: "Blah Blah not spoken of almost surviror", featured: false, body: "That which can not be spoken of did not survive survided little Bo-pepe", published: true)

      get "/api/v1/articles_title_search?search=Cancer"

      articles = JSON.parse(response.body, symbolize_names:true)

      expect(response).to be_success
      expect(articles.first.count).to eq(3)
      expect(articles.first.all? do |article|
        true if article[:title].include?("Cancer") ||
        article[:body].include?("cancer")
      end).to eq true
      expect(articles.first.none? do |article|
        article[:id] == "#{non_cancer_article.id}"
      end).to be true
    end
  end
end
