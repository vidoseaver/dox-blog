var PageDot = React.createClass({

  handleClick(event){
    var pageNumber = parseInt(event.target.innerHTML)
    this.props.handleClick(pageNumber);
  },


  render() {
    var pageNumber = this.props.pageNumber
    if (this.props.className) {
      return (<a className="current" key={pageNumber}>{pageNumber}</a>)
    } else {
      return (<a onClick={this.handleClick} key={pageNumber}>{pageNumber}</a>)
    }

  }
})
