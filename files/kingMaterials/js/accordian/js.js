var acc = document.getElementsByClassName("kingAccordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        this.classList.toggle("active");
        var kingPanel = this.nextElementSibling;
        if (kingPanel.style.display === "block") {
            kingPanel.style.display = "none";
        } else {
            kingPanel.style.display = "block";
        }
    });
}