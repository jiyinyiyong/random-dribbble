
var
  hsl $ require :hsl
  React $ require :react

var
  imagesData $ require :../data

var
  ImageComponent $ React.createFactory $ require :./image

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :getInitialState $ \ ()
    {}
      :list $ []
      :leaveHandler $ \ ()

  :componentDidMount $ \ ()
    @generateImage

  :generateImage $ \ ()
    var
      n $ Math.floor $ * (Math.random) imagesData.length
    @setState $ {}
      :list $ @state.list.concat $ [] (. imagesData n)

  :onImageRemove $ \ (src)
    @setState $ {}
      :list $ @state.list.filter $ \ (x) (isnt x src)

  :onImageLoad $ \ (leaveHandler)
    @state.leaveHandler
    @setState $ {}
      :leaveHandler leaveHandler
    @generateImage

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      @state.list.map $ \\ (src)
        div ({} (:style $ @styleContainer) (:key src))
          ImageComponent $ {} (:src src) (:onRemove @onImageRemove)
            :onLoad @onImageLoad

  :styleRoot $ \ ()
    {}
      :backgroundColor $ hsl 0 0 0
      :position :absolute
      :width :100%
      :height :100%

  :styleContainer $ \ ()
    {}
      :position :absolute
      :width :100%
      :height :100%
      :display :flex
      :justifyContent :center
      :alignItems :center
      :left 0
      :top 0
      :zIndex 100
