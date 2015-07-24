<!-- General tests -->
<pattern id="general" xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <rule id="uniqueness" abstract="true">
        <report test="preceding::*/@id = @id" diagnostics="idAttribute "/>
    </rule>
    
    <diagnostics>
        <diagnostic id="idAttribute">There is a duplicated id attribute: "<value-of select="@id"/>".</diagnostic>
    </diagnostics>
    
</pattern>
