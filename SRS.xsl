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
        <title>
          <xsl:value-of select="reqif:THE-HEADER/reqif:REQ-IF-HEADER/reqif:TITLE"/>
        </title>
        <link rel="stylesheet" href="styles.css"/>
      </head>
      <body>

        <!-- Barra de navegación -->
        <nav class="navbar">
          <div class="nav-title">📑 Documento de Requerimientos</div>
        </nav>

        <main class="content">
          <h1>Resumen</h1>
          <p>
            La siguiente tabla muestra los requerimientos extraídos del archivo REQIF.
            Se incluyen su identificador, título/tipo y la descripción asociada.
          </p>

          <!-- Mostrar SPEC-OBJECTS -->
          <h2>Objetos de Especificación</h2>
          <table>
            <tr>
              <th>Identificador</th>
              <th>Título / Tipo</th>
              <th>Descripción</th>
            </tr>
            <xsl:for-each select="reqif:CORE-CONTENT/reqif:REQ-IF-CONTENT/reqif:SPEC-OBJECTS/reqif:SPEC-OBJECT">
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
        </main>

        <script src="script.js"></script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
