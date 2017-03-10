require 'rails_helper'

describe "Articles_title_search" do
  context "#index" do
    it "returns all the articles  with a title 'like' the search" do
      author = create(:auther)
      cancer_article_one = author.articles.create!(title: "Blah Blah Cancer surviror", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      cancer_article_two = author.articles.create!(title: "Blah Cancer Blah non-surviror", featured: false, body: "Little Bo-Pepe  survided cancer - not", published: true)
      cancer_article_one = author.articles.create!(title: "Blah Blah Cancer almost surviror", featured: false, body: "Cancer survided little Bo-pepe. Almost.", published: true)
      non_cancer_article = author.articles.create!(title: "Blah Blah not spoken of almost surviror", featured: false, body: "That which can not be spoken of did not survive survided little Bo-pepe", published: true)

      Faraday.get("/api/v1/Articles_title_search", "Cancer")
      articles = JSON.parse(response.body)

      expect(response).to be_success
      expect(articles.count).to eq(3)
      expect(articles.all? {|article| arcticle.title.include?(Cancer)}).to eq true
      expect(artciles).to not_include(non_cancer_article)
    end
  end
end
