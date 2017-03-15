var Main = React.createClass({


  getInitialState() {
    return { pageArticles: [], titles: [], page: 0, searchWord: undefined, potentialWord: undefined, matches:[]  }
  },

  componentDidMount() {
    $.getJSON('/api/v1/articles?page=0', (response) => { this.setState({pageArticles: response}) });
    $.getJSON('/api/v1/article_titles', (response) => { this.setState({titles: response}) });
  },

  searchAndSetPages() {
    var searchWord = $('#_title').val()
    $('#_title1').val('')

    $.getJSON('/api/v1/articles_title_search?search=' + searchWord + '&page=0', (response) => { this.setState({pageArticles: response}) });
    this.setState({searchWord: searchWord, page:0})
  },

  cleanTitles() {
    cleaned = this.state.titles.map(function(article){
      return article.title;
    })
    this.setState({titles: cleaned})
  },

  updatePage(){

  },

  createDataList() {
    var dataList = document.getElementById('matches-datalist')
    this.state.titles.forEach((match) => {
      var option = document.createElement('option')
      option.value = match
      dataList.appendChild(option)
    })
  },


  render() {
    if (this.state.titles.length > 0 && typeof this.state.titles[0] != 'string') {
      this.cleanTitles()
    }
    if (typeof this.state.titles[0] == 'string' ) {
      this.createDataList()
    }

    return (
      <div>
        <div className='row'>
          <div className='section'>
            <div className='pagination'>
            </div>
          </div>
        </div>
        <div className='row'>
          <div className='section'>
            <div className='col-3-4'>
              <PageArticles articles={this.state.pageArticles} />
            </div>
            <div className='col-1-4'>
              <div className='search'>
                Search Articles
                <form>
                  <input type='text' name='[title]' id='_title' list="matches-datalist"/>
                      <datalist id='matches-datalist'></datalist>
                  <input type='submit' name='commit' value='Search' onClick={this.searchAndSetPages}/>
                </form>
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
