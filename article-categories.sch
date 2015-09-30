<!-- article-categories -->
<pattern id="article-categories" xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="article-categories">
		<assert test="subj-group[@subj-group-type='display-channel']" role="error" diagnostics="no-subj-group-display-channel"/>
		<assert test="subj-group[@subj-group-type='heading']" role="error" diagnostics="no-subj-group-heading"/>
	</rule>
	<rule context="article-categories/subj-group[@subj-group-type='display-channel']/subject">
		<assert test="matches(.,'^(Research article|Short report|Tools and resources|Research advance|Registered report|Editorial|Insight)$')" role="error" diagnostics="invalid-subj-group-display-channel"/>
	</rule>
	<rule context="article-categories/subj-group[@subj-group-type='heading']/subject">
		<assert test="matches(.,'^(Neuroscience|Biochemistry|Human biology and medicine|Developmental biology and stem cells|Immunology|Ecology|Microbiology and infectious disease|Epidemiology and global health|Biophysics and structural biology|Cell biology|Computational and systems biology|Genomics and evolutionary biology|Plant biology|Genes and chromosomes)$')" role="error" diagnostics="invalid-subj-group-heading"/>
	</rule>
	<rule context="article-categories/subj-group[@subj-group-type='heading']">
		<report test="following-sibling::subj-group[@subj-group-type='heading']" role="warning" diagnostics="multiple-subj-group-heading"/> 
	</rule>
	<rule context="article-categories/subj-group[@subj-group-type!='heading' and @subj-group-type!='display-channel']">
		<assert test="subj-group" role="error" diagnostics="not-subj-group-type"/>
	</rule>

	<diagnostics>
		<diagnostic id="no-subj-group-display-channel">subj-group tag of type 'display-channel' is not present.</diagnostic>
		<diagnostic id="no-subj-group-heading">subj-group tag of type 'heading' is not present.</diagnostic>
		<diagnostic id="multiple-subj-group-heading">Multiple subj-group headings are present.</diagnostic>
        <diagnostic id="invalid-subj-group-display-channel">Given 'display-channel' (<value-of select="." />) is not an allowed value. Expecting one of Research article, Short report, Tools and resources, Research advance, Registered report, Editorial or Insight</diagnostic>

		<diagnostic id="not-subj-group-heading">subj-group tag of type 'heading' is not present.</diagnostic>
        <diagnostic id="invalid-subj-group-heading">Given 'heading' (<value-of select="." />) is not an allowed value. Expecting one of Neuroscience, Biochemistry, Human biology and medicine, Developmental biology and stem cells, Immunology, Ecology, Microbiology and infectious disease, Epidemiology and global health, Biophysics and structural biology, Computational and systems biology, Genomics and evolutionary biology, Plant biology or Genes and chromosomes</diagnostic>

	 	<diagnostic id="not-subj-group-type">Unexpected subj-group type <value-of select="./@subj-group-type" />. Expecting either 'display-channel' or 'heading'.</diagnostic>
	</diagnostics>
</pattern>