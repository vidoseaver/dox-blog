class ArticleSorter

  def self.count_of_apprearences(article, section_to_search, word)
    section  = article.send(section_to_search).downcase
    section.scan(/(?=#{word.downcase})/).count
  end

  def self.articles_with_scores(list_of_articles, word)
    list_of_articles.map do |article|
      title_score = self.count_of_apprearences(article, "title", word) * 2
      body_score = self.count_of_apprearences(article, "body", word)
      [article, title_score + body_score]
    end
  end

end
