<!-- funding-group -->
<pattern id="funding-group" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="//funding-group">
		<assert test="funding-statement" role="error" diagnostics="funding-statement"/>
		<assert test="count(award-group) > 0" role="warning" diagnostics="award-group"/>
		<report test="count(award-group) = 0 and ./funding-statement[text()[contains(.,'No external funding was received for this work.')]]" role="error" diagnostics="count-award-group"/>
	</rule>

	<rule context="//funding-group/award-group">
		<assert test="funding-source" role="error" diagnostics="no-funding-source"/>
		<assert test="funding-source/institution-wrap" role="error" diagnostics="no-institution-wrap"/>
		<assert test="funding-source/institution-wrap/institution-id[@institution-id-type='FundRef']" role="warning" diagnostics="no-institution-id-FundRef"/>
		<assert test="principal-award-recipient" role="error" diagnostics="no-principal-award-recipient"/>
		<assert test="award-id" role="warning" diagnostics="no-award-id"/>
	</rule>
	
	<rule context="//institution-wrap/institution">
		<assert test='matches(., "^\p{Lu}")' role="error" diagnostics="no-institution-caps"/>
	</rule>
	
	<diagnostics>
		<diagnostic id="no-institution-id-FundRef">There is no tag for Institution-Id[@institution-id-type='FundRef'] for institution <value-of select="./funding-source/institution-wrap/institution"/> .</diagnostic>
	 	<diagnostic id="no-funding-source">There is no tag for Funding-Source for award-group <value-of select="./."/>.</diagnostic>
		<diagnostic id="no-institution-wrap">There is no tag for Institution-Wrap for award-group <value-of select="./."/>.</diagnostic>
		<diagnostic id="no-principal-award-recipient">There is no tag for Principal-Award-Recipient for award-group <value-of select="./."/>.</diagnostic>
		<diagnostic id="no-award-id">There is no tag for Award-Id for award-group <value-of select="./."/>.</diagnostic>
		<diagnostic id="no-institution-caps">The institution <value-of select="."/> should be capitalized.</diagnostic>
	 	<diagnostic id="funding-statement">There is no tag for funding-group/funding-statement.</diagnostic>
		<diagnostic id="award-group">There is no tag provided for funding-group/award-group.</diagnostic>
		<diagnostic id="count-award-group">No funding-group/award-group tag provided and funding-statement is not "No external funding was received for this work.".</diagnostic>
    </diagnostics>
</pattern>