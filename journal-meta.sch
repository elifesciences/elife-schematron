<!-- journal-meta -->
<pattern id="journal-meta" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="journal-meta">
		<assert test="journal-id[@journal-id-type='nlm-ta']" role="error" diagnostics="no-journal-id-nlm-ta"/>
		<assert test="journal-id[@journal-id-type='nlm-ta'] = 'elife'" role="error" diagnostics="incorrect-nlm-ta-type"/>

		<assert test="journal-id[@journal-id-type='hwp']" role="error" diagnostics="no-journal-id-hwp"/>
		<assert test="journal-id[@journal-id-type='hwp'] = 'eLife'" role="error" diagnostics="incorrect-hwp-type"/>

		<assert test="journal-id[@journal-id-type='publisher-id']" role="error" diagnostics="no-journal-id-publisher-id"/>
		<assert test="journal-id[@journal-id-type='publisher-id'] = 'eLife'" role="error" diagnostics="incorrect-publisher-id"/>
		
		<assert test="journal-title-group" role="error" diagnostics="no-journal-title-group"/>
		<assert test="journal-title-group/journal-title = 'eLife'" role="error" diagnostics="incorrect-journal-title-group"/>
		
		<assert test="issn[@publication-format='electronic'] = '2050-084X'" role="error" diagnostics="incorrect-issn"/>
		<assert test="publisher/publisher-name = 'eLife Sciences Publications, Ltd'" role="error" diagnostics="incorrect-publisher-name"/>

	</rule>
	
	<diagnostics>
	 	<diagnostic id="no-journal-id-nlm-ta">journal-id tag of type 'nlm-ta' is not present.</diagnostic>
        <diagnostic id="incorrect-nlm-ta-type">journal-id tag of type 'nlm-ta' has an incorrect value (<value-of select="journal-id[@journal-id-type='nlm-ta']"/>). Expecting it to be 'elife'.</diagnostic>
		
	 	<diagnostic id="no-journal-id-hwp">journal-id tag of type 'hwp' is not present.</diagnostic>
        <diagnostic id="incorrect-hwp-type">journal-id tag of type 'hwp' has an incorrect value (<value-of select="journal-id[@journal-id-type='hwp']"/>). Expecting it to be 'eLife'.</diagnostic>
		
		<diagnostic id="no-journal-id-publisher-id">journal-id tag of type 'hwp' is not present.</diagnostic>
		<diagnostic id="incorrect-publisher-id">journal-id tag of type 'hwp' has an incorrect value (<value-of select="journal-id[@journal-id-type='publisher-id']"/>). Expecting it to be 'eLife'.</diagnostic>
		
        <diagnostic id="no-journal-title-group">journal-title-group tag is not present.</diagnostic>
		<diagnostic id="incorrect-journal-title-group">journal-title tag has an incorrect value (<value-of select="journal-title-group/journal-title"/>). Expecting it to be "eLife".</diagnostic>

        <diagnostic id="incorrect-issn">Invalid ISSN (<value-of select="issn"/>). It should be "2050-084X".</diagnostic>
		<diagnostic id="incorrect-publisher-name">Incorrect Publisher Name (<value-of select="publisher/publisher-name"/>). Expecting it to be "eLife Sciences Publications, Ltd".</diagnostic>
	</diagnostics>
	
</pattern>