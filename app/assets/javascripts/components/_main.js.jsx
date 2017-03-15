var Main = React.createClass({


  getInitialState() {
    return { pageArticles: [], titles: [], page: 0, searchWord: undefined, potentialWord: undefined  }
  },

  componentDidMount() {
    $.getJSON('/api/v1/articles?page=0', (response) => { this.setState({pageArticles: response}) });
    $.getJSON('/api/v1/article_titles', (response) => { this.setState({titles: response}) });
  },

  searchAndSetPages() {
    var searchWord = $('#_title1').val()
    $('#_title1').val('')

    $.getJSON('/api/v1/articles_title_search?search=' + searchWord + '&page=0', (response) => { this.setState({pageArticles: response}) });
    this.setState({searchWord: searchWord, page:0})
  },

  // filterAndSetPotentialWord(){
  //
  // }



  render() {
    return (
      <div>
        <div className='row'>
          <div className='section'>
            <div className='col-3-4'>
              <PageArticles articles={this.state.pageArticles} />
            </div>
            <div className='col-1-4'>
              <div className='search'>
                Search Articles
                <p>
                  <input type='text' name="[title]" id='_title1' value={this.state.potentialWord} onChange={filterAndSetPotentialWord}/>
                  <input type='submit' name = 'commit' value='Search' onClick={this.searchAndSetPages}/>
                </p>
              </div>
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
