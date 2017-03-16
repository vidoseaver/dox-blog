require "rails_helper"


describe "api/v1/articles_count" do
  context "get to #index" do
    it "returns count for all articles" do
      author_one, author_two = create_list(:author, 2)
      author_one.articles.create!(title: "Author one Article one", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      author_one.articles.create!(title: "Author one Article two", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      author_two.articles.create!(title: "Author two Article one", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      author_two.articles.create!(title: "Author two Article two", featured: false, body: "Little Bo-Pepe survided cancer", published: true)

      get api_v1_articles_count_index_path


      expect(response).to be_success
      expect(response.body).to eq "4"

    end
    it "returns count for all articles searched" do
      author_one, author_two = create_list(:author, 2)
      author_one.articles.create!(title: "Author one Article one", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      author_one.articles.create!(title: "Author one Article two", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      author_two.articles.create!(title: "Author two Article one", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      author_two.articles.create!(title: "Author two Article two", featured: false, body: "Little Bo-Pepe survided cancer", published: true)

      get api_v1_articles_count_index_path(search:"one")


      expect(response).to be_success
      expect(response.body).to eq "3"

    end
  end
end
