// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//////////////// Arranque //
    function init() {
        setInterval(draw,30);
    }
    
    //////////////// Variáveis // Valores aqui!
    
    //var valores = [0,1,2,3,4,60]
    //var valores = [150,50,62,34,45,190,230,220,170,150,73,54,240,214,210,240,214,210,92];
    var pontos = [];
    var diferenca =[];

  
    function drawGrid(width,height,colun,line) {
    var ctx = document.getElementById('canvas').getContext('2d');
        ctx.fillRect(0,0,width,height);
        ctx.save();
        for (var c=1; c<(width/colun); c++) {
            ctx.beginPath();
            ctx.moveTo(c*colun,0);
            ctx.lineTo(c*colun,height);
            ctx.stroke();
        }
        for (var l=1; l<(height/line); l++) {
            ctx.beginPath();
            ctx.moveTo(0,l*line);
            ctx.lineTo(width, l*line);
            ctx.stroke();
        }
    }
    
    function drawingLines (width,points,c) {
    var ctx = document.getElementById('canvas').getContext('2d');
    ctx.beginPath();
    ctx.globalAlpha = c*0.04;
    ctx.moveTo(((c-1)*width+10),points[c-1]);
    ctx.lineTo(c*width+10,points[c]);
    ctx.lineTo(c*width+10,300);
    ctx.lineTo(((c-1)*width+10),300);
    ctx.lineTo(((c-1)*width+10),points[c-1]);
    ctx.fill();
    ctx.beginPath();
     ctx.globalAlpha = 1;
    ctx.moveTo(((c-1)*width+10),points[c-1]);
    ctx.lineTo(c*width+10,points[c]);
    ctx.stroke();
    ctx.beginPath();
    ctx.save();
    ctx.fillStyle=ctx.strokeStyle;
    ctx.arc(c*width+10,points[c],3,0,Math.PI*2)
    ctx.fill();
    ctx.restore();
    }
    

    function draw() {
    var ctx = document.getElementById('canvas').getContext('2d');

    //////////////// setupBackground
    ctx.fillStyle ="#1d1f20";
    ctx.strokeStyle ="#333";
    ctx.save();
    drawGrid(500,300,10,10);
 
    
    for (var c=0; c<valores.length; c++) { 
        if(isNaN(pontos[c])){
        pontos[c]=300;
    }
    ctx.lineWidth=1.4;
    larg=480/(valores.length -1);
    diferenca[c]=(300-valores[c])-pontos[c];
    pontos[c]+=diferenca[c]/(c+1);
    
    //////////////// setupGraphic
    ctx.strokeStyle ="#0ff";
    ctx.fillStyle="#0ff";    
    drawingLines (larg,pontos,c);
    }
}
window.onload = init();