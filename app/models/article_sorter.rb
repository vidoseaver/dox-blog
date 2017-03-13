class ArticleSorter

  def self.count_of_apprearences_in_title(article, word)
    title  = article.title.downcase
    title.scan(/(?=#{word.downcase})/).count
  end

end
