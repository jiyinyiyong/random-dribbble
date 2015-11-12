
var
  React $ require :react
  ReactDOM $ require :react-dom

var
  Page $ React.createFactory $ require :./app/page

require :../style/main.css

ReactDOM.render (Page) (document.querySelector :#app)
