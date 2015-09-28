<!-- contrib-group-->
<pattern id="contrib-group" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="contrib-group">
		<assert test="contrib" role="error" diagnostics="no-contrib"/>
		<report test="on-behalf-of" role="warning" diagnostics="on-behalf-of-present"/>
	</rule>
	
	<rule context="contrib-group/*">
		<assert test="self::contrib or self::on-behalf-of or self::aff" role="error" diagnostics="unknown-contrib-group-child" />
	</rule>
	<rule context="contrib-group/on-behalf-of">
		<assert test="on-behalf-of[text()[contains(.,'on behalf of')]]" role="warning" diagnostics="on-behalf-of-missing"/>
        </rule>
	<rule context="contrib">
		<assert test="parent::contrib-group" role="error" diagnostics="invalid-contrib" />
		<assert test="./@corresp='yes' and child::xref[@ref-type='corresp']" role="error" diagnostics="missing-xref-corresp" />
	</rule>
	
	<rule context="contrib[@corresp='yes']">
		<assert test="./xref[@ref-type='corresp']" role="error" diagnostics="missing-xref-corresp" />
	</rule>
	
	<rule context="contrib[@contrib-type='author']/contrib-id[@contrib-id-type='group-author-key']">
		<assert test="following-sibling::collab" role="error" diagnostics="missing-collab-group-author" /> 
	</rule>
	
	<rule context="aff">
		<assert test="parent::contrib-group or parent::contrib" role="error" diagnostics="no-aff" />
	</rule>
	
	<diagnostics>
	 	<diagnostic id="no-contrib">contrib tag is not present.</diagnostic>
		<diagnostic id="invalid-contrib">contrib tag should be contained within contrib-group.</diagnostic>
		<diagnostic id="on-behalf-of-present">on-behalf-of tag is present.</diagnostic>
		<diagnostic id="on-behalf-of-missing">on-behalf-of statement "<value-of select="./on-behalf-of" />" does not have the text "on behalf of" in its contents.</diagnostic>
		<diagnostic id="missing-collab-group-author">Collab is missing for group-author <value-of select="." />.</diagnostic>
		<diagnostic id="missing-xref-corresp">xref corresp is missing for contrib</diagnostic>
		<diagnostic id="no-aff">aff tag should be present only within contrib-group or contrib.</diagnostic>
		<diagnostic id="unknown-contrib-group-child"><value-of select="name(.)" /> tag is not expected here.</diagnostic>
	</diagnostics>
</pattern>