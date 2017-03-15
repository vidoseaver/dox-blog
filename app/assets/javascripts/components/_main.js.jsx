var Main = React.createClass({

  getInitialState() {
  return { articles: []}
  },

  componentDidMount() {
    $.getJSON('/api/v1/articles.json', (response) => { this.setState({ articles: response, allArticles: response }) });
  },

  render() {
    return (
      <div>
        <div className='row'>
          <div className='section'>
            <div className='col-3-4'>
              <h1>Articles</h1>
            </div>
            <div className='col-1-4'>
              <h1>Search</h1>
            </div>
          </div>
        </div>
        <div className='row'>
          <div className='section'>
            <div className='pagination'>
              <h1>Pagination</h1>
            </div>
          </div>
        </div>
      </div>
    )
  }
});
