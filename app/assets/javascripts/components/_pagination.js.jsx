var Pagination = React.createClass({

  handleClick(pageNumber){
    this.props.updatePage(pageNumber);
  },
  changePageByOne(amount){
    this.props.changePageByOne(amount);
  },

  renderPagination(startCount, endCount) {
    var pageCount   = parseInt(this.props.pageCount)
    var currentPage = this.props.currentPage
    var buttons = []
    buttons.push(this.renderPreviousButton())
    for (var i = startCount; i < endCount; i++) {
      if (currentPage == 0 && currentPage == i - 1) {
        var dot = <PageDot className="current" pageNumber={i}/>
      } else if (currentPage == i) {
        var dot = <PageDot className="current" pageNumber={i}/>
      } else {
        var dot = <PageDot handleClick={this.handleClick} pageNumber={i}/>
      }
      buttons.push(dot)
    }
    buttons.push(this.renderNextButton())
    return(_.flatten(dots))
  },

  renderPreviousButton() {
    var currentPage = this.props.currentPage
    var buttons = []
    if (currentPage <= 1) {
      buttons.push(<NextGapOrPrev disabled={true} pageDirection="← Previous" />)
    } else  if ( currentPage > 8){
      buttons.push(<NextGapOrPrev changePageByOne={this.changePageByOne} pageDirection="← Previous" />)
      buttons.push(<a onClick={this.handleClick}>1</a>)
      buttons.push(<a onClick={this.handleClick}>2</a>)
      buttons.push(<span className="gap">...</span>)
    } else {
      buttons.push(<NextGapOrPrev changePageByOne={this.changePageByOne}  pageDirection="← Previous" />)
    }
    return buttons
  },

  renderNextButton() {
    var currentPage = this.props.currentPage
    var buttons = []
    if (pageCount === currentPage) {
      buttons.push(<NextGapOrPrev  disabled={true} pageDirection="Next →"/>)
    } else if (pageCount - 7 <= currentPage) {
      buttons.push(<NextGapOrPrev changePageByOne={this.changePageByOne} pageDirection="Next →"/>)
    } else {
      buttons.push(<NextGapOrPrev pageDirection="..."/>)
      buttons.push(<PageDot handleClick={this.handleClick} pageNumber={this.props.pageCount -1}/>)
      buttons.push(<PageDot handleClick={this.handleClick} pageNumber={this.props.pageCount}/>)
      buttons.push(<NextGapOrPrev changePageByOne={this.changePageByOne} pageDirection="Next →"/>)
    }
    return buttons
  },

  render(){
    var pageCount   = parseInt(this.props.pageCount)
    var currentPage = parseInt(this.props.currentPage)
    if (currentPage <= 8) {
      return (
        <div>
          {this.renderPagination(1,10)}
        </div>
      )
    } else if (currentPage >= 9 && currentPage <= pageCount - 8) {
      return (
        <div>
          {this.renderPagination(currentPage - 4, currentPage + 5)}
        </div>
      )
    } else if (currentPage >= pageCount - 8) {
      return (
        <div>
          {this.renderPagination(pageCount - 8, pageCount + 1)}
        </div>
      )
    }
  }
})
