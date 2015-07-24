<!-- References -->
    
<pattern id="general" xmlns="http://purl.oclc.org/dsdl/schematron">
    <rule context="ref">
        <extends rule="uniqueness"/>
        <report test="mixed-citation" role="error" diagnostics="not_element_ref"/>
        
        <report test="not(descendant::pub-id) and not(descendant::element-citation[@publication-type='book'])" role="warning" diagnostics="no_ref_DOI"/>
        <assert test="descendant::source" role="error" diagnostics="no_ref_source"/>
        <assert test="descendant::year" role="error" diagnostics="no_ref_year"/>
        
        <report test="descendant::element-citation[@publication-type='book'] and not(descendant::publisher-name)" role="error" diagnostics="no_book_pub"/>
        <report test="descendant::publisher-name and not(descendant::publisher-loc)" role="warning" diagnostics="no_ref_pub_loc"/>
    </rule>

    <diagnostics>
        <diagnostic id="not_element_ref">Reference "<value-of select="@id"/>" is in mixed-citation format! All references must be in element-citation format!   </diagnostic>
        <diagnostic id="no_ref_source">Reference "<value-of select="@id"/>" contains no source element!               </diagnostic>
        <diagnostic id="no_ref_DOI">Reference "<value-of select="@id"/>" contains no DOI.                             </diagnostic>
        <diagnostic id="no_ref_year">Reference "<value-of select="@id"/>" contains no year!                           </diagnostic>
        <diagnostic id="no_book_pub">Reference "<value-of select="@id"/>" is a book with no publisher!                </diagnostic>
        <diagnostic id="no_ref_pub_loc">Reference "<value-of select="@id"/>" contains a publisher without a location. </diagnostic>
    </diagnostics> 
   
</pattern>
