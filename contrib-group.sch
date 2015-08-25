<!-- contrib-group-->
<pattern id="contrib-group" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="contrib-group">
		<assert test="contrib" role="error" diagnostics="no-contrib"/>
		<report test="on-behalf-of" role="warning" diagnostics="on-behalf-of"/>
		<assert test="aff" role="error" diagnostics="no-aff"/>
	</rule>
	
	<rule context="contrib-group/*">
		<assert test="self::contrib or self::on-behalf-of or self::aff" role="error" diagnostics="unknown-contrib-group-child" />
	</rule>
	<rule context="contrib[@corresp='yes']">
		<assert test="./xref[@ref-type='corresp']" role="error" diagnostics="missing-xref-corresp" />
	</rule>
	<rule context="contrib[@contrib-type='author']/contrib-id[@contrib-id-type='group-author-key']">
		<assert test="following-sibling::collab" role="error" diagnostics="missing-collab-group-author"/> 
	</rule>
	<diagnostics>
	 	<diagnostic id="no-contrib">contrib tag is not present.</diagnostic>
		<diagnostic id="on-behalf-of">on-behalf-of tag is present.</diagnostic>
		<diagnostic id="missing-collab-group-author">Collab is missing for group-author <value-of select="." />.</diagnostic>
		<diagnostic id="missing-xref-corresp">xref corresp is missing for collab <value-of select="./collab" /></diagnostic>
		<diagnostic id="no-aff">aff tag is not present.</diagnostic>
		<diagnostic id="unknown-contrib-group-child"><value-of select="name(.)" /> tag is not expected here.</diagnostic>
	</diagnostics>
</pattern>