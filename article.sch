<!-- Article -->
    
<pattern id="general" xmlns="http://purl.oclc.org/dsdl/schematron">
    <rule context="article">

        <report test="front" role="warning">Front present!</report>
        <assert test="front" role="error">Front missing!</assert>

        <report test="body" role="warning">Body present!</report>
        <assert test="body" role="error">Body missing!</assert>
        
        <report test="back" role="warning">Back present!</report>
        <assert test="back" role="error">Back missing!</assert>
        
        <report test="back" role="warning">Sub-article present!</report>
        <assert test="back" role="warning">No sub-articles present!</assert>

		<assert test="@article-type='abstract' or @article-type='addendum' or @article-type='announcement' or @article-type='article-commentary' or @article-type='book-review' or @article-type='books-received' or @article-type='brief-report' or @article-type='calendar' or @article-type='case-report' or @article-type='collection' or @article-type='correction' or @article-type='discussion' or @article-type='dissertation' or @article-type='editorial' or @article-type='in-brief' or @article-type='introduction' or @article-type='letter' or @article-type='meeting-report' or @article-type='news' or @article-type='obituary' or @article-type='oration' or @article-type='partial-retraction' or @article-type='product-review' or @article-type='rapid-communication' or @article-type='reply' or @article-type='reprint' or @article-type='research-article' or @article-type='retraction' or @article-type='review-article' or @article-type='translation'" role="error" diagnostics="unknown-article-type" />
		<assert test="@dtd-version='1.1d3'" role="error" diagnostics="incorrect-dtd-version" />

		<assert test="sub-article[@article-type='article-commentary']" role="warning" diagnostics="no-article-commentary"></assert>
		<assert test="sub-article[@article-type='reply']" role="warning" diagnostics="no-reply"></assert>
	</rule>

	<diagnostics>
        <diagnostic id="unknown-article-type">Given article-type ('<value-of select="@article-type"/>') is not an allowed value.</diagnostic>
        <diagnostic id="incorrect-dtd-version">Incorrect DTD version ('<value-of select="@dtd-version"/>'). Expecting DTD version to be '1.1d3'.</diagnostic>
	 	<diagnostic id="no-article-commentary">sub-article of type "article-commentary" is not present</diagnostic>
	 	<diagnostic id="no-reply">sub-article of type "reply" is not present</diagnostic>
    </diagnostics> 
	
</pattern>
