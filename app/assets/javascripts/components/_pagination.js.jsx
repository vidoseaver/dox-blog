var Pagination = React.createClass({

  handleClick(event){
    var page = parseInt(event.target.innerHTML)
    this.props.updatePage(event.target.innerHTML);
  },
  changePageByOne(event){
    var amount =  event.target.innerHTML === "Next →" ? 1 : - 1
    this.props.changePageByOne(amount);
  },
  renderDotsFromZero() {
    var dots = []
    for (var i = 1; i < 10; i++) {
      if (this.props.currentPage == 0 && this.props.currentPage == i - 1) {
        var dot = <a className="current" key={i}>{i}</a>
        dots.push(dot)
      } else {
        var dot = <a onClick={this.handleClick} key={i}>{i}</a>
        dots.push(dot)
      }
    }
    dots.push(<span className="gap">...</span>)
    dots.push(<a onClick={this.handleClick}>{this.props.pageCount -1}</a>)
    dots.push(<a onClick={this.handleClick}>{this.props.pageCount}</a>)
    return(dots)
  },

  renderDotsUnderEight() {
    var dots = []
    for (var i = 1; i < 10; i++) {
      if (this.props.currentPage == i) {
        var dot = <a className="current" key={i}>{i}</a>
        dots.push(dot)
      } else {
        var dot = <a onClick={this.handleClick} key={i}>{i}</a>
        dots.push(dot)
      }
    }
    dots.push(<span className="gap">...</span>)
    dots.push(<a onClick={this.handleClick}>{this.props.pageCount -1}</a>)
    dots.push(<a onClick={this.handleClick}>{this.props.pageCount}</a>)
    return(dots)
  },
  renderDotsUnderEight() {
    var dots = []
    for (var i = 1; i < 10; i++) {
      if (this.props.currentPage == i) {
        var dot = <a className="current" key={i}>{i}</a>
        dots.push(dot)
      } else {
        var dot = <a onClick={this.handleClick} key={i}>{i}</a>
        dots.push(dot)
      }
    }
    dots.push(<span className="gap">...</span>)
    dots.push(<a onClick={this.handleClick}>{this.props.pageCount -1}</a>)
    dots.push(<a onClick={this.handleClick}>{this.props.pageCount}</a>)
    return(dots)
  },
  renderDotsAtNine() {
    var pageCount   = parseInt(this.props.pageCount)
    var currentPage = parseInt(this.props.currentPage)
    var dots = []
    dots.push(<a onClick={this.handleClick}>1</a>)
    dots.push(<a onClick={this.handleClick}>2</a>)
    dots.push(<span className="gap">...</span>)
    for (var i = (currentPage - 4); i < (currentPage + 5); i++) {
      if (this.props.currentPage == i) {
        var dot = <a className="current" key={i}>{i}</a>
        dots.push(dot)
      } else {
        var dot = <a onClick={this.handleClick} key={i}>{i}</a>
        dots.push(dot)
      }
    }
    dots.push(<span className="gap">...</span>)
    dots.push(<a onClick={this.handleClick}>{this.props.pageCount -1}</a>)
    dots.push(<a onClick={this.handleClick}>{this.props.pageCount}</a>)
    return(dots)
  },

  renderDotsLastPage() {
    var pageCount   = parseInt(this.props.pageCount)
    var currentPage = parseInt(this.props.currentPage)
    var dots = []
    dots.push(<a onClick={this.handleClick}>1</a>)
    dots.push(<a onClick={this.handleClick}>2</a>)
    dots.push(<span className="gap">...</span>)
    for (var i = pageCount - 8; i <= pageCount; i++) {
      if (currentPage == i) {
        var dot = <a className="current" key={i}>{i}</a>
        dots.push(dot)
      } else {
        var dot = <a onClick={this.handleClick} key={i}>{i}</a>
        dots.push(dot)
      }
    }
    return(dots)
  },




  render(){
    var pageCount   = parseInt(this.props.pageCount)
    var currentPage = parseInt(this.props.currentPage)
    if (currentPage <= 1) {
      return (
        <div>
          <span className="previous_page disabled">← Previous</span>
          {this.renderDotsFromZero()}
          <a className="next_page " onClick={this.changePageByOne}>Next →</a>
        </div>
      )
    } else if (currentPage <= 8) {
      return (
        <div>
          <a className="previous_page " onClick={this.changePageByOne}>← Previous</a>
          {this.renderDotsUnderEight()}
          <a className="next_page " onClick={this.changePageByOne}>Next →</a>
        </div>
      )
    } else if (currentPage >= 9 && currentPage <= pageCount - 8) {
      return (
        <div>
          <a className="previous_page " onClick={this.changePageByOne}>← Previous</a>
          {this.renderDotsAtNine()}
          <a className="next_page " onClick={this.changePageByOne}>Next →</a>
        </div>
      )
    }  else if (currentPage ==  pageCount) {
      return(
        <div>
          <a className="previous_page " onClick={this.changePageByOne}>← Previous</a>
          {this.renderDotsLastPage()}
          <span className="next_page disabled ">Next →</span>
        </div>
      )
    } else if (currentPage >= pageCount - 8) {
      return (
        <div>
          <a className="previous_page " onClick={this.changePageByOne}>← Previous</a>
          {this.renderDotsLastPage()}
          <a className="next_page " onClick={this.changePageByOne}>Next →</a>
        </div>
      )
    }
  }
})
