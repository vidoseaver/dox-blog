require "rails_helper"


describe "api/v1/article_titles" do
  context "get to #index" do
    it "returns json for all articles titles" do
      author_one, author_two = create_list(:author, 2)
      author_one.articles.create!(title: "Author one Article one", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      author_one.articles.create!(title: "Author one Article two", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      author_two.articles.create!(title: "Author two Article one", featured: false, body: "Little Bo-Pepe survided cancer", published: true)
      author_two.articles.create!(title: "Author two Article two", featured: false, body: "Little Bo-Pepe survided cancer", published: true)

      get api_v1_article_titles_path

      articles = JSON.parse(response.body, symbolize_names:true)

      expect(response).to be_success
      expect(articles.count).to eq 4
      expect(articles[0][:title]).to eq "Author one Article one"
      expect(articles[1][:title]).to eq "Author one Article two"
      expect(articles[2][:title]).to eq "Author two Article one"
      expect(articles[3][:title]).to eq "Author two Article two"
    end
  end
end
