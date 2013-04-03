<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://icl.com/saxon"
  extension-element-prefixes="saxon"
>
<xsl:param name = "warn" />

<!-- to strip leading and trailing whitespace
and remove whitespace-only text() nodes from all elements ...
 <xsl:strip-space elements="*"/>
this caused adjacent highlights to lose space between them
 -->

<xsl:output
  method="html"
  indent="no"
/>

<!--  calling parameters with their default settings -->

<xsl:param name = "goal">full</xsl:param>

<!-- Remember XSL is case sensitive although PHP/SAX was not -->


<xsl:template match = "/">
    <xsl:apply-templates select="//div2" />
</xsl:template>


<xsl:template match = "lg">
  <table> <xsl:apply-templates /> </table>
</xsl:template>

<xsl:template match = "l">
  <tr><td> <xsl:apply-templates/> </td></tr>
</xsl:template>

<xsl:template match = "div2">
  <tr class="smaller">
    <td valign='top' class="left">
     <xsl:apply-templates select = "dateline"  />
     <xsl:apply-templates select = "navigation"  />
    </td>

    <td>
     <xsl:apply-templates select = "p" />
    </td>

  </tr>
</xsl:template>

<xsl:template match = "navigation">
   <p>
    <xsl:apply-templates select = "prev_id"  />
    <xsl:apply-templates select = "ymd"  />
    <xsl:apply-templates select = "next_id"  />
   </p>
</xsl:template>


<xsl:template match = "p">
   <p><xsl:apply-templates  /></p>
</xsl:template>


<xsl:template match = "seg">
   <span>
   <xsl:attribute name="class">
       <xsl:value-of select="@type" />
     </xsl:attribute>
    <xsl:apply-templates  />
   </span>
</xsl:template>

<xsl:template match = "date">
  <span class="date">
    <xsl:apply-templates /><br />
  </span>

</xsl:template>


<xsl:template match = "dateline">
   <span class="dateline"><xsl:apply-templates  /></span>
   <xsl:choose>
   <xsl:when test="date/@value">
   <xsl:variable name="dateVal" select="date/@value" />
    <br/><br/>
    <a class='smallerplain'
      href="/view/browse_month?date={$dateVal}"
    ><font size='-1'>Browse Month</font></a><br />
   </xsl:when> 
   </xsl:choose>
   <xsl:choose>
   <xsl:when test="dateRange/@from">
   <xsl:variable name="dateVal" select="dateRange/@from" />
    <br/><br/>
    <a class='smallerplain'
      href="browse_month?date={$dateVal}"
    ><font size='-1'>Browse Month</font></a><br />
   </xsl:when> 
   </xsl:choose>
   <xsl:choose>
   <xsl:when test="../@type='Revised'">
     <br/>
     <span class="revisedt" ><font size='-1'>Revised Entry</font></span>
   </xsl:when>
   <xsl:when test="../@type='New'">
     <br/>
     <span class="newt"><font size='-1'>New Entry</font></span>
   </xsl:when>
   </xsl:choose>
</xsl:template> 


<xsl:template match = "place">
   <span class="place"><xsl:apply-templates  /></span>
</xsl:template>

<!-- title with @corresp maybe found inside bibl,
 use it same as older style bibl with @corresp
 otherwise just span class title -->

<xsl:template match = "title">
  <xsl:choose>
    <xsl:when test='@corresp'>
<a class='bibl-title'
   href="/cite/bibl?corresp={@corresp}"
   target="auxwindow"
   onclick="auxwin=window.open ('bibl?corresp={@corresp}', 'auxwindow','resizable=yes,scrollbars=yes,width=500,height=300')"
 ><xsl:value-of select="." /></a>
   </xsl:when>

  <xsl:otherwise>
    <span class="title"><xsl:value-of select="." /></span>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match = "dateRange">
   <div class="dateRange"><xsl:value-of select="." /></div>
</xsl:template>

<!-- bibl with @corresp as link to show more.
  we want to control the size and trimmings -->

<xsl:template match = "bibl">
  <xsl:choose>
    <xsl:when test='@corresp'>
<a class='green'
   href="show_cite.php?corresp={@corresp}"
   target="auxwindow"
   onclick="auxwin=window.open ('show_cite.php?corresp={@corresp}', 'auxwindow','resizable=yes,scrollbars=yes,width=500,height=300')"
 >
<!--  <xsl:value-of select="." /> -->
<xsl:apply-templates  />
 </a>
   </xsl:when>

  <xsl:otherwise>
<!-- cite makes it all italic
    <cite class="green"><xsl:apply-templates  /></cite>
 -->
    <span class="green"><xsl:apply-templates  /></span>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- turn xref@url into a@href -->

<xsl:template match = "uLine">
   <u><xsl:apply-templates  /></u>
</xsl:template>

<xsl:template match = "xref">
<a href="{@url}"
   target="offsite"
   onclick="offs=window.open ('{@url}', 'offsite','resizable=yes,scrollbars=yes,width=600,height=500')"
><xsl:value-of select="." /></a>
</xsl:template>

<xsl:template match = "name">
    <xsl:choose>

      <xsl:when test="@key != ''">

        <a href="{concat('http://www.lawpracticeofabrahamlincoln.org/externalResults.aspx?', @key)}" target="_blank" class="case">

          <xsl:apply-templates/>

        </a>

      </xsl:when>

      <xsl:otherwise>
          <i> <xsl:apply-templates/> </i>

      </xsl:otherwise>

    </xsl:choose>
</xsl:template>


</xsl:stylesheet>
