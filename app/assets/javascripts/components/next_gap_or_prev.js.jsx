var NextGapOrPrev = React.createClass({

  handleClick(event){
    var amount =  event.target.innerHTML === "Next →" ? 1 : - 1
    this.props.changePageByOne(amount);
  },

  render(){
    var pageDirection = this.props.pageDirection


    // moved pageClassName into if else to avoid breaking if "..." less dry but just as effiecent?
    // could break apart if elseif into two if and keep it drier...

    if (pageDirection == "...") {
      return (<span className="gap">...</span> )
    } else if (this.props.disabled) {
      var direction =  pageDirection.split(" ")[1].toLowerCase() == "previous" ? "previous" : "next"
      var pageClassName =  direction + "_page"
      return (<span className={pageClassName + " disabled"} >{pageDirection}</span>)
    } else {
      var direction =  pageDirection.split(" ")[1].toLowerCase() == "previous" ? "previous" : "next"
      var pageClassName =  direction + "_page"
      return (<a className={pageClassName} onClick={this.handleClick}>{pageDirection}</a>)
    }
  }
})
