<!-- article_meta -->
<pattern id="article_meta" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="article-meta">
		<let name="lastfivedigit" value="substring(article-id[@pub-id-type='doi'], string-length(article-id[@pub-id-type='doi']) - 4)"/>

		<assert test="article-id[@pub-id-type='publisher-id']" role="error" diagnostics="no-article-id-type-publisher-id"/>
		<assert test="matches( article-id[@pub-id-type='publisher-id'] , '^\d{5}$')" role="error" diagnostics="publisher-id-more-than-five"/>
		<assert test="matches( article-id[@pub-id-type='publisher-id'] , $lastfivedigit)" role="error" diagnostics="compare-five-digit"/>

		<assert test="article-id[@pub-id-type='doi']" role="error" diagnostics="no-article-id-type-doi"/>
		<assert test="matches( article-id[@pub-id-type='doi'] , '^10.7554/eLife\.\d{5}$')" role="error" diagnostics="invalid-doi"/>

		<assert test="article-categories" role="error" diagnostics="no-article-categories"/>
	</rule>
	
	<diagnostics>
        <diagnostic id="no-article-id-type-publisher-id">article-id of type 'publisher-id' is not present.</diagnostic>
		<diagnostic id="publisher-id-more-than-five">Incorrect publisher-id (<value-of select="article-id[@pub-id-type='publisher-id']"/>). Expecting a five digit number.</diagnostic>
		<diagnostic id="compare-five-digit">Given publisher-id (<value-of select="$lastfivedigit"/>) does not match with DOI.</diagnostic>
		
		<diagnostic id="no-article-id-type-doi">article-id tag of type 'doi' is not present.</diagnostic>
		<diagnostic id="invalid-doi">DOI does not follow the expected format '10.7554/eLife.XXXXX'.</diagnostic>
		
     	<diagnostic id="no-article-categories">article-categories tag is not present.</diagnostic>
	</diagnostics> 
</pattern>