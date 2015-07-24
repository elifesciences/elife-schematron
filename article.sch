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

    </rule>

</pattern>
