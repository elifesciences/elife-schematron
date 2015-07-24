<!-- Figure tests -->

<pattern id="figure" xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <rule context="fig">
        <extends rule="uniqueness"/>
        <report test="@position != 'float'" role="warning" diagnostics="non_floatingfig"/>
        
        <assert test="caption" role="error" diagnostics="missing_caption"/>
        <assert test="caption/title or descendant::label[contains(.,'image')]" role="error" diagnostics="missing_title"/>            
        <assert test="starts-with(descendant::label,'F') or starts-with(descendant::label,'A')" role="error" diagnostics="capitalisedFig" />
        
        <assert test="object-id[@pub-id-type='doi']" role="warning" diagnostics="missing_DOI"/>
        <assert test="descendant::ext-link[@ext-link-type='doi']" role="warning" diagnostics="missing_displayDOI"/>
        <report test="permissions and object-id[@pub-id-type='doi']" role="warning" diagnostics="permission_DOI"/>
        
        <assert test="graphic" role="error" diagnostics="missing_graphic"/>
        
        <report test="not(parent::fig-group) and @specific-use='child-fig'" role="error" diagnostics="no_fig_group"/>
    </rule>
    
    <diagnostics>     
        <diagnostic id="non_floatingfig">"<value-of select="@id"/>" is not a floating figure.</diagnostic>
        <diagnostic id="permission_DOI">"<value-of select="@id"/>" has a permissions statement AND a DOI.</diagnostic>
        <diagnostic id="missing_caption">There is no caption for "<value-of select="@id"/>"!</diagnostic>
        <diagnostic id="missing_title">There is no title for "<value-of select="@id"/>"!</diagnostic>
        <diagnostic id="missing_graphic">No graphic has been included for "<value-of select="@id"/>"!</diagnostic>
        <diagnostic id="missing_DOI">No DOI presnt in "<value-of select="@id"/>"!</diagnostic>
        <diagnostic id="missing_displayDOI">The display DOI is not presnt in "<value-of select="@id"/>"!</diagnostic>
        <diagnostic id="capitalisedFig">The caption for "<value-of select="@id"/>" is not capitalised!</diagnostic>
        <diagnostic id="no_fig_group">Figure supplement "<value-of select="@id"/>" is not in a fig group!</diagnostic>
    </diagnostics>
    
</pattern>
