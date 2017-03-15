var PageArticles = React.createClass({

  render() {
    var articles = this.props.articles.map(function(article, index){
      return (
        <div className='article' key={index}>
          <Article attributes={article}/>
        </div>
      )
    });

    return (
      <div>
        <div className="row">
          {articles}
        </div>
      </div>
    )
  }
});
