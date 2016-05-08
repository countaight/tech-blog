@ArticleForm = React.createClass
	getInitialState: ->
		title: ''
		text: ''
	handleSubmit: (e) ->
		e.preventDefault()
		$.post '/articles', { article: @state }, (data) =>
			@props.handleNewArticle data
			@setState @getInitialState()
		, 'JSON'
	handleChange: (e) ->
		name = e.target.name
		@setState "#{ name }": e.target.value
	valid: ->
		@state.title && @state.text
	render: ->
		React.DOM.form
			className: 'form-inline'
			onSubmit: @handleSubmit
			React.DOM.div
				className: 'form-group'
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'Title'
					name: 'title'
					value: @state.title
					onChange: @handleChange
			React.DOM.div
				className: 'form-group'
				React.DOM.textarea
					className: 'form-control'
					placeholder: 'Blog Text'
					name: 'text'
					value: @state.text
					onChange: @handleChange
			React.DOM.button
				type: 'submit'
				disabled: !@valid()
				'Post Article'
