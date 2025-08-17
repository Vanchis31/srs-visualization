document.querySelectorAll("table tr").forEach(row => {
    const descripcionCell = row.cells[2]; // tercera columna
    if (descripcionCell) {
      // extraemos el texto visible
      const texto = descripcionCell.textContent.trim();
      // si no hay texto legible, ocultamos la fila
      if (!texto) {
        row.style.display = "none";
      }
    }
  });
  