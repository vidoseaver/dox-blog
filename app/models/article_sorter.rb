class ArticleSorter

  def self.count_of_apprearences(article, section_to_search, word)
    section  = article.send(section_to_search).downcase
    section.scan(/(?=#{word.downcase})/).count
  end

  def self.articles_with_scores(list_of_articles, word)
    list_of_articles.map do |article|
      title_score = (self.count_of_apprearences(article, "title", word) * 2.1).round(2)
      body_score = self.count_of_apprearences(article, "body", word)
      [article, title_score + body_score]
    end
  end

  def self.sort_by_score_and_paginate(list, word, pag_count = 5)
    scored_articles = self.articles_with_scores(list, word)
    sorted_articles = scored_articles.sort_by{ |article, score| score}.reverse
    cleaned_articles = sorted_articles.flatten.delete_if{ |article| article.class == Fixnum || article.class == Float}
    paginated = Array.new
    until cleaned_articles.empty?
      paginated << cleaned_articles.slice!(0..4)
    end
    paginated
  end
  def self.paginate(list, size)
    chunked_list = Array.new
    until list.empty?
      chunked_list << list.slice!(0..4)
    end
    chunked_list
  end
end
