(function(t){function e(e){for(var n,l,s=e[0],r=e[1],u=e[2],c=0,d=[];c<s.length;c++)l=s[c],Object.prototype.hasOwnProperty.call(o,l)&&o[l]&&d.push(o[l][0]),o[l]=0;for(n in r)Object.prototype.hasOwnProperty.call(r,n)&&(t[n]=r[n]);p&&p(e);while(d.length)d.shift()();return i.push.apply(i,u||[]),a()}function a(){for(var t,e=0;e<i.length;e++){for(var a=i[e],n=!0,s=1;s<a.length;s++){var r=a[s];0!==o[r]&&(n=!1)}n&&(i.splice(e--,1),t=l(l.s=a[0]))}return t}var n={},o={index:0},i=[];function l(e){if(n[e])return n[e].exports;var a=n[e]={i:e,l:!1,exports:{}};return t[e].call(a.exports,a,a.exports,l),a.l=!0,a.exports}l.m=t,l.c=n,l.d=function(t,e,a){l.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:a})},l.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},l.t=function(t,e){if(1&e&&(t=l(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var a=Object.create(null);if(l.r(a),Object.defineProperty(a,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var n in t)l.d(a,n,function(e){return t[e]}.bind(null,n));return a},l.n=function(t){var e=t&&t.__esModule?function(){return t["default"]}:function(){return t};return l.d(e,"a",e),e},l.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},l.p="../../plugins_packages/elan-ev/Unterrichtsplanung/app/views/index/";var s=window["webpackJsonp"]=window["webpackJsonp"]||[],r=s.push.bind(s);s.push=e,s=s.slice();for(var u=0;u<s.length;u++)e(s[u]);var p=r;i.push([0,"chunk-vendors"]),a()})({0:function(t,e,a){t.exports=a("56d7")},"56d7":function(t,e,a){"use strict";a.r(e);a("cadf"),a("551c"),a("f751"),a("097d");var n=a("2b0e"),o=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"app"}},[a("router-view")],1)},i=[],l={name:"app"},s=l,r=a("2877"),u=Object(r["a"])(s,o,i,!1,null,null,null),p=u.exports,c=a("2f62");n["a"].use(c["a"]);var d=new c["a"].Store({state:{plan:{}}}),m=d,v=(a("ac6a"),a("8c4f")),f=a("bc3a"),h=a.n(f),g=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"home"},[t._m(0),a("div",{staticClass:"content-wrapper"},[a("nav",{staticClass:"homebox plans"},[a("header",[t._v("Plan bearbeiten")]),t._l(this.plans,(function(e){return a("router-link",{key:e.id,attrs:{to:"/plan/"+e.id}},[a("p",{staticClass:"homebox-link"},[t._v("\n                    "+t._s(e.name)+"\n                    "),a("span",{staticClass:"homebox-link-subtitle"},[t._v("- "+t._s(t.getPlanTemplateName(e.templates_id)))])])])}))],2),a("nav",{staticClass:"homebox add-plan"},[a("header",[t._v("Plan hinzufügen")]),a("router-link",{attrs:{to:"/addplan/1"}},[a("p",{staticClass:"homebox-link"},[t._v("Bildungswissenschaftlich")])]),a("router-link",{attrs:{to:"/addplan/2"}},[a("p",{staticClass:"homebox-link"},[t._v("Fachdidaktik Mathematik")])]),a("router-link",{attrs:{to:"/addplan/3"}},[a("p",{staticClass:"homebox-link"},[t._v("Fachdidaktik Sport")])]),a("router-link",{attrs:{to:"/addplan/4"}},[a("p",{staticClass:"homebox-link"},[t._v("Fachdidaktik Geologie")])])],1),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},b=[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("h1",[a("span",{staticClass:"nav home"})])}],_=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"infobox-wrapper"},[a("h3",[t._v(t._s(t.title))]),a("p",[t._v("\n        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et\n        dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet\n        clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet,\n        consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,\n        sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no\n        sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing\n        elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At\n        vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est\n        Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie\n        consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui\n        blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit\n        amet.\n    ")])])},x=[],k={props:{title:String,content:String}},y=k,C=Object(r["a"])(y,_,x,!1,null,null,null),w=C.exports,O={methods:{getPlanTemplateName:function(t){var e="";switch(t){case"1":e="Bildungswissenschaftlich";break;case"2":e="Fachdidaktik Mathematik";break;case"3":e="Fachdidaktik Sport";break;case"4":e="Fachdidaktik Geologie";break}return e}}},B={name:"Home",mixins:[O],components:{InfoBox:w},data:function(){return{plans:this.getPlans()}},computed:{infoBoxTitle:function(){return"Auswählen oder Erstellen"}},methods:{getPlans:function(){var t=this;h.a.get("./api/plans").then((function(e){t.plans=e.data})).catch((function(t){console.log(t)}))}}},P=B,I=Object(r["a"])(P,g,b,!1,null,null,null),j=I.exports,S=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("router-view")},T=[],N={},$=N,L=Object(r["a"])($,S,T,!1,null,null,null),E=L.exports,z=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"add-plan"},[a("h1",[a("router-link",{attrs:{to:"/"}},[a("span",{staticClass:"nav home"})]),t._v(" / Plan hinzufügen\n    ")],1),a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"plan-metadata"},[a("h3",{staticClass:"plan-metadata-header"},[t._v(t._s(t.getPlanTemplateName(this.$route.params.planType)))]),a("div",{staticClass:"plan-metadata-fieldset"},[a("label",{attrs:{for:"planTitle"}},[t._v("Plantitel:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.planTitle,expression:"planTitle"}],attrs:{type:"text",name:"planTitle"},domProps:{value:t.planTitle},on:{input:function(e){e.target.composing||(t.planTitle=e.target.value)}}}),a("br"),a("label",{attrs:{for:"typeOfSchool"}},[t._v("Schulform:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.typeOfSchool,expression:"typeOfSchool"}],attrs:{type:"text",name:"typeOfSchool"},domProps:{value:t.typeOfSchool},on:{input:function(e){e.target.composing||(t.typeOfSchool=e.target.value)}}}),a("br"),a("label",{attrs:{for:"gradeLevel"}},[t._v("Klassenstufe:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.gradeLevel,expression:"gradeLevel"}],attrs:{type:"text",name:"gradeLevel"},domProps:{value:t.gradeLevel},on:{input:function(e){e.target.composing||(t.gradeLevel=e.target.value)}}}),a("br"),a("label",{attrs:{for:"subject"}},[t._v("Fach:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.subject,expression:"subject"}],attrs:{type:"text",name:"subject"},domProps:{value:t.subject},on:{input:function(e){e.target.composing||(t.subject=e.target.value)}}}),a("br"),a("label",{attrs:{for:"topic"}},[t._v("Thema der Unterrichtsstunde:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.topic,expression:"topic"}],attrs:{type:"text",name:"topic"},domProps:{value:t.topic},on:{input:function(e){e.target.composing||(t.topic=e.target.value)}}}),a("br"),a("label",{attrs:{for:"date"}},[t._v("Datum:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.date,expression:"date"}],attrs:{type:"date",name:"date"},domProps:{value:t.date},on:{input:function(e){e.target.composing||(t.date=e.target.value)}}}),a("br"),a("label",{attrs:{for:"time"}},[t._v("Uhrzeit:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.time,expression:"time"}],attrs:{type:"time",name:"time"},domProps:{value:t.time},on:{input:function(e){e.target.composing||(t.time=e.target.value)}}}),a("br")]),a("div",{staticClass:"plan-metadata-buttons"},[a("button",{staticClass:"button",on:{click:t.createPlan}},[t._v("Plan erstellen")]),a("router-link",{attrs:{to:"/"}},[a("button",{staticClass:"button"},[t._v("zurück zur Übersicht")])])],1),a("div",{staticClass:"plan-metadata-errors"},t._l(t.errors,(function(e){return a("p",{key:e},[t._v(t._s(e))])})),0)]),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},M=[],A={name:"AddPlan",mixins:[O],components:{InfoBox:w},data:function(){return{errors:[]}},computed:{infoBoxTitle:function(){return"Einen Plan erstellen"}},methods:{createPlan:function(){if(!this.planTitle)return this.errors.push("Bitte geben Sie einen Plantitel ein!"),!1;this.errors=[];var t=this,e={};e.typeOfSchool=this.typeOfSchool,e.gradeLevel=this.gradeLevel,e.subject=this.subject,e.topic=this.topic,e.date=this.date,e.time=this.time,h.a.post("./api/plans",{templates_id:this.$route.params.planType,name:this.planTitle,metadata:JSON.stringify(e)}).then((function(e){var a=e.data.id;t.$router.push({path:"/plan/"+a})})).catch((function(t){console.log(t)}))}}},q=A,F=Object(r["a"])(q,z,M,!1,null,null,null),D=F.exports,V=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"edit-plan"},[a("h1",[a("router-link",{attrs:{to:"/"}},[a("span",{staticClass:"nav home"})]),t._v(" / Plan bearbeiten\n    ")],1),a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"plan-metadata"},[a("h3",{staticClass:"plan-metadata-header"},[t._v(t._s(t.plan.templates_name))]),a("div",{staticClass:"plan-metadata-fieldset"},[a("label",{attrs:{for:"planTitle"}},[t._v("Plantitel:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.plan.name,expression:"plan.name"}],attrs:{type:"text",name:"planTitle"},domProps:{value:t.plan.name},on:{input:function(e){e.target.composing||t.$set(t.plan,"name",e.target.value)}}}),a("br"),a("label",{attrs:{for:"typeOfSchool"}},[t._v("Schulform:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.plan.metadata.typeOfSchool,expression:"plan.metadata.typeOfSchool"}],attrs:{type:"text",name:"typeOfSchool"},domProps:{value:t.plan.metadata.typeOfSchool},on:{input:function(e){e.target.composing||t.$set(t.plan.metadata,"typeOfSchool",e.target.value)}}}),a("br"),a("label",{attrs:{for:"gradeLevel"}},[t._v("Klassenstufe:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.plan.metadata.gradeLevel,expression:"plan.metadata.gradeLevel"}],attrs:{type:"text",name:"gradeLevel"},domProps:{value:t.plan.metadata.gradeLevel},on:{input:function(e){e.target.composing||t.$set(t.plan.metadata,"gradeLevel",e.target.value)}}}),a("br"),a("label",{attrs:{for:"subject"}},[t._v("Fach:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.plan.metadata.subject,expression:"plan.metadata.subject"}],attrs:{type:"text",name:"subject"},domProps:{value:t.plan.metadata.subject},on:{input:function(e){e.target.composing||t.$set(t.plan.metadata,"subject",e.target.value)}}}),a("br"),a("label",{attrs:{for:"topic"}},[t._v("Thema der Unterrichtsstunde:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.plan.metadata.topic,expression:"plan.metadata.topic"}],attrs:{type:"text",name:"topic"},domProps:{value:t.plan.metadata.topic},on:{input:function(e){e.target.composing||t.$set(t.plan.metadata,"topic",e.target.value)}}}),a("br"),a("label",{attrs:{for:"date"}},[t._v("Datum:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.plan.metadata.date,expression:"plan.metadata.date"}],attrs:{type:"date",name:"date"},domProps:{value:t.plan.metadata.date},on:{input:function(e){e.target.composing||t.$set(t.plan.metadata,"date",e.target.value)}}}),a("br"),a("label",{attrs:{for:"time"}},[t._v("Uhrzeit:")]),a("input",{directives:[{name:"model",rawName:"v-model",value:t.plan.metadata.time,expression:"plan.metadata.time"}],attrs:{type:"time",name:"time"},domProps:{value:t.plan.metadata.time},on:{input:function(e){e.target.composing||t.$set(t.plan.metadata,"time",e.target.value)}}}),a("br")]),a("div",{staticClass:"plan-metadata-buttons"},[a("button",{staticClass:"button",on:{click:t.storePlan}},[t._v("Plan speichern")]),a("router-link",{attrs:{to:"/plan/"+t.plan.id}},[a("button",{staticClass:"button"},[t._v("zurück zur Planübersicht")])])],1),a("div",{staticClass:"plan-metadata-errors"},t._l(t.errors,(function(e){return a("p",{key:e},[t._v(t._s(e))])})),0)]),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},J=[],U=(a("7f7f"),{name:"AddPlan",mixins:[O],components:{InfoBox:w},data:function(){return{errors:[],plan:{}}},beforeMount:function(){this.plan.metadata={}},mounted:function(){this.plan=this.$store.state.plan,void 0!=this.plan?(this.plan.metadata=JSON.parse(this.plan.metadata),this.plan.templates_name=this.getPlanTemplateName(this.plan.templates_id)):this.plan.metadata={}},computed:{infoBoxTitle:function(){return"Einen Plan bearbeiten"}},methods:{storePlan:function(){if(!this.plan.name)return this.errors.push("Bitte geben Sie einen Plantitel ein!"),!1;this.errors=[];var t=this;h.a.put("./api/plans/"+this.plan.id,{templates_id:this.plan.templates_id,name:this.plan.name,metadata:JSON.stringify(this.plan.metadata)}).then((function(){t.$router.push({path:"/plan/"+t.plan.id})})).catch((function(t){console.log(t)}))}}}),G=U,K=Object(r["a"])(G,V,J,!1,null,null,null),H=K.exports,Q=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"overview"},[a("h1",[a("router-link",{attrs:{to:"/"}},[a("span",{staticClass:"nav home"})]),t._v(" / "+t._s(t.plan.name)+"\n        "),a("router-link",{attrs:{to:"/editplan/"+t.plan.id}},[a("span",{staticClass:"nav edit-plan"})])],1),a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"overview-boxes"},[a("OverviewBox",{attrs:{title:"situative Voraussetzungen",interdep:t.interdepInhalt,catName:"situation",planId:t.plan.id}}),a("OverviewBox",{attrs:{title:"individuelle Voraussetzungen",interdep:t.interdepInhalt,catName:"individual",planId:t.plan.id}}),a("OverviewBox",{attrs:{title:"Intentionalität",interdep:t.interdepInhalt,catName:"intention",planId:t.plan.id}}),a("OverviewBox",{attrs:{title:"Inhalt",interdep:t.interdepInhalt,catName:"content",planId:t.plan.id}}),a("OverviewBox",{attrs:{title:"Methodik",interdep:t.interdepInhalt,catName:"method",planId:t.plan.id}}),a("OverviewBox",{attrs:{title:"Medien",interdep:t.interdepInhalt,catName:"media",planId:t.plan.id}})],1),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},R=[],W=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("router-link",{attrs:{to:"/plan/"+t.planId+"/"+t.catName}},[a("div",{staticClass:"overview-box",class:t.catName},[a("h1",[t._v(t._s(t.title))])])])},X=[],Y=(a("c5f6"),{name:"OverviewBox",props:{title:String,catName:String,interdep:Object,planId:Number}}),Z=Y,tt=Object(r["a"])(Z,W,X,!1,null,null,null),et=tt.exports,at={name:"Overview",components:{InfoBox:w,OverviewBox:et},data:function(){return{interdepInhalt:{Inhalt:!1,Medien:!1}}},computed:{plan:function(){return this.$store.state.plan},infoBoxTitle:function(){return"Planübersicht"}}},nt=at,ot=Object(r["a"])(nt,Q,R,!1,null,null,null),it=ot.exports,lt=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"plan-situation"},[a("h1",[a("router-link",{attrs:{to:"/"}},[a("span",{staticClass:"nav home"})]),t._v(" /\n        "),a("router-link",{attrs:{to:"/plan/"+t.plan.id}},[t._v(t._s(t.plan.name)+" ")]),t._v(" / situative Voraussetzungen\n    ")],1),a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"content-container"}),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},st=[],rt={name:"Situation",components:{InfoBox:w},computed:{plan:function(){return this.$store.state.plan},infoBoxTitle:function(){return"situative Voraussetzungen"}}},ut=rt,pt=Object(r["a"])(ut,lt,st,!1,null,null,null),ct=pt.exports,dt=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"plan-individual"},[a("h1",[a("router-link",{attrs:{to:"/"}},[a("span",{staticClass:"nav home"})]),t._v(" /\n        "),a("router-link",{attrs:{to:"/plan/"+t.plan.id}},[t._v(t._s(t.plan.name)+" ")]),t._v(" / individuelle Voraussetzungen\n    ")],1),a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"content-container"}),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},mt=[],vt={name:"Individual",components:{InfoBox:w},computed:{plan:function(){return this.$store.state.plan},infoBoxTitle:function(){return"individuelle Voraussetzungen"}}},ft=vt,ht=Object(r["a"])(ft,dt,mt,!1,null,null,null),gt=ht.exports,bt=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"plan-intention"},[a("h1",[a("router-link",{attrs:{to:"/"}},[a("span",{staticClass:"nav home"})]),t._v(" /\n        "),a("router-link",{attrs:{to:"/plan/"+t.plan.id}},[t._v(t._s(t.plan.name)+" ")]),t._v(" / Intentionalität\n    ")],1),a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"content-container"}),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},_t=[],xt={name:"Intention",components:{InfoBox:w},computed:{plan:function(){return this.$store.state.plan},infoBoxTitle:function(){return"Intentionalität"}}},kt=xt,yt=Object(r["a"])(kt,bt,_t,!1,null,null,null),Ct=yt.exports,wt=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"plan-content"},[a("h1",[a("router-link",{attrs:{to:"/"}},[a("span",{staticClass:"nav home"})]),t._v(" /\n        "),a("router-link",{attrs:{to:"/plan/"+t.plan.id}},[t._v(t._s(t.plan.name)+" ")]),t._v(" / Inhalt\n    ")],1),a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"content-container"},[a("div",{staticClass:"plan-content-tabs"},[a("h3",{class:{active:!t.toggle},on:{click:function(e){t.toggle=!1}}},[t._v("Sychanalyse")]),a("h3",{class:{active:t.toggle},on:{click:function(e){t.toggle=!0}}},[t._v("Didaktische Analyse")]),a("div",{directives:[{name:"show",rawName:"v-show",value:!t.toggle,expression:"!toggle"}],staticClass:"plan-content-analysis plan-content-analysis-proper"},[a("NoteElement",{attrs:{element:t.elementProper}})],1),a("div",{directives:[{name:"show",rawName:"v-show",value:t.toggle,expression:"toggle"}],staticClass:"plan-content-analysis plan-content-analysis-didactic"},[a("NoteElement",{attrs:{element:t.elementDidactic}})],1)])]),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},Ot=[],Bt=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"note-element"},[a("header",{staticClass:"note-element-title"},[t._v(t._s(t.element.title))]),a("textarea",{staticClass:"note-element-content",domProps:{value:t.element.content}})])},Pt=[],It={name:"NoteElement",props:{element:Object},mounted:function(){}},jt=It,St=Object(r["a"])(jt,Bt,Pt,!1,null,null,null),Tt=St.exports,Nt={name:"Content",components:{InfoBox:w,NoteElement:Tt},data:function(){return{toggle:!1,elementProper:{title:"lorem ipsum",content:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,"},elementDidactic:{title:"Exemplarische Bedeutung",content:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam"}}},computed:{plan:function(){return this.$store.state.plan},infoBoxTitle:function(){return"Inhalt"}},methods:{}},$t=Nt,Lt=Object(r["a"])($t,wt,Ot,!1,null,null,null),Et=Lt.exports,zt=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"plan-method"},[a("h1",[a("router-link",{attrs:{to:"/"}},[a("span",{staticClass:"nav home"})]),t._v(" /\n        "),a("router-link",{attrs:{to:"/plan/"+t.plan.id}},[t._v(t._s(t.plan.name)+" ")]),t._v(" / Methodik\n    ")],1),a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"content-container"}),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},Mt=[],At={name:"Method",components:{InfoBox:w},computed:{plan:function(){return this.$store.state.plan},infoBoxTitle:function(){return"Methodik"}}},qt=At,Ft=Object(r["a"])(qt,zt,Mt,!1,null,null,null),Dt=Ft.exports,Vt=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"plan-media"},[a("h1",[a("router-link",{attrs:{to:"/"}},[a("span",{staticClass:"nav home"})]),t._v(" /\n        "),a("router-link",{attrs:{to:"/plan/"+t.plan.id}},[t._v(t._s(t.plan.name)+" ")]),t._v(" / Medien\n    ")],1),a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"content-container"},[a("NoteElement",{attrs:{element:this.element}})],1),a("InfoBox",{attrs:{title:t.infoBoxTitle}})],1)])},Jt=[],Ut={name:"Media",components:{InfoBox:w,NoteElement:Tt},data:function(){return{element:{title:"lorem ipsum",content:"123"}}},computed:{plan:function(){return this.$store.state.plan},infoBoxTitle:function(){return"Medien"}}},Gt=Ut,Kt=Object(r["a"])(Gt,Vt,Jt,!1,null,null,null),Ht=Kt.exports;n["a"].use(v["a"]);var Qt=[{path:"/",component:j},{path:"/plan/:planId",component:E,children:[{path:"/",component:it},{path:"situation",component:ct},{path:"individual",component:gt},{path:"intention",component:Ct},{path:"content",component:Et},{path:"method",component:Dt},{path:"media",component:Ht}]},{path:"/addplan/:planType",component:D},{path:"/editplan/:planId",component:H}],Rt=new v["a"]({routes:Qt});Rt.beforeEach((function(t,e,a){if(t.params.planId)if(t.params.planId==m.state.plan.id)a();else{var n=[];h.a.get("./api/plans").then((function(e){n=e.data,n.forEach((function(e){if(t.params.planId==e.id)return m.state.plan=e,!0})),a()})).catch((function(t){console.log(t)}))}else m.state.plan=[],a()}));var Wt=Rt;n["a"].config.productionTip=!1,new n["a"]({el:"#app",store:m,router:Wt,render:function(t){return t(p)}})}});
//# sourceMappingURL=index.js.map