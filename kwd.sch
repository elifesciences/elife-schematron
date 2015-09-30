<!-- kwd -->
<pattern id="article-meta/kwd" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="//article-meta/kwd-group[@kwd-group-type='author-keywords']">
		<assert test="./title[text()[contains(.,'Author keywords')]]" role="error" diagnostics="author-keywords"/>
	</rule>

	<rule context="//article-meta/kwd-group[@kwd-group-type='research-organism']">
		<assert test="./title[text()[contains(.,'Research organism')]]" role="error" diagnostics="research-organism"/>
	</rule>
	<diagnostics>
		<diagnostic id="author-keywords">The title <value-of select="./title"/> should contain the text "Author keywords".</diagnostic>
	 	<diagnostic id="research-organism">The title <value-of select="./title"/> should contain the text "Research organism".</diagnostic>
	</diagnostics>
</pattern>