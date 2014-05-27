/*
    LZADialog
    v1.6
*/
!function(e,t){function n(e){return"function"==typeof e}function i(e){return"object"==typeof e}var l,o,r={debug:!1},s=t
r.saveFileAs=function(e){r.debug&&console.log("called saveFileAs")
var c=arguments[arguments.length-1]
o=n(c)?c:function(){r.debug&&console.log("Missing saveFileAs callback")}
var e=i(e)?e:{}
l!==t?(r.debug&&(console.log("removing saveFileAs prev event listener"),console.log("removing saveFileAs prev input element")),l.removeEventListener("change",s),document.body.removeChild(l)):r.debug&&console.log("no saveFileAs prev elem")
var g=document.createElement("input")
g.setAttribute("id","LZAsavefile"),g.setAttribute("type","file"),e.filename?g.setAttribute("nwsaveas",e.filename):g.setAttribute("nwsaveas",""),e.workingdir?g.setAttribute("nwworkingdir",e.workingdir):g.removeAttribute("nwworkingdir"),g.style.display="none",s=function(){var e=l.files
if(r.debug){console.log("called saveFileAs change")
for(var t=0;t<e.length;++t)console.log(e[t].path)}e.length>0&&o(e[0])},g.addEventListener("change",s),document.body.appendChild(g),g.click(),l=g}
var c,g,d=t
r.selectFile=function(e){r.debug&&console.log("called selectFile")
var l=arguments[arguments.length-1]
g=n(l)?l:function(){r.debug&&console.log("Missing selectFile callback")}
var e=i(e)?e:{}
c!==t?(r.debug&&(console.log("removing selectFile prev-event listener"),console.log("removing selectFile prev input element")),c.removeEventListener("change",d),document.body.removeChild(c)):r.debug&&console.log("no selectFile prev elem")
var o=document.createElement("input")
o.setAttribute("id","LZAselectfile"),o.setAttribute("type","file"),e.workingdir?o.setAttribute("nwworkingdir",e.workingdir):o.removeAttribute("nwworkingdir"),e.multiple?o.setAttribute("multiple",""):o.removeAttribute("multiple"),o.style.display="none",d=function(){var t=c.files
if(r.debug){console.log("called selectFile change")
for(var n=0;n<t.length;++n)console.log(t[n].path)}t.length>0&&(e.multiple?g(t):g(t[0]))},o.addEventListener("change",d),document.body.appendChild(o),o.click(),c=o}
var a,u,v=t
r.selectDir=function(e){r.debug&&console.log("called selectDir")
var l=arguments[arguments.length-1]
u=n(l)?l:function(){r.debug&&console.log("Missing selectDir callback")}
var e=i(e)?e:{}
a!==t?(r.debug&&(console.log("removing selectDir prev-event listener"),console.log("removing selectDir prev input element")),a.removeEventListener("change",v),document.body.removeChild(a)):r.debug&&console.log("no selectDir prev elem")
var o=document.createElement("input")
o.setAttribute("id","LZAselectdir"),o.setAttribute("type","file"),e.workingdir?o.setAttribute("nwworkingdir",e.workingdir):o.removeAttribute("nwworkingdir"),o.setAttribute("nwdirectory",""),o.style.display="none",v=function(){var e=o.files
if(r.debug){console.log("called selectDir change")
for(var t=0;t<e.length;++t)console.log(e[t].path)}e.length>0&&u(e[0])},o.addEventListener("change",v),document.body.appendChild(o),o.click(),a=o}
var b,m,p=t
r.selectWebkitDir=function(e){r.debug&&console.log("called selectWebkitDir")
var l=arguments[arguments.length-1]
m=n(l)?l:function(){r.debug&&console.log("Missing selectWebkitDir callback")}
var e=i(e)?e:{}
b!==t?(r.debug&&(console.log("removing selectWebkitDir prev-event listener"),console.log("removing selectWebkitDir prev input element")),b.removeEventListener("change",p),document.body.removeChild(b)):r.debug&&console.log("no selectWebkitDir prev elem")
var o=document.createElement("input")
o.setAttribute("id","LZAselectWebkitDir"),o.setAttribute("type","file"),e.workingdir?o.setAttribute("nwworkingdir",e.workingdir):o.removeAttribute("nwworkingdir"),o.setAttribute("webkitdirectory",""),o.style.display="none",p=function(){var e=o.files
if(r.debug){console.log("called selectWebkitDir change")
for(var t=0;t<e.length;++t)console.log(e[t].path)}e.length>0&&m(e)},o.addEventListener("change",p),document.body.appendChild(o),o.click(),b=o},e.LZADialog=r}(window)