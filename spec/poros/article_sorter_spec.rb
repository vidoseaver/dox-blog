require 'rails_helper'

describe "Article_sorter" do
  context ".count_of_apprearences_in_title(word)" do
    it "returns the amount of times a word appears in a title" do
      author = create(:author)
      article = author.articles.create!(title: "Blah Blah Cancer surviror", featured: false, body: "Random words", published: true)

      expect(ArticleSorter.count_of_apprearences(article, "title", "Cancer")).to eq(1)
    end
    it "returns the amount of times a word appears in a title and doesn't care about capitalization" do
      author = create(:author)
      article = author.articles.create!(title: "Blah blah BLAH Cancer surviror", featured: false, body: "Random words", published: true)

      expect(ArticleSorter.count_of_apprearences(article, "title", "Blah")).to eq(3)
    end
    it "is now dynamic and can can count appearance in body as well" do
      author = create(:author)
      article = author.articles.create!(title: "Blah blah BLAH Cancer surviror", featured: false, body: "Words WORDS words", published: true)

      expect(ArticleSorter.count_of_apprearences(article, "body", "words")).to eq(3)
    end
  end
  context ".articles_with_scores" do
    it "returns a 2D array with each object as an array with the article and then the score" do
      author = create(:author)
      article = author.articles.create!(title: "Blah blah BLAH Cancer surviror", featured: false, body: "Random words", published: true)

      expect(ArticleSorter.articles_with_scores([article], "Blah")).to eq([[article, 6]])
    end
  end
end
