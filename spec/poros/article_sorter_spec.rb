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
    it "an article with the word in the body scores one" do
      author = create(:author)
      article = author.articles.create!(title: "Blah Cancer surviror", featured: false, body: "Random words", published: true)

      expect(ArticleSorter.articles_with_scores([article], "Random")).to eq([[article, 1]])
    end
    it "an article with the word in the title scores two" do
      author = create(:author)
      article = author.articles.create!(title: "Blah Cancer surviror", featured: false, body: "Random words", published: true)

      expect(ArticleSorter.articles_with_scores([article], "Blah")).to eq([[article, 2.1]])
    end
    it "returns a 2D array with each object as an array with the article and then the score" do
      author = create(:author)
      article = author.articles.create!(title: "Blah blah BLAH Cancer surviror", featured: false, body: "Random words", published: true)

      expect(ArticleSorter.articles_with_scores([article], "Blah")).to eq([[article, 6.3]])
    end
    it "works with multiple articles" do
      author = create(:author)
      article_one = author.articles.create!(title: "Blah Cancer surviror", featured: false, body: "Random words", published: true)
      article_two = author.articles.create!(title: "Blah Cancer surviror", featured: false, body: "Blah words", published: true)

      expect(ArticleSorter.articles_with_scores([article_one, article_two], "Blah")).to eq([[article_one, 2.1], [article_two, 3.1]])
    end
  end
  context ".sort_by_score_and_paginate(article_list, word)" do
    it "will sort articles by score of a word and paginate them into groups of five by default" do
      author = create(:author)
      one = author.articles.create!(title: "Ipsum Lorem", featured: false, body: "1 Word count 1", published: true)
      two = author.articles.create!(title: "Lorem Ipsum", featured: false, body: "2  word word", published: true)
      three = author.articles.create!(title: "Word Ipsum",  featured: false, body: "3.1  word word", published: true)
      four = author.articles.create!(title: "Remlo Word", featured: false, body: "2.1 ", published: true)
      five = author.articles.create!(title: "Lorem Ipsum", featured: false, body: "4 word word word word word", published: true)
      # six = author.articles.create!(title: "Lorem Ipsum", featured: false, body: "1 word", published: true)

      article_list = [one, two, three, four, five]
      expected = [[five, three, four, two, one]]

      expect(ArticleSorter.sort_by_score_and_paginate(article_list, "word")).to eq(expected)
    end
    it "makes multiple groups of five and can handle numbers non divisible by five " do
      author = create(:author)
      one = author.articles.create!(title: "Ipsum Lorem", featured: false, body: "1 Word count 1", published: true)
      two = author.articles.create!(title: "Lorem Ipsum", featured: false, body: "2  word word", published: true)
      three = author.articles.create!(title: "Word Ipsum",  featured: false, body: "3.1  word word", published: true)
      four = author.articles.create!(title: "Remlo Word", featured: false, body: "2.1 ", published: true)
      five = author.articles.create!(title: "Lorem word", featured: false, body: "6.1 word word word word word", published: true)
      six = author.articles.create!(title: "Lorem Ipsum", featured: false, body: " six 1 word", published: true)
      seven = author.articles.create!(title: "Lorem Ipsum", featured: false, body: " seven 1 word", published: true)
      eight = author.articles.create!(title: "Lorem Ipsum", featured: false, body: "eight 1 word", published: true)
      nine = author.articles.create!(title: "Lorem Ipsum", featured: false, body: " nine 1 word", published: true)

      article_list = [one, two, three, four, five, six, seven, eight, nine]
      expected = [[five, three, four, two, nine], [six, seven, eight, one]]

      expect(ArticleSorter.sort_by_score_and_paginate(article_list, "word")).to eq(expected)
    end
  end
  context ".paginate(list, size)" do
    it "breaks an array of things into a 2d array each the length of the size" do
      list = [1,2,3,4,5,6,7,8,9,10]
      size  = 6

      expected = [[1,2,3,4,5],[6,7,8,9,10]]

      expect(ArticleSorter.paginate(list, size)).to eq(expected)
    end
  end
end
