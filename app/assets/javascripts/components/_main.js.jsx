var Main = React.createClass({


  getInitialState() {
    return { pageArticles: [], allArticles: []  }
  },

  componentDidMount() {
    $.getJSON('/api/v1/articles?page=0', (response) => { this.setState({pageArticles: response}) });
  },


  render() {
    return (
      <div>
        <div className='row'>
          <div className='section'>
            <div className='col-3-4'>
              <PageArticles articles={this.state.pageArticles} />
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
