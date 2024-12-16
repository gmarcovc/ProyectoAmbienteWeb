document.addEventListener("DOMContentLoaded", () => {
    const eliminarBotones = document.querySelectorAll(".btnEliminar");
    const articuloInput = document.getElementById("txtArticuloID");

    eliminarBotones.forEach((boton) => {
        boton.addEventListener("click", () => {
            const articuloID = boton.getAttribute("data-articulo-id");
            articuloInput.value = articuloID;
        });
    });
});
