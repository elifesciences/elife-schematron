<!-- abstract -->

<pattern id="abstract" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="//abstract[not(@abstract-type='executive-summary')]">
		<let name="lastfivedigit" value="substring(//article-meta/article-id[@pub-id-type='doi'], string-length(//article-meta/article-id[@pub-id-type='doi']) - 4)"/>
		<let name="objdoi" value="string-join(('10.7554/eLife.',$lastfivedigit,'.001'),'')"/>
		<let name="objdoiurl" value="string-join(('http://dx.doi.org/',$objdoi),'')"/>
		<assert test="matches(object-id[@pub-id-type='doi'], $objdoi )" role="error" diagnostics="invalid-object-id-doi"/>
		<assert test="matches(descendant::ext-link[@ext-link-type='doi'], $objdoiurl)" role="error" diagnostics="invalid-ext-link-doi"/>
		<assert test="matches(descendant::ext-link[@ext-link-type='doi']/@xlink:href, $objdoi )" role="error" diagnostics="invalid-ext-link-href"/>
		<report test="descendant::xref[@ref-type='bibr']" role="error" diagnostics="present-xref-bibr"/>
		<assert test="descendant::ext-link[@ext-link-type='uri']" role="warning" diagnostics="absent-ext-link-uri"/>
	</rule>
	
	<rule context="//abstract[@abstract-type='executive-summary']">
		<let name="lastfivedigit" value="substring(//article-meta/article-id[@pub-id-type='doi'], string-length(//article-meta/article-id[@pub-id-type='doi']) - 4)"/>
		<let name="objdoi" value="string-join(('10.7554/eLife.',$lastfivedigit,'.002'),'')"/>
		<let name="objdoiurl" value="string-join(('http://dx.doi.org/',$objdoi),'')"/>
		<assert test="./title[text()[contains(.,'eLife digest')]]" role="error" diagnostics="no-title"/>
		<assert test="matches(object-id[@pub-id-type='doi'], $objdoi )" role="error" diagnostics="invalid-object-id-doi"/>
		<assert test="matches(descendant::ext-link[@ext-link-type='doi'], $objdoiurl)" role="error" diagnostics="invalid-ext-link-doi"/>
		<assert test="matches(descendant::ext-link[@ext-link-type='doi']/@xlink:href, $objdoi )" role="error" diagnostics="invalid-ext-link-href"/>
	</rule>
	
	<diagnostics>
		<diagnostic id="invalid-object-id-doi">The abstract has an invalid Object-id <value-of select="object-id[@pub-id-type='doi']"/>. It should be <value-of select="$objdoi"/></diagnostic>
		<diagnostic id="present-xref-bibr">Abstract has xref[@ref-type='bibr'] tag.</diagnostic>
		<diagnostic id="absent-ext-link-uri">Abstract does not have ext-link[@ ext-link-type='uri'] tag.</diagnostic>
		<diagnostic id="no-title">The abstract title "<value-of select="./title"/>" should contain "eLife digest"</diagnostic>
		<diagnostic id="invalid-ext-link-doi">The ext-link [@ ext-link-type='doi'] has an invalid Object-id <value-of select="descendant::ext-link[@ext-link-type='doi']"/> for abstract. It should be <value-of select="$objdoiurl"/></diagnostic>
		<diagnostic id="invalid-ext-link-href">The ext-link [@ ext-link-type='doi'] has an invalid href <value-of select="descendant::ext-link[@ext-link-type='doi']/@xlink:href"/> for abstract. It should be <value-of select="$objdoi"/></diagnostic>
	</diagnostics>
</pattern>