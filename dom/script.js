document.addEventListener("DOMContentLoaded", function() {
    
    var titulo = document.getElementById("titulo");
    var ul = document.querySelector("ul");
    var ol = document.getElementById("lista-ordenada");
    var a = document.querySelector("a");

    
    titulo.innerText = "Página Estilizada com CSS";
    a.innerText = "Visitar Proz Educação";

    
    var itensUl = ["Item A", "Item B", "Item C"];
    for (var i = 0; i < itensUl.length; i++) {
        var li = document.createElement("li");
        li.innerText = itensUl[i];
        ul.appendChild(li);
    }

    
    var itensOl = [
        { text: "Google", url: "https://www.google.com" },
        { text: "GitHub", url: "https://github.com" },
        { text: "Stack Overflow", url: "https://stackoverflow.com" }
    ];

    for (var i = 0; i < itensOl.length; i++) {
        var li = document.createElement("li");
        var link = document.createElement("a");
        link.href = itensOl[i].url;
        link.innerText = itensOl[i].text;
        li.appendChild(link);
        ol.appendChild(li);
    }
});
