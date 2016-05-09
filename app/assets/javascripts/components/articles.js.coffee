@Articles = React.createClass
	getInitialState: ->
		articles: @props.data
	getDefaultProps: ->
		articles: []
	addArticle: (article) ->
		articles = @state.articles.slice()
		articles.push article
		@setState articles: articles
	render: ->
		React.DOM.div
			className: 'articles'
			React.DOM.h1
				className: 'main-h1'
				'Latest Articles'
			React.createElement ArticleForm, handleNewArticle: @addArticle
			React.DOM.div
				className: 'articles-list'
				for article in @state.articles
					React.createElement Article, key: article.id, article: article
