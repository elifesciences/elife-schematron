<!-- Front -->
<pattern id="front" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="front">
		<assert test="journal-meta" role="error" diagnostics="missing-journal-meta-tag"/>
		<assert test="article-meta" role="error" diagnostics="missing-article-meta-tag"/>
	</rule>
	
	<diagnostics>
        <diagnostic id="missing-journal-meta-tag">Journal-Meta tag is missing.</diagnostic>
        <diagnostic id="missing-article-meta-tag">Article-Meta tag is missing.</diagnostic>
    </diagnostics> 
</pattern>