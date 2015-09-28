<!-- article_meta -->
<pattern id="article_meta" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="article-meta">
		<let name="lastfivedigit" value="substring(article-id[@pub-id-type='doi'], string-length(article-id[@pub-id-type='doi']) - 4)"/>
		<let name="doi" value="string-join(('10.7554/eLife.',$lastfivedigit),'')"/>
		<let name="year" value="pub-date[@date-type='pub']/year"/>
		<let name="yearVal" value="substring(pub-date[@date-type='pub']/year, string-length(pub-date[@date-type='pub']/year))"/>
		<let name="volVal" value="format-number($year - 2011,'0')"/>
		<let name="href" value="string-join(('elife',$lastfivedigit,'.pdf'),'')"/>
		<assert test="article-id[@pub-id-type='publisher-id']" role="error" diagnostics="no-article-id-type-publisher-id"/>
		<assert test="matches( article-id[@pub-id-type='publisher-id'] , '^\d{5}$')" role="error" diagnostics="publisher-id-more-than-five"/>
		<assert test="matches( article-id[@pub-id-type='publisher-id'] , $lastfivedigit)" role="error" diagnostics="compare-five-digit"/>
		<assert test="matches(./volume,$volVal)" role="error" diagnostics="volume-incorrect"/>

		<assert test="article-id[@pub-id-type='doi']" role="error" diagnostics="no-article-id-type-doi"/>
		<assert test="matches( article-id[@pub-id-type='doi'] , '^10.7554/eLife\.\d{5}$')" role="error" diagnostics="invalid-doi"/>

		<assert test="article-categories" role="error" diagnostics="no-article-categories"/>
		
		<assert test="self-uri[@content-type='pdf']" role="error" diagnostics="invalid-content-pdf"/>
		<assert test="matches( self-uri/@xlink:href,$href)" role="error" diagnostics="invalid-selfuri-href-pdf"/>
	</rule>
	<rule context="article-meta/related-article">
		<let name="lastfivedigit" value="substring(article-id[@pub-id-type='doi'], string-length(article-id[@pub-id-type='doi']) - 4)"/>
		<let name="doi" value="string-join(('10.7554/eLife.',$lastfivedigit),'')"/>
		<assert test="matches(./@ext-link-type, 'doi')" role="error" diagnostics="invalid-relart-extlink-doi"/>
		<assert test="matches(./@related-article-type, '^(addendum|commentary|commentary-article|companion|corrected-article|correction-forward|in-this-issue|letter|partial-retraction|retracted-article|retraction-forward)$')" role="error" diagnostics="invalid-relart-addendum"/>
		<assert test="matches(./@xlink:href,$doi)" role="error" diagnostics="invalid-relart-href-doi"/>
	</rule>
	
	<diagnostics>
	        <diagnostic id="no-article-id-type-publisher-id">article-id of type 'publisher-id' is not present.</diagnostic>
		<diagnostic id="publisher-id-more-than-five">Incorrect publisher-id (<value-of select="article-id[@pub-id-type='publisher-id']"/>). Expecting a five digit number.</diagnostic>
		<diagnostic id="compare-five-digit">Given publisher-id (<value-of select="$lastfivedigit"/>) does not match with DOI.</diagnostic>
		<diagnostic id="volume-incorrect">Given volume <value-of select="./volume"/> does not match with correct volume <value-of select="$volVal"/> for publication year <value-of select="$year"/>.</diagnostic>
		<diagnostic id="no-article-id-type-doi">article-id tag of type 'doi' is not present.</diagnostic>
		<diagnostic id="invalid-doi">DOI does not follow the expected format '10.7554/eLife.XXXXX'.</diagnostic>	
		<diagnostic id="no-article-categories">article-categories tag is not present.</diagnostic>
		<diagnostic id="invalid-content-pdf">Incorrect Content-type appear in xml file (<value-of select="@content-type"/>). Expecting Content-type appear in xml file to be 'pdf' format only.</diagnostic>
		<diagnostic id="invalid-selfuri-href-pdf">Incorrect self-uri href <value-of select="self-uri/@xlink:href"/>. Expecting <value-of select="$href"/></diagnostic>
		<diagnostic id="invalid-relart-href-doi">Incorrect related-article href <value-of select="./@xlink:href"/>. Expecting <value-of select="$doi"/></diagnostic>
		<diagnostic id="invalid-relart-extlink-doi">Invalid ext-link-type <value-of select="./@ext-link-type"/> appears in xml file. It should be 'doi' only.</diagnostic>
		<diagnostic id="invalid-relart-addendum">Invalid related-article-type <value-of select="./@related-article-type"/> appears in xml file. It should be one of addendum|commentary|commentary-article|companion|corrected-article|correction-forward|in-this-issue|letter|partial-retraction|retracted-article|retraction-forward only</diagnostic>
	</diagnostics> 
</pattern>