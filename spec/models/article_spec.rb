require 'rails_helper'
feature "article model spec" do
  context ".where_title_or_body_includes" do
    it "returns all articles where the title includes a string" do
      author = create(:author)
      cancer_article_one = author.articles.create!(title: "Blah Blah Cancer surviror", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      cancer_article_two = author.articles.create!(title: "Blah Cancer Blah non-surviror", featured: false, body: "Little Bo-Pepe  survided cancer - not", published: true)
      non_cancer_article = author.articles.create!(title: "Blah Blah not spoken of almost surviror", featured: false, body: "That which can not be spoken of did not survive survided little Bo-pepe", published: true)

      articles = Article.where_title_or_body_includes("Cancer")

      expect(articles.count).to eq(2)
      expect(articles.all? {|article| article.title.include?("Cancer")}).to eq true
      expect(articles.none? {|article| article.id == non_cancer_article.id}).to eq true
    end

    it "returns all articles where body includes a string " do
      author = create(:author)

      cancer_article_one = author.articles.create!(title: "Blah Blah surviror", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      cancer_article_two = author.articles.create!(title: "Blah  Blah non-surviror", featured: false, body: "Little Bo-Pepe  survided cancer - not", published: true)
      cancer_article_three = author.articles.create!(title: "Blah Blah almost surviror", featured: false, body: "Cancer survided little Bo-pepe. Almost.", published: true)
      non_cancer_article = author.articles.create!(title: "Blah Blah not spoken of almost surviror", featured: false, body: "That which can not be spoken of did not survive survided little Bo-pepe", published: true)

      articles = Article.where_title_or_body_includes("Cancer")

      expect(articles.count).to eq(3)
      expect(articles.all? {|article| true if article.body.include?("Cancer") || article.body.include?("cancer") }).to eq true
      expect(articles.none? {|article| article.id == non_cancer_article.id}).to eq true
    end
    it "returns all articles where title or body includes a string " do
      author = create(:author)

      cancer_article_one = author.articles.create!(title: "Blah Blah Cancer surviror", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      cancer_article_two = author.articles.create!(title: "Blah Cancer Blah non-surviror", featured: false, body: "Little Bo-Pepe  survided cancer - not", published: true)
      cancer_article_three = author.articles.create!(title: "Blah Blah almost surviror", featured: false, body: "Cancer survided little Bo-pepe. Almost.", published: true)
      non_cancer_article = author.articles.create!(title: "Blah Blah not spoken of almost surviror", featured: false, body: "That which can not be spoken of did not survive survided little Bo-pepe", published: true)

      articles = Article.where_title_or_body_includes("Cancer")

      expect(articles.count).to eq(3)
      expect( articles.all? do |article|
        true if article.title.include?("Cancer") ||
        article.body.include?("Cancer") ||
        article.body.include?("cancer")
      end).to eq true
      expect(articles.none? {|article| article.id == non_cancer_article.id}).to eq true
    end
  end
  context ".find_articles_by_keyword_and_paginate(keyword)" do
    it "makes multiple groups of five and can handle numbers non divisible by five " do
      author = create(:author)
      one = author.articles.create!(title: "Ipsum Lorem", featured: false, body: "1 Word count 1", published: true)
      two = author.articles.create!(title: "Lorem Ipsum", featured: false, body: "2  word word", published: true)
      three = author.articles.create!(title: "Word Ipsum",  featured: false, body: "3.1  word word", published: true)
      four = author.articles.create!(title: "Remlo Word", featured: false, body: "2.1 word ", published: true)
      five = author.articles.create!(title: "Lorem word", featured: false, body: "6.1 word word word word word", published: true)
      six = author.articles.create!(title: "Lorem Ipsum", featured: false, body: " six 1 word", published: true)
      seven = author.articles.create!(title: "Lorem Ipsum", featured: false, body: " seven 1 word", published: true)
      eight = author.articles.create!(title: "Lorem Ipsum", featured: false, body: "eight 1 word", published: true)
      nine = author.articles.create!(title: "Lorem Ipsum", featured: false, body: " nine 1 word", published: true)
      ten = author.articles.create!(title: "Lorem Ipsum", featured: false, body: "none of that in here", published: true)


      article_list = [one, two, three, four, five, six, seven, eight, nine]
      expected = [[five, three, four, two, nine], [six, seven, eight, one]]

      expect(Article.find_articles_by_keyword_and_paginate("word")).to eq(expected)
    end
  end
end
