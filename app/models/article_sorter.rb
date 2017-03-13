class ArticleSorter

  def self.count_of_apprearences_in_title(article, word)
    article.title.scan(/(?=#{word})/).count
  end

end
