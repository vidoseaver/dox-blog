class HtmlWithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    safe_language = Pygments::Lexer.find_by_alias(language) ? language : nil

    sha = Digest::SHA1.hexdigest(code)
    Rails.cache.fetch ["code", safe_language, sha].join('-') do
      Pygments.highlight(code, lexer: safe_language)
    end
  end

  def link(link, title, content)
    title_attribute = "title='#{title}'" if title

    if  title_attribute
      "<a href='#{link}' #{title_attribute}>#{content}</a>"
    else
      # Redcarpet doesn't allow calls to super in overidden
      # render methods due to C shenanigans:
      # https://github.com/vmg/redcarpet/issues/51#issuecomment-1922079
      "<a href='#{link}'>#{content}</a>"
    end
  end

  def normal_text(text)
    text.gsub!("[ ]", "<input type='checkbox'>") if text.match(/^\[{1}\s\]{1}/)
    text.gsub!("[x]", "<input type='checkbox' checked>") if text.match(/^\[{1}(x|X)\]{1}/)

    text
  end

  def preprocess(full_document)
    full_document
  end

  private

  def article_status(link)
    'article-not-found' if !valid_article?(link)
  end
end
