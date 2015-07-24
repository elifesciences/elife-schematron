<!-- Fig-group tests -->

<pattern id="figure" xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <rule context="fig-group">
        <report test="count(fig) > 1" role="warning" diagnostics="fig_count"/>
        <assert test="count(fig) > 1" role="error" diagnostics="no_figs"/>
    </rule>
    
    <diagnostics>
        <diagnostic id="fig_count">"<value-of select="count(fig)"/>" fig elements present.                  </diagnostic>
        <diagnostic id="no_figs">Only one figure in a fig-group! "<value-of select="./fig/@id"/>"          </diagnostic>
    </diagnostics>
        
</pattern>
    

