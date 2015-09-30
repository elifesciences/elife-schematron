<!-- dates -->
<pattern id="dates" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="//pub-date/day|//pub-date/month|//date/day|//date/month">
		<assert test='matches( . , "^\d{2}$")' role="error" diagnostics="matches-date"/>
	</rule>
	<rule context="//pub-date/year|//date/year">
		<assert test='matches( . , "^\d{4}$")' role="error" diagnostics="matches-pub-date"/>
	</rule>
	
	<rule context="//history">
		<assert test="date[@date-type='received']" role="error" diagnostics="no-date-received"/>
		<assert test="date[@date-type='accepted']" role="error" diagnostics="no-date-accepted"/>
	</rule>

	<diagnostics>
	 	<diagnostic id="matches-date">Value <value-of select="." /> is incorrect. <name path=".."/>/<name path="."/> must have only two digit number.</diagnostic>
		<diagnostic id="matches-pub-date">Value <value-of select="." /> is incorrect. <name path=".."/>/<name path="."/> must have only four digit year.</diagnostic>
		<diagnostic id="no-date-received">There is no tag for Date Received.</diagnostic>
		<diagnostic id="no-date-accepted">There is no tag for Date Accepted.</diagnostic>
	</diagnostics>
</pattern>