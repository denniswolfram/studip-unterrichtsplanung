(function(e){function t(t){for(var i,a,o=t[0],c=t[1],u=t[2],d=0,f=[];d<o.length;d++)a=o[d],Object.prototype.hasOwnProperty.call(s,a)&&s[a]&&f.push(s[a][0]),s[a]=0;for(i in c)Object.prototype.hasOwnProperty.call(c,i)&&(e[i]=c[i]);l&&l(t);while(f.length)f.shift()();return r.push.apply(r,u||[]),n()}function n(){for(var e,t=0;t<r.length;t++){for(var n=r[t],i=!0,o=1;o<n.length;o++){var c=n[o];0!==s[c]&&(i=!1)}i&&(r.splice(t--,1),e=a(a.s=n[0]))}return e}var i={},s={admin:0},r=[];function a(t){if(i[t])return i[t].exports;var n=i[t]={i:t,l:!1,exports:{}};return e[t].call(n.exports,n,n.exports,a),n.l=!0,n.exports}a.m=e,a.c=i,a.d=function(e,t,n){a.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:n})},a.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},a.t=function(e,t){if(1&t&&(e=a(e)),8&t)return e;if(4&t&&"object"===typeof e&&e&&e.__esModule)return e;var n=Object.create(null);if(a.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var i in e)a.d(n,i,function(t){return e[t]}.bind(null,i));return n},a.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return a.d(t,"a",t),t},a.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},a.p="../../plugins_packages/elan-ev/Unterrichtsplanung/app/views/index/";var o=window["webpackJsonp"]=window["webpackJsonp"]||[],c=o.push.bind(o);o.push=t,o=o.slice();for(var u=0;u<o.length;u++)t(o[u]);var l=c;r.push([1,"chunk-vendors"]),n()})({1:function(e,t,n){e.exports=n("1448")},1448:function(e,t,n){"use strict";n.r(t);n("14c6"),n("08c1"),n("4842"),n("d9fc");var i=n("2b0e"),s=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{attrs:{id:"admin-app"}},[n("div",{staticClass:"admin-box"},[n("div",{staticClass:"admin-box-header"},[n("span",{staticClass:"headline"},[e._v("Infotexte bearbeiten")]),n("spinner",{attrs:{show:e.showSpinner},on:{done:function(t){e.showSpinner=!1}}}),n("select",{directives:[{name:"model",rawName:"v-model",value:e.selectedStructure,expression:"selectedStructure"}],on:{change:[function(t){var n=Array.prototype.filter.call(t.target.options,(function(e){return e.selected})).map((function(e){var t="_value"in e?e._value:e.value;return t}));e.selectedStructure=t.target.multiple?n:n[0]},e.selectElement]}},e._l(e.elementList,(function(t){return n("option",{key:t.id,domProps:{value:t.id}},[e._v(" "+e._s(t.name)+" ")])})),0)],1),n("div",{staticClass:"selected-text-wrapper"},[n("textarea",{directives:[{name:"model",rawName:"v-model",value:e.selectedText,expression:"selectedText"}],ref:"selectedText",staticClass:"selected-text",domProps:{value:e.selectedText},on:{input:function(t){t.target.composing||(e.selectedText=t.target.value)}}})]),n("button",{staticClass:"button admin-box-button",on:{click:e.storeText}},[e._v("Infotext „"+e._s(e.selectedName)+"“ speichern")])])])},r=[],a=(n("a481"),n("7514"),n("7f7f"),n("ac6a"),n("bc3a")),o=n.n(a),c=n("2375"),u={name:"AdminApp",components:{Spinner:c["a"]},data:function(){return{infoTexts:[],structures:[],elementList:[],selectedStructure:"",selectedText:"",selectedName:"",showSpinner:!1}},mounted:function(){console.log("hello admin"),this.getStructures()},methods:{getStructures:function(){var e=this;o.a.get("./api/structures").then((function(t){t.data.data.length>0&&(e.structures=t.data.data,e.getInfoTexts())})).catch((function(e){console.log(e)}))},getInfoTexts:function(){var e=this;o.a.get("./api/infotexts").then((function(t){t.data.data.length>0&&(e.infoTexts=t.data.data,e.setTextList())})).catch((function(e){console.log(e)}))},setTextList:function(){var e=this;this.structures.forEach((function(t){var n={};n.id=t.id,n.name=t.attributes.name,n.text="",n.text_id=null;var i=e.infoTexts.find((function(e){return e.attributes.structures_id==t.id}));void 0!=i&&(n.text=i.attributes.text,n.text_id=i.id),null!==n.text_id?e.elementList.push(n):e.createInfoText(n)})),this.selectedStructure=this.elementList[0].id,this.initCKE(),this.selectElement()},createInfoText:function(e){var t=this;o.a.post("./api/infotexts",{structures_id:e.id,templates_id:0,text:""}).then((function(n){e.text_id=n.data.id,t.elementList.push(e)})).catch((function(e){console.log(e)}))},selectElement:function(){var e=this,t=this.elementList.find((function(t){return t.id==e.selectedStructure}));this.selectedName=t.name.trim(),this.selectedText=t.text,this.selectedTextId=t.text_id;var n=CKEDITOR.instances[this.$refs.selectedText.id];n.setData(this.selectedText)},initCKE:function(){var e=this;STUDIP.wysiwyg.replace(e.$refs.selectedText);var t=CKEDITOR.instances[e.$refs.selectedText.id];t.on("change",(function(){e.selectedText=t.getData()})),t.on("blur",(function(){})),t.on("instanceReady",(function(e){}))},storeText:function(){var e=this,t=CKEDITOR.instances[e.$refs.selectedText.id];t.getData();o.a.put("./api/infotexts/"+e.selectedTextId,{structures_id:e.selectedStructure,templates_id:0,text:e.selectedText}).then((function(){e.showSpinner=!0})).catch((function(e){return console.log(e)}))}}},l=u,d=n("2877"),f=Object(d["a"])(l,s,r,!1,null,null,null),p=f.exports;i["a"].config.productionTip=!1,new i["a"]({render:function(e){return e(p)}}).$mount("#admin-app")},2375:function(e,t,n){"use strict";var i=function(){var e=this,t=e.$createElement,n=e._self._c||t;return e.show?n("div",{staticClass:"spinner"},[n("div",{staticClass:"bounce1"}),n("div",{staticClass:"bounce2"}),n("div",{staticClass:"bounce3"})]):e._e()},s=[],r={name:"Spinner",props:{show:Boolean},watch:{show:function(){this.hideSpinner()}},methods:{hideSpinner:function(){var e=this;setTimeout((function(){e.$emit("done")}),2e3)}}},a=r,o=n("2877"),c=Object(o["a"])(a,i,s,!1,null,null,null);t["a"]=c.exports}});
//# sourceMappingURL=admin.js.map