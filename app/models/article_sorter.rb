class ArticleSorter

  def self.count_of_apprearences(article, section_to_search, word)
    section  = article.send(section_to_search).downcase
    section.scan(/(?=#{word.downcase})/).count
  end

end
