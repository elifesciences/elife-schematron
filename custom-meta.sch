<!-- custom-meta -->
<pattern id="custom-meta" xmlns="http://purl.oclc.org/dsdl/schematron">

	<rule context="//custom-meta-group">
		<assert test="count(custom-meta[not(@specific-use='meta-only')]) = 1" role="error" diagnostics="only-one-custom-meta"/>
		<assert test="custom-meta[not(@specific-use='meta-only')]/meta-name[text()[contains(.,'elife-xml-version')]]" role="error" diagnostics="incorrect-custom-meta-name"/>
		<assert test="custom-meta[not(@specific-use='meta-only')]/meta-value[text()[contains(.,'2.5')]]" role="error" diagnostics="incorrect-custom-meta-value"/>
		<assert test="count(custom-meta[@specific-use='meta-only']) = 1" role="error" diagnostics="only-one-custom-meta-specific-use"/>
		<assert test="custom-meta[@specific-use='meta-only']/meta-name[text()[contains(.,'Author impact statement')]]" role="error" diagnostics="incorrect-custom-meta-specific-use-meta-name"/>
		<assert test="matches(custom-meta[@specific-use='meta-only']/meta-value,'^\p{Lu}[^\.]*\.$')" role="error" diagnostics="incorrect-custom-meta-specific-use-meta-value"/>
	</rule>
	
	<diagnostics>
		<diagnostic id="only-one-custom-meta">Only one custom-meta must be present.</diagnostic>
		<diagnostic id="only-one-custom-meta-specific-use">Only one custom-meta[@specific-use='meta-only'] must present.</diagnostic>
		<diagnostic id="incorrect-custom-meta-name">Meta Name "<value-of select="custom-meta[not(@specific-use='meta-only')]/meta-name"/>" for custom-meta should contain text 'elife-xml-version'.</diagnostic>
		<diagnostic id="incorrect-custom-meta-value">Meta-Value "<value-of select="custom-meta[not(@specific-use='meta-only')]/meta-value"/>" for custom-meta should contain current version "2.5".</diagnostic>
		<diagnostic id="incorrect-custom-meta-specific-use-meta-name">Meta Name "<value-of select="custom-meta[@specific-use='meta-only']/meta-name"/>" for custom-meta[@specific-use='meta-only'] should contain text 'Author impact statement'.</diagnostic>
		<diagnostic id="incorrect-custom-meta-specific-use-meta-value">Meta-Value "<value-of select="custom-meta[@specific-use='meta-only']/meta-value"/>" for custom-meta[@specific-use='meta-only'] should start with capital letter and end with a period.</diagnostic>
	</diagnostics>
</pattern>