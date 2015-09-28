<!-- aff -->
<pattern id="aff" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="//aff">
		<assert test="institution[@content-type='dept']" role="warning" diagnostics="no-institution-dept"/>
		<assert test="institution" role="error" diagnostics="no-institution"/>
		<assert test="addr-line" role="warning" diagnostics="no-addr-line"/>
		<assert test="country" role="error" diagnostics="no-country"/>
		<assert test="addr-line/named-content[@content-type='city']" role="warning" diagnostics="no-name-content-city"/>
	</rule>
	<diagnostics>
        <diagnostic id="no-institution-dept">There is no institution dept in <value-of select="." />.</diagnostic>
        <diagnostic id="no-institution">There is no institution in <value-of select="." />.</diagnostic>
     	<diagnostic id="no-addr-line">There is no addr-line in <value-of select="." />.</diagnostic>
		<diagnostic id="no-country">There is no country in <value-of select="." />.</diagnostic>
		<diagnostic id="no-name-content-city">There is no city in <value-of select="." />.</diagnostic>
	</diagnostics>
</pattern>