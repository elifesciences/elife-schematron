<!-- name/surname/given-names/suffix -->
<pattern id="names" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="//name">
		<assert test="child::surname" role="error" diagnostics="surname-missing" />
		<assert test="child::given-names" role="error" diagnostics="gn-missing" />
		<report test="child::suffix" role="warning" diagnostics="suffix-present" />
	</rule>
	
	<rule context="//name/surname">
		<assert test='matches( . ,"^(\p{Lu}|af |av |da |das |de |der |di |do |dos |du |dit |el |la |na |tot |van |von |zu |d )")' role="error" diagnostics="surname-not-matched"/>
		<report test="matches( . ,'\w\s+\w')" role="warning" diagnostics="surname-not-match-hyphen"/>
	</rule>
	
	<rule context="//name/given-names">
		<report test="not(matches( . , '^\p{Lu}'))" role="error" diagnostics="gn-match"/>
		<report test="matches(., ' ') and matches( . , '\s\p{Ll}')" role="error" diagnostics="gn-not-match"/>
	</rule>
	
	<rule context="//name/suffix">
		<assert test='not(matches( . , "Ph\.?D\.?|M\.?D\.?|M\.?A\.?|B\.?A.?|M\.?Sc\.?|B\.?Sc\.?|M\.?Phil\.?"))' role="error" diagnostics="suffix-not-match" />
	</rule>
	
	<diagnostics>
		<diagnostic id="surname-missing">Surname is missing for name.<value-of select="."/></diagnostic>
	 	<diagnostic id="surname-not-matched">Surname must start with capital letter or with allowed characters in name <value-of select="."/></diagnostic>
		<diagnostic id="surname-not-match-hyphen">Double surname are presented without a hyphen in name <value-of select="."/>.</diagnostic>
		<diagnostic id="gn-missing">Given names are missing for name.<value-of select="."/></diagnostic>
	 	<diagnostic id="gn-match">The name <value-of select="."/> must be capitalized.</diagnostic>
		<diagnostic id="gn-not-match">The name <value-of select="."/> must be capitalized.</diagnostic>
		<diagnostic id="suffix-present">Suffix is present for name.<value-of select="."/></diagnostic>
		<diagnostic id="suffix-not-match">Suffix has a value <value-of select="."/> which is not allowed.</diagnostic>
	</diagnostics>
</pattern>
								 