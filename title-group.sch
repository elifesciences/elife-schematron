<!-- title-group -->
<pattern id="title-group" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="title-group">
		<assert test="matches( ./article-title ,'^\p{Lu}')" role="error" diagnostics="matches"/>
		<assert test='not(matches( ./article-title , ":|;|""|" ))' role='warning' diagnostics='art-title-not-matches'/>
	</rule>
	<diagnostics>
	 	<diagnostic id="matches">article-title tag should start with capital letter.</diagnostic>
		<diagnostic id="art-title-not-matches">article-title has a character that is not allowed, e.g., [:;'"].</diagnostic>
	</diagnostics>
</pattern>