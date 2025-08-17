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
        <meta charset="UTF-8"/>
        <title>Documento de Requerimientos</title>
        <style>
          table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1em;
          }
          th, td {
            border: 1px solid #333;
            padding: 6px 10px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
          h1 {
            font-family: Arial, sans-serif;
            margin-bottom: 0.2em;
          }
          p {
            font-family: Arial, sans-serif;
            font-size: 14px;
            margin-top: 0;
          }
        </style>
      </head>
      <body>
        <!-- Header y explicación -->
        <h1>Documento de Requerimientos</h1>
        <p>
          La siguiente tabla muestra los requerimientos extraídos del archivo REQIF.
          Se incluyen su identificador, título o tipo, y la descripción asociada.
          Las filas sin descripción visible han sido omitidas automáticamente.
        </p>

        <!-- Mostrar SPEC-OBJECTS -->
        <h2>Objetos de especificación</h2>
        <table>
          <tr>
            <th>Identificador</th>
            <th>Título / Tipo</th>
            <th>Descripción</th>
          </tr>
          <xsl:for-each 
            select="reqif:CORE-CONTENT/reqif:REQ-IF-CONTENT/reqif:SPEC-OBJECTS/reqif:SPEC-OBJECT
                    [normalize-space(string-join(reqif:VALUES/reqif:ATTRIBUTE-VALUE-XHTML/reqif:THE-VALUE//text(), '')) != '']">
            <tr>
              <td>
                <xsl:value-of select="reqif:VALUES/reqif:ATTRIBUTE-VALUE-STRING[1]/@THE-VALUE"/>
              </td>
              <td>
                <xsl:value-of select="reqif:VALUES/reqif:ATTRIBUTE-VALUE-STRING[2]/@THE-VALUE"/>
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

        <!-- JS dentro del body -->
        <script src="script.js"></script>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
