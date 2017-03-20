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
    var dots = []

    if (currentPage <= 1) {
      dots.push(<NextGapOrPrev disabled={true} pageDirection="← Previous" />)
    } else  if ( currentPage > 8){
      dots.push(<NextGapOrPrev changePageByOne={this.changePageByOne} pageDirection="← Previous" />)
      dots.push(<a onClick={this.handleClick}>1</a>)
      dots.push(<a onClick={this.handleClick}>2</a>)
      dots.push(<span className="gap">...</span>)
    } else {
      dots.push(<NextGapOrPrev changePageByOne={this.changePageByOne}  pageDirection="← Previous" />)
    }

    for (var i = startCount; i < endCount; i++) {
      if (currentPage == 0 && currentPage == i - 1) {
        var dot = <PageDot className="current" pageNumber={i}/>
      } else if (currentPage == i) {
        var dot = <PageDot className="current" pageNumber={i}/>
      } else {
        var dot = <PageDot handleClick={this.handleClick} pageNumber={i}/>
      }
      dots.push(dot)
    }

    if (pageCount === currentPage) {
      dots.push(<NextGapOrPrev  disabled={true} pageDirection="Next →"/>)
    } else if (pageCount - 7 <= currentPage) {
      dots.push(<NextGapOrPrev changePageByOne={this.changePageByOne} pageDirection="Next →"/>)
    } else {
      dots.push(<NextGapOrPrev pageDirection="..."/>)
      dots.push(<PageDot handleClick={this.handleClick} pageNumber={this.props.pageCount -1}/>)
      dots.push(<PageDot handleClick={this.handleClick} pageNumber={this.props.pageCount}/>)
      dots.push(<NextGapOrPrev changePageByOne={this.changePageByOne} pageDirection="Next →"/>)
    }
    return(dots)
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
