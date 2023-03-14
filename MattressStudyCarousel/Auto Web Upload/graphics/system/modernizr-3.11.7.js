/*! modernizr 3.11.7 (Custom Build) | MIT *
 * https://modernizr.com/download/?-flexbox-flexwrap-mediaqueries-setclasses !*/
!function(e,n,t,r){function o(e,n){return typeof e===n}function i(e,n){return!!~(""+e).indexOf(n)}function s(){return"function"!=typeof t.createElement?t.createElement(arguments[0]):S?t.createElementNS.call(t,"http://www.w3.org/2000/svg",arguments[0]):t.createElement.apply(t,arguments)}function l(){var e=t.body;return e||(e=s(S?"svg":"body"),e.fake=!0),e}function a(e,n,r,o){var i,a,f,u,d="modernizr",c=s("div"),p=l();if(parseInt(r,10))for(;r--;)f=s("div"),f.id=o?o[r]:d+(r+1),c.appendChild(f);return i=s("style"),i.type="text/css",i.id="s"+d,(p.fake?p:c).appendChild(i),p.appendChild(c),i.styleSheet?i.styleSheet.cssText=e:i.appendChild(t.createTextNode(e)),c.id=d,p.fake&&(p.style.background="",p.style.overflow="hidden",u=x.style.overflow,x.style.overflow="hidden",x.appendChild(p)),a=n(c,e),p.fake&&p.parentNode?(p.parentNode.removeChild(p),x.style.overflow=u,x.offsetHeight):c.parentNode.removeChild(c),!!a}function f(e){return e.replace(/([A-Z])/g,function(e,n){return"-"+n.toLowerCase()}).replace(/^ms-/,"-ms-")}function u(e,t,r){var o;if("getComputedStyle"in n){o=getComputedStyle.call(n,e,t);var i=n.console;if(null!==o)r&&(o=o.getPropertyValue(r));else if(i){var s=i.error?"error":"log";i[s].call(i,"getComputedStyle returning null, its possible modernizr test results are inaccurate")}}else o=!t&&e.currentStyle&&e.currentStyle[r];return o}function d(e,t){var o=e.length;if("CSS"in n&&"supports"in n.CSS){for(;o--;)if(n.CSS.supports(f(e[o]),t))return!0;return!1}if("CSSSupportsRule"in n){for(var i=[];o--;)i.push("("+f(e[o])+":"+t+")");return i=i.join(" or "),a("@supports ("+i+") { #modernizr { position: absolute; } }",function(e){return"absolute"===u(e,null,"position")})}return r}function c(e){return e.replace(/([a-z])-([a-z])/g,function(e,n,t){return n+t.toUpperCase()}).replace(/^-/,"")}function p(e,n,t,l){function a(){u&&(delete P.style,delete P.modElem)}if(l=!o(l,"undefined")&&l,!o(t,"undefined")){var f=d(e,t);if(!o(f,"undefined"))return f}for(var u,p,m,v,h,y=["modernizr","tspan","samp"];!P.style&&y.length;)u=!0,P.modElem=s(y.shift()),P.style=P.modElem.style;for(m=e.length,p=0;p<m;p++)if(v=e[p],h=P.style[v],i(v,"-")&&(v=c(v)),P.style[v]!==r){if(l||o(t,"undefined"))return a(),"pfx"!==n||v;try{P.style[v]=t}catch(e){}if(P.style[v]!==h)return a(),"pfx"!==n||v}return a(),!1}function m(e,n){return function(){return e.apply(n,arguments)}}function v(e,n,t){var r;for(var i in e)if(e[i]in n)return!1===t?e[i]:(r=n[e[i]],o(r,"function")?m(r,t||n):r);return!1}function h(e,n,t,r,i){var s=e.charAt(0).toUpperCase()+e.slice(1),l=(e+" "+b.join(s+" ")+s).split(" ");return o(n,"string")||o(n,"undefined")?p(l,n,r,i):(l=(e+" "+E.join(s+" ")+s).split(" "),v(l,n,t))}function y(e,n,t){return h(e,r,r,n,t)}var g=[],C={_version:"3.11.7",_config:{classPrefix:"",enableClasses:!0,enableJSClass:!0,usePrefixes:!0},_q:[],on:function(e,n){var t=this;setTimeout(function(){n(t[e])},0)},addTest:function(e,n,t){g.push({name:e,fn:n,options:t})},addAsyncTest:function(e){g.push({name:null,fn:e})}},Modernizr=function(){};Modernizr.prototype=C,Modernizr=new Modernizr;var w=[],x=t.documentElement,S="svg"===x.nodeName.toLowerCase(),_="Moz O ms Webkit",b=C._config.usePrefixes?_.split(" "):[];C._cssomPrefixes=b;var z={elem:s("modernizr")};Modernizr._q.push(function(){delete z.elem});var P={style:z.elem.style};Modernizr._q.unshift(function(){delete P.style});var E=C._config.usePrefixes?_.toLowerCase().split(" "):[];C._domPrefixes=E,C.testAllProps=h,C.testAllProps=y,Modernizr.addTest("flexbox",y("flexBasis","1px",!0)),Modernizr.addTest("flexwrap",y("flexWrap","wrap",!0));var N=function(){var e=n.matchMedia||n.msMatchMedia;return e?function(n){var t=e(n);return t&&t.matches||!1}:function(e){var n=!1;return a("@media "+e+" { #modernizr { position: absolute; } }",function(e){n="absolute"===u(e,null,"position")}),n}}();C.mq=N,Modernizr.addTest("mediaqueries",N("only all")),function(){var e,n,t,r,i,s,l;for(var a in g)if(g.hasOwnProperty(a)){if(e=[],n=g[a],n.name&&(e.push(n.name.toLowerCase()),n.options&&n.options.aliases&&n.options.aliases.length))for(t=0;t<n.options.aliases.length;t++)e.push(n.options.aliases[t].toLowerCase());for(r=o(n.fn,"function")?n.fn():n.fn,i=0;i<e.length;i++)s=e[i],l=s.split("."),1===l.length?Modernizr[l[0]]=r:(Modernizr[l[0]]&&(!Modernizr[l[0]]||Modernizr[l[0]]instanceof Boolean)||(Modernizr[l[0]]=new Boolean(Modernizr[l[0]])),Modernizr[l[0]][l[1]]=r),w.push((r?"":"no-")+l.join("-"))}}(),function(e){var n=x.className,t=Modernizr._config.classPrefix||"";if(S&&(n=n.baseVal),Modernizr._config.enableJSClass){var r=new RegExp("(^|\\s)"+t+"no-js(\\s|$)");n=n.replace(r,"$1"+t+"js$2")}Modernizr._config.enableClasses&&(e.length>0&&(n+=" "+t+e.join(" "+t)),S?x.className.baseVal=n:x.className=n)}(w),delete C.addTest,delete C.addAsyncTest;for(var T=0;T<Modernizr._q.length;T++)Modernizr._q[T]();e.Modernizr=Modernizr}(window,window,document);