require 'rails_helper'
feature "article model spec" do
  context ".where_title_or_body_includes" do
    it "returns all articles where the title includes a string" do
      author = create(:author)
      cancer_article_one = author.articles.create!(title: "Blah Blah Cancer surviror", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      cancer_article_two = author.articles.create!(title: "Blah Cancer Blah non-surviror", featured: false, body: "Little Bo-Pepe  survided cancer - not", published: true)
      cancer_article_one = author.articles.create!(title: "Blah Blah almost surviror", featured: false, body: "Cancer survided little Bo-pepe. Almost.", published: true)
      non_cancer_article = author.articles.create!(title: "Blah Blah not spoken of almost surviror", featured: false, body: "That which can not be spoken of did not survive survided little Bo-pepe", published: true)

      articles = Article.where_title_or_body_includes("Cancer")

      expect(articles.count).to eq(3)
      expect(articles.all? {|article| arcticle.title.include?(Cancer)}).to eq true
      expect(artciles).to not_include(non_cancer_article )
    end
  end
end
