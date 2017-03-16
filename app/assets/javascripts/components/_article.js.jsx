var Article = React.createClass({
  getDefaultProps(){
    return ({ article: {}})
  },
  render() {
    var article = this.props.attributes;

    var newStyle =   {backgroundImage: 'url('+ article.image_path +')'}
    return (
      <div>
        <a href={"/articles/" + article.slug }>
          <div className="hero-secondary" style={newStyle}>
            <h1>{article.title}</h1>
          </div>
        </a>
        <p className="article-body"></p>
        <p>{article.body}</p>
        <p></p>
        <p className="meta">
          {article.time + " " }
          <span className="stick">|</span>
          {" " + article.author}
        </p>
      </div>
    )

  }
})
