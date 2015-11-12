
var
  hsl $ require :hsl
  React $ require :react

var
  ({}~ div img) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-image

  :propTypes $ {}
    :src React.PropTypes.string.isRequired
    :onRemove React.PropTypes.func.isRequired
    :onLoad React.PropTypes.func.isRequired

  :getInitialState $ \ ()
    {}
      :opacity 0
      :width 0
      :height 0

  :componentWillMount $ \ ()
    = @imgEl $ document.createElement :img
    = @imgEl.src @props.src
    = @imgEl.onload @onLoad

  :onDestroy $ \ ()
    @props.onRemove @props.src

  :onLeave $ \ ()
    @setState $ {} (:opacity 0)
    setTimeout @onDestroy 600

  :onLoad $ \ (event)
    setTimeout
      \\ ()
        @props.onLoad @onLeave
        @setState $ {} (:opacity 1)
          :width @imgEl.width
          :height @imgEl.height
      , 1000

  :render $ \ ()
    img $ {} (:style $ @styleRoot)
      :src @props.src

  :styleRoot $ \ ()
    {}
      :opacity @state.opacity
      :width @state.width
      :height @state.height
      :transitionDuration :600ms
      :transitionProperty :opacity
