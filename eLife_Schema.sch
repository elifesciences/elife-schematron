<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

    <ns prefix="mml" uri="http://www.w3.org/1998/Math/MathML"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

    <!-- Including general tests -->
    <include href="general.sch"/>
    
    <!-- Including article -->
    <include href="article.sch"/>  

    <!-- Including <fig> tests -->
    <include href="fig.sch"/>
    
    <!-- Including <fig-group> tests -->
    <include href="fig-group.sch"/>
    
    <!-- Including <ref> tests -->    
    <include href="ref.sch"/>
    
</schema>
