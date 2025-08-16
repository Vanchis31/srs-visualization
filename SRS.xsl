<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:reqif="http://www.omg.org/spec/ReqIF/20110401/reqif.xsd"
    exclude-result-prefixes="reqif">

  <!-- Configuración de salida -->
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <!-- Plantilla raíz -->
  <xsl:template match="/">
    <xsl:apply-templates select="/reqif:REQ-IF"/>
  </xsl:template>

  <!-- Plantilla para el nodo principal -->
  <xsl:template match="/reqif:REQ-IF">
    <html>
      <head>
        <title>
          <xsl:value-of select="reqif:THE-HEADER/reqif:REQ-IF-HEADER/reqif:TITLE"/>
        </title>
        <style>
          body { font-family: Arial, sans-serif; margin: 20px; }
          h1 { color: darkblue; }
          table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
          th, td { border: 1px solid #ddd; padding: 8px; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h1>
          <xsl:value-of select="reqif:THE-HEADER/reqif:REQ-IF-HEADER/reqif:TITLE"/>
        </h1>

        <!-- Mostrar SPEC-TYPES -->
        <h2>Tipos de especificación</h2>
        <table>
          <tr>
            <th>Nombre</th>
            <th>Identificador</th>
          </tr>
          <xsl:for-each select="reqif:CORE-CONTENT/reqif:REQ-IF-CONTENT/reqif:SPEC-TYPES/reqif:SPECIFICATION-TYPE">
            <tr>
              <td><xsl:value-of select="@LONG-NAME"/></td>
              <td><xsl:value-of select="@IDENTIFIER"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <!-- Mostrar SPEC-OBJECTS -->
        <h2>Objetos de especificación</h2>
        <table>
          <tr>
            <th>Identificador</th>
            <th>Tipo</th>
            <th>Valores</th>
          </tr>
          <xsl:for-each select="reqif:CORE-CONTENT/reqif:REQ-IF-CONTENT/reqif:SPEC-OBJECTS/reqif:SPEC-OBJECT">
            <tr>
              <td><xsl:value-of select="@IDENTIFIER"/></td>
              <td>
                <xsl:for-each select="reqif:VALUES/reqif:ATTRIBUTE-VALUE-STRING">
                  <div>
                    <strong><xsl:value-of select="@THE-VALUE"/></strong>
                  </div>
                </xsl:for-each>
              </td>
              <td>
                <xsl:for-each select="reqif:VALUES/reqif:ATTRIBUTE-VALUE-XHTML">
                  <div>
                    <xsl:copy-of select="reqif:THE-VALUE/*"/>
                  </div>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
