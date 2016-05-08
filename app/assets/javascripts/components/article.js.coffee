@Article = React.createClass
	render: ->
		React.DOM.article null,
			React.DOM.h2 null,
				React.DOM.a
					href: "/articles/" + @props.article.id
					@props.article.title
			React.DOM.p null, @props.article.text
