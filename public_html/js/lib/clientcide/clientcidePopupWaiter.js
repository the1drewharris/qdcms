/*MooTools, My Object Oriented Javascript Tools. Copyright (c) 2006-2007 Valerio Proietti, <http://mad4milk.net>, MIT Style License.||Clientcide Copyright (c) 2006-2008, http://www.clientcide.com/wiki/cnet-libraries#license*/

var Clientcide={version:'785',setAssetLocation:function(baseHref){if(window.StickyWin&&StickyWin.ui){StickyWin.UI.refactor({options:{baseHref:baseHref+'/stickyWinHTML/'}});if(StickyWin.alert){var CGFsimpleErrorPopup=StickyWin.alert.bind(window);StickyWin.alert=function(msghdr,msg,base){return CGFsimpleErrorPopup(msghdr,msg,base||baseHref+"/simple.error.popup")}}}if(window.TagMaker){TagMaker=TagMaker.refactor({options:{baseHref:baseHref+'/tips/'}})}if(window.ProductPicker){ProductPicker.refactor({options:{baseHref:baseHref+'/Picker'}})}if(window.Autocompleter){var AcClientcide={options:{baseHref:baseHref+'/autocompleter/'}};Autocompleter.Base.refactor(AcClientcide);if(Autocompleter.Ajax){["Base","Xhtml","Json"].each(function(c){if(Autocompleter.Ajax[c])Autocompleter.Ajax[c].refactor(AcClientcide)})}if(Autocompleter.Local)Autocompleter.Local.refactor(AcClientcide);if(Autocompleter.JsonP)Autocompleter.JsonP.refactor(AcClientcide)}if(window.Lightbox){Lightbox.refactor({options:{assetBaseUrl:baseHref+'/slimbox/'}})}if(window.Waiter){Waiter.refactor({options:{baseHref:baseHref+'/waiter/'}})}},preLoadCss:function(){if(window.DatePicker)new DatePicker();if(window.ProductPicker)new ProductPicker();if(window.TagMaker)new TagMaker();if(window.StickyWin&&StickyWin.ui)StickyWin.ui();if(window.StickyWin&&StickyWin.pointy)StickyWin.pointy();Clientcide.preloaded=true;return true},preloaded:false};(function(){if(!window.addEvent)return;var preload=function(){if(window.dbug)dbug.log('preloading clientcide css');if(!Clientcide.preloaded)Clientcide.preLoadCss()};window.addEvent('domready',preload);window.addEvent('load',preload)})();setCNETAssetBaseHref=Clientcide.setAssetLocation;var dbug={logged:[],timers:{},firebug:false,enabled:false,log:function(){dbug.logged.push(arguments)},nolog:function(msg){dbug.logged.push(arguments)},time:function(name){dbug.timers[name]=new Date().getTime()},timeEnd:function(name){if(dbug.timers[name]){var end=new Date().getTime()-dbug.timers[name];dbug.timers[name]=false;dbug.log('%s: %s',name,end)}else dbug.log('no such timer: %s',name)},enable:function(silent){if(dbug.firebug){try{dbug.enabled=true;dbug.log=function(){(console.debug||console.log).apply(console,arguments)};dbug.time=function(){console.time.apply(console,arguments)};dbug.timeEnd=function(){console.timeEnd.apply(console,arguments)};if(!silent)dbug.log('enabling dbug');for(var i=0;i<dbug.logged.length;i++){dbug.log.apply(console,dbug.logged[i])}dbug.logged=[]}catch(e){dbug.enable.delay(400)}}},disable:function(){if(dbug.firebug)dbug.enabled=false;dbug.log=dbug.nolog;dbug.time=function(){};dbug.timeEnd=function(){}},cookie:function(set){var value=document.cookie.match('(?:^|;)\\s*jsdebug=([^;]*)');var debugCookie=value?unescape(value[1]):false;if((!$defined(set)&&debugCookie!='true')||($defined(set)&&set)){dbug.enable();dbug.log('setting debugging cookie');var date=new Date();date.setTime(date.getTime()+(24*60*60*1000));document.cookie='jsdebug=true;expires='+date.toGMTString()+';path=/;'}else dbug.disableCookie()},disableCookie:function(){dbug.log('disabling debugging cookie');document.cookie='jsdebug=false;path=/;'}};(function(){var fb=typeof console!="undefined";var debugMethods=['debug','info','warn','error','assert','dir','dirxml'];var otherMethods=['trace','group','groupEnd','profile','profileEnd','count'];function set(methodList,defaultFunction){for(var i=0;i<methodList.length;i++){dbug[methodList[i]]=(fb&&console[methodList[i]])?console[methodList[i]]:defaultFunction}};set(debugMethods,dbug.log);set(otherMethods,function(){})})();if(typeof console!="undefined"&&console.warn){dbug.firebug=true;var value=document.cookie.match('(?:^|;)\\s*jsdebug=([^;]*)');var debugCookie=value?unescape(value[1]):false;if(window.location.href.indexOf("jsdebug=true")>0||debugCookie=='true')dbug.enable();if(debugCookie=='true')dbug.log('debugging cookie enabled');if(window.location.href.indexOf("jsdebugCookie=true")>0){dbug.cookie();if(!dbug.enabled)dbug.enable()}if(window.location.href.indexOf("jsdebugCookie=false")>0)dbug.disableCookie()}Class.refactor=function(orig,props){props=$extend($unlink(props),{Extends:orig});var update=new Class(props);$each(orig,function(v,k){update[k]=update[k]||v});return update};$extend(Class.prototype,{refactor:function(props){this.prototype=Class.refactor(this,props).prototype;return this}});var Occlude=new Class({occlude:function(property,element){element=$(element||this.element);var instance=element.retrieve(property||this.property);if(instance&&(this.occluded===null||this.occluded)){this.occluded=instance}else{this.occluded=false;element.store(property||this.property,this)}return this.occluded||false}});var ToElement=new Class({toElement:function(){return this.element}});var IframeShim=new Class({Implements:[Options,Events,Occlude,ToElement],options:{className:'iframeShim',display:false,zindex:null,margin:0,offset:{x:0,y:0},browsers:(Browser.Engine.trident4||(Browser.Engine.gecko&&!Browser.Engine.gecko19&&Browser.Platform.mac))},property:'IframeShim',initialize:function(element,options){this.element=$(element);if(this.occlude())return this.occluded;this.setOptions(options);this.makeShim();return},makeShim:function(){this.shim=new Element('iframe').store('IframeShim',this);if(!this.options.browsers)return;if(this.element.getStyle('z-Index').toInt()<1||isNaN(this.element.getStyle('z-Index').toInt()))this.element.setStyle('z-Index',5);var z=this.element.getStyle('z-Index')-1;if($chk(this.options.zindex)&&this.element.getStyle('z-Index').toInt()>this.options.zindex)z=this.options.zindex;this.shim.set({src:(window.location.protocol=='https')?'://0':'javascript:void(0)',frameborder:'0',scrolling:'no',styles:{position:'absolute',zIndex:z,border:'none',filter:'progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)'},'class':this.options.className});var inject=function(){this.shim.inject(this.element,'after');if(this.options.display)this.show();else this.hide();this.fireEvent('onInject')};if(Browser.Engine.trident&&!IframeShim.ready)window.addEvent('load',inject.bind(this));else inject.run(null,this)},position:function(shim){if(!this.options.browsers||!IframeShim.ready)return this;var size=this.element.measure(function(){return this.getSize()});if($type(this.options.margin)){size.x=size.x-(this.options.margin*2);size.y=size.y-(this.options.margin*2);this.options.offset.x+=this.options.margin;this.options.offset.y+=this.options.margin}this.shim.set({'width':size.x,'height':size.y}).setPosition({relativeTo:this.element,offset:this.options.offset});return this},hide:function(){if(this.options.browsers)this.shim.hide();return this},show:function(){if(!this.options.browsers)return this;this.shim.show();return this.position()},dispose:function(){if(this.options.browsers)this.shim.dispose();return this}});window.addEvent('load',function(){IframeShim.ready=true});Hash.implement({getFromPath:function(notation){var source=this.getClean();notation.replace(/\[([^\]]+)\]|\.([^.[]+)|[^[.]+/g,function(match){if(!source)return;var prop=arguments[2]||arguments[1]||arguments[0];source=(prop in source)?source[prop]:null;return match});return source},cleanValues:function(method){method=method||$defined;this.each(function(v,k){if(!method(v))this.erase(k)},this);return this},run:function(){var args=$arguments;this.each(function(v,k){if($type(v)=="function")v.run(args)})}});String.implement({stripTags:function(){return this.replace(/<\/?[^>]+>/gi,'')},parseQuery:function(encodeKeys,encodeValues){encodeKeys=$pick(encodeKeys,true);encodeValues=$pick(encodeValues,true);var vars=this.split(/[&;]/);var rs={};if(vars.length)vars.each(function(val){var keys=val.split('=');if(keys.length&&keys.length==2){rs[(encodeKeys)?encodeURIComponent(keys[0]):keys[0]]=(encodeValues)?encodeURIComponent(keys[1]):keys[1]}});return rs},tidy:function(){var txt=this.toString();$each({"[\xa0\u2002\u2003\u2009]":" ","\xb7":"*","[\u2018\u2019]":"'","[\u201c\u201d]":'"',"\u2026":"...","\u2013":"-","\u2014":"--","\uFFFD":"&raquo;"},function(value,key){txt=txt.replace(new RegExp(key,'g'),value)});return txt},cleanQueryString:function(method){return this.split("&").filter(method||function(set){return $chk(set.split("=")[1])}).join("&")},findAllEmails:function(){return this.match(new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?","gi"))||[]}});Element.implement({measure:function(fn){var restore=this.expose();var result=fn.apply(this);restore();return result},expose:function(){if(this.getStyle('display')!='none')return $empty;var before={};var styles={visibility:'hidden',display:'block',position:'absolute'};$each(styles,function(value,style){before[style]=this.style[style]||''},this);this.setStyles(styles);return(function(){this.setStyles(before)}).bind(this)},getDimensions:function(options){options=$merge({computeSize:false},options);var dim={};function getSize(el,options){return(options.computeSize)?el.getComputedSize(options):el.getSize()};if(this.getStyle('display')=='none'){var restore=this.expose();dim=getSize(this,options);restore()}else{try{dim=getSize(this,options)}catch(e){}}return $chk(dim.x)?$extend(dim,{width:dim.x,height:dim.y}):$extend(dim,{x:dim.width,y:dim.height})},getComputedSize:function(options){options=$merge({styles:['padding','border'],plains:{height:['top','bottom'],width:['left','right']},mode:'both'},options);var size={width:0,height:0};switch(options.mode){case'vertical':delete size.width;delete options.plains.width;break;case'horizontal':delete size.height;delete options.plains.height;break};var getStyles=[];$each(options.plains,function(plain,key){plain.each(function(edge){options.styles.each(function(style){getStyles.push((style=="border")?style+'-'+edge+'-'+'width':style+'-'+edge)})})});var styles=this.getStyles.apply(this,getStyles);var subtracted=[];$each(options.plains,function(plain,key){size['total'+key.capitalize()]=0;size['computed'+key.capitalize()]=0;plain.each(function(edge){size['computed'+edge.capitalize()]=0;getStyles.each(function(style,i){if(style.test(edge)){styles[style]=styles[style].toInt();if(isNaN(styles[style]))styles[style]=0;size['total'+key.capitalize()]=size['total'+key.capitalize()]+styles[style];size['computed'+edge.capitalize()]=size['computed'+edge.capitalize()]+styles[style]}if(style.test(edge)&&key!=style&&(style.test('border')||style.test('padding'))&&!subtracted.contains(style)){subtracted.push(style);size['computed'+key.capitalize()]=size['computed'+key.capitalize()]-styles[style]}})})});if($chk(size.width)){size.width=size.width+this.offsetWidth+size.computedWidth;size.totalWidth=size.width+size.totalWidth;delete size.computedWidth}if($chk(size.height)){size.height=size.height+this.offsetHeight+size.computedHeight;size.totalHeight=size.height+size.totalHeight;delete size.computedHeight}return $extend(styles,size)}});window.addEvent('domready',function(){var test=new Element('div').setStyles({position:'fixed',top:0,right:0}).inject(document.body);var supported=(test.offsetTop===0);test.dispose();Browser.supportsPositionFixed=supported});Element.implement({pin:function(enable){if(!Browser.loaded)dbug.log('cannot pin '+this+' natively because the dom is not ready');if(this.getStyle('display')=='none'){dbug.log('cannot pin '+this+' because it is hidden');return}if(enable!==false){var p=this.getPosition();if(!this.retrieve('pinned')){var pos={top:(p.y-window.getScroll().y),left:(p.x-window.getScroll().x)};if(Browser.supportsPositionFixed){this.setStyle('position','fixed').setStyles(pos)}else{this.store('pinnedByJS',true);this.setStyles({position:'absolute',top:p.y,left:p.x});this.store('scrollFixer',function(){if(this.retrieve('pinned')){var to={top:(pos.top.toInt()+window.getScroll().y),left:(pos.left.toInt()+window.getScroll().x)};this.setStyles(to)}}.bind(this));window.addEvent('scroll',this.retrieve('scrollFixer'))}this.store('pinned',true)}}else{var op;if(!Browser.Engine.trident){if(this.getParent().getComputedStyle('position')!='static')op=this.getParent();else op=this.getParent().getOffsetParent()}var p=this.getPosition(op);this.store('pinned',false);var reposition;if(Browser.supportsPositionFixed&&!this.retrieve('pinnedByJS')){reposition={top:(p.y+window.getScroll().y),left:(p.x+window.getScroll().x)}}else{this.store('pinnedByJS',false);window.removeEvent('scroll',this.retrieve('scrollFixer'));reposition={top:(p.y),left:(p.x)}}this.setStyles($merge(reposition,{position:'absolute'}))}return this.addClass('isPinned')},unpin:function(){return this.pin(false).removeClass('isPinned')},togglepin:function(){this.pin(!this.retrieve('pinned'))}});Element.Properties.position={set:function(options){this.setPosition(options)},get:function(options){if(options)this.setPosition(options);return this.getPosition()}};Element.implement({setPosition:function(options){$each(options||{},function(v,k){if(!$defined(v))delete options[k]});options=$merge({relativeTo:document.body,position:{x:'center',y:'center'},edge:false,offset:{x:0,y:0},returnPos:false,relFixedPosition:false,ignoreMargins:false,allowNegative:false},options);var parentOffset={x:0,y:0};var parentPositioned=false;var offsetParent=this.measure(function(){return $(this.getOffsetParent())});if(offsetParent&&offsetParent!=this.getDocument().body){parentOffset=offsetParent.measure(function(){return this.getPosition()});parentPositioned=true;options.offset.x=options.offset.x-parentOffset.x;options.offset.y=options.offset.y-parentOffset.y}var fixValue=function(option){if($type(option)!="string")return option;option=option.toLowerCase();var val={};if(option.test('left'))val.x='left';else if(option.test('right'))val.x='right';else val.x='center';if(option.test('upper')||option.test('top'))val.y='top';else if(option.test('bottom'))val.y='bottom';else val.y='center';return val};options.edge=fixValue(options.edge);options.position=fixValue(options.position);if(!options.edge){if(options.position.x=='center'&&options.position.y=='center')options.edge={x:'center',y:'center'};else options.edge={x:'left',y:'top'}}this.setStyle('position','absolute');var rel=$(options.relativeTo)||document.body;var calc=rel==document.body?window.getScroll():rel.getPosition();var top=calc.y;var left=calc.x;if(Browser.Engine.trident){var scrolls=rel.getScrolls();top+=scrolls.y;left+=scrolls.x}var dim=this.getDimensions({computeSize:true,styles:['padding','border','margin']});if(options.ignoreMargins){options.offset.x=options.offset.x-dim['margin-left'];options.offset.y=options.offset.y-dim['margin-top']}var pos={};var prefY=options.offset.y;var prefX=options.offset.x;var winSize=window.getSize();switch(options.position.x){case'left':pos.x=left+prefX;break;case'right':pos.x=left+prefX+rel.offsetWidth;break;default:pos.x=left+((rel==document.body?winSize.x:rel.offsetWidth)/2)+prefX;break};switch(options.position.y){case'top':pos.y=top+prefY;break;case'bottom':pos.y=top+prefY+rel.offsetHeight;break;default:pos.y=top+((rel==document.body?winSize.y:rel.offsetHeight)/2)+prefY;break};if(options.edge){var edgeOffset={};switch(options.edge.x){case'left':edgeOffset.x=0;break;case'right':edgeOffset.x=-dim.x-dim.computedRight-dim.computedLeft;break;default:edgeOffset.x=-(dim.x/2);break};switch(options.edge.y){case'top':edgeOffset.y=0;break;case'bottom':edgeOffset.y=-dim.y-dim.computedTop-dim.computedBottom;break;default:edgeOffset.y=-(dim.y/2);break};pos.x=pos.x+edgeOffset.x;pos.y=pos.y+edgeOffset.y}pos={left:((pos.x>=0||parentPositioned||options.allowNegative)?pos.x:0).toInt(),top:((pos.y>=0||parentPositioned||options.allowNegative)?pos.y:0).toInt()};if(rel.getStyle('position')=="fixed"||options.relFixedPosition){var winScroll=window.getScroll();pos.top=pos.top.toInt()+winScroll.y;pos.left=pos.left.toInt()+winScroll.x}if(options.returnPos)return pos;else this.setStyles(pos);return this}});Element.implement({isVisible:function(){return this.getStyle('display')!='none'},toggle:function(){return this[this.isVisible()?'hide':'show']()},hide:function(){var d;try{if('none'!=this.getStyle('display'))d=this.getStyle('display')}catch(e){}this.store('originalDisplay',d||'block');this.setStyle('display','none');return this},show:function(display){original=this.retrieve('originalDisplay')?this.retrieve('originalDisplay'):this.get('originalDisplay');this.setStyle('display',(display||original||'block'));return this},swapClass:function(remove,add){return this.removeClass(remove).addClass(add)},fxOpacityOk:function(){return!Browser.Engine.trident4}});var PopupDetail=new Class({Implements:[Options,Events],visible:false,observed:false,hasData:false,options:{observerAction:'mouseenter',closeOnMouseOut:true,linkPopup:false,data:{},templateOptions:{},useAjax:false,ajaxOptions:{method:'get'},ajaxLink:false,ajaxCache:{},delayOn:100,delayOff:100,stickyWinOptions:{},showNow:false,htmlResponse:false,regExp:/\\?%([^%]+)%/g},initialize:function(html,observer,options){this.setOptions(options);try{this.options.stickyWinToUse=this.options.stickyWinToUse||StickyWin.Fx}catch(e){this.options.stickyWinToUse=StickyWin}this.observer=$(observer);this.html=($(html))?$(html).get('html'):html||'';if(this.options.showNow)this.show.delay(this.options.delayOn,this);this.setUpObservers()},setUpObservers:function(){var opt=this.options;this.observer.addEvent(opt.observerAction,function(){this.observed=true;this.show.delay(opt.delayOn,this)}.bind(this));if((opt.observerAction=="mouseenter"||opt.observerAction=="mouseover")&&this.options.closeOnMouseOut){this.observer.addEvent("mouseleave",function(){this.observed=false;this.hide.delay(opt.delayOff,this)}.bind(this))}return this},parseTemplate:function(string,values){return string.substitute(values,this.options.regExp)},makePopup:function(){if(!this.stickyWin){var opt=this.options;if(opt.htmlResponse)this.content=this.data;else this.content=this.parseTemplate(this.html,opt.data);this.stickyWin=new opt.stickyWinToUse($merge(opt.stickyWinOptions,{relativeTo:this.observer,showNow:false,content:this.content,allowMultipleByClass:true}));if($(opt.linkPopup)||$type(opt.linkPopup)=='string'){this.stickyWin.win.setStyle('cursor','pointer').addEvent('click',function(){window.location.href=($type(url)=='string')?url:url.src})}this.stickyWin.win.addEvent('mouseenter',function(){this.observed=true}.bind(this));this.stickyWin.win.addEvent('mouseleave',function(){this.observed=false;if(opt.closeOnMouseOut)this.hide.delay(opt.delayOff,this)}.bind(this))}return this},getContent:function(){try{new Request($merge(this.options.ajaxOptions,{url:this.options.ajaxLink||this.observer.href,onSuccess:this.show.bind(this)})).send()}catch(e){dbug.log('ajax error on PopupDetail: %s',e)}},show:function(data){var opt=this.options;if(data)this.data=data;if(this.observed&&!this.visible){if(opt.useAjax&&!this.data){var cachedVal=opt.ajaxCache[this.options.ajaxLink]||opt.ajaxCache[this.observer.href];if(cachedVal){this.fireEvent('onPopupShow',this);return this.show(cachedVal)}this.cursorStyle=this.observer.getStyle('cursor');this.observer.setStyle('cursor','wait');this.getContent();return false}else{if(this.cursorStyle)this.observer.setStyle('cursor',this.cursorStyle);if(opt.useAjax&&!opt.htmlResponse)opt.data=JSON.decode(this.data);this.makePopup();this.fireEvent('onPopupShow',this);this.stickyWin.show();this.visible=true;return this}}return this},hide:function(){if(!this.observed){this.fireEvent('onPopupHide');if(this.stickyWin)this.stickyWin.hide();this.visible=false}return this}});var PopupDetailCollection=new Class({Implements:[Options],options:{details:{},links:[],ajaxLinks:[],useCache:true,template:'',popupDetailOptions:{}},cache:{},initialize:function(observers,options){this.observers=$$(observers);this.setOptions(options);var ln=this.options.ajaxLinks.length;if(ln<=0)ln=this.options.details.length;if(this.observers.length!=ln)dbug.log("warning: observers and details are out of sync.");this.makePopupDetails()},makePopupDetails:function(){this.popupDetailObjs=this.observers.map(function(observer,index){var opt=this.options.popupDetailOptions;var pd=new PopupDetail(this.options.template,observer,$merge(opt,{data:$pick(this.options.details[index],{}),linkItem:$pick(this.options.links[index],$pick(opt.linkItem,false)),ajaxLink:$pick(this.options.ajaxLinks[index],false),ajaxCache:(this.options.useCache)?this.cache:{},useAjax:this.options.ajaxLinks.length>0}));return pd},this)}});var StyleWriter=new Class({createStyle:function(css,id){window.addEvent('domready',function(){try{if($(id)&&id)return;var style=new Element('style',{id:id||''}).inject($$('head')[0]);if(Browser.Engine.trident)style.styleSheet.cssText=css;else style.set('text',css)}catch(e){dbug.log('error: %s',e)}}.bind(this))}});var StickyWin=new Class({Implements:[Options,Events,StyleWriter,ToElement],options:{closeClassName:'closeSticky',pinClassName:'pinSticky',content:'',zIndex:10000,className:'',width:false,height:false,timeout:-1,allowMultipleByClass:false,allowMultiple:true,showNow:true,useIframeShim:true,iframeShimSelector:'',inject:{where:'bottom'}},css:'.SWclearfix:after {content: "."; display: block; height: 0; clear: both; visibility: hidden;}'+'.SWclearfix {display: inline-table;}'+'* html .SWclearfix {height: 1%;}'+'.SWclearfix {display: block;}',initialize:function(options){this.setOptions(options);this.options.inject.target=this.options.inject.target||document.body;this.id=this.options.id||'StickyWin_'+new Date().getTime();this.makeWindow();if(this.options.content)this.setContent(this.options.content);if(this.options.timeout>0){this.addEvent('onDisplay',function(){this.hide.delay(this.options.timeout,this)}.bind(this))}if(this.options.showNow)this.show();this.createStyle(this.css,'StickyWinClearFix')},makeWindow:function(){this.destroyOthers();if(!$(this.id)){this.win=new Element('div',{id:this.id}).addClass(this.options.className).addClass('StickyWinInstance').addClass('SWclearfix').setStyles({display:'none',position:'absolute',zIndex:this.options.zIndex}).inject(this.options.inject.target,this.options.inject.where).store('StickyWin',this)}else this.win=$(this.id);this.element=this.win;if(this.options.width&&$type(this.options.width.toInt())=="number")this.win.setStyle('width',this.options.width.toInt());if(this.options.height&&$type(this.options.height.toInt())=="number")this.win.setStyle('height',this.options.height.toInt());return this},show:function(suppressEvent){this.showWin();if(!suppressEvent)this.fireEvent('onDisplay');if(this.options.useIframeShim)this.showIframeShim();this.visible=true;return this},showWin:function(){if(!this.positioned)this.position();this.win.show()},hide:function(suppressEvent){if(!suppressEvent)this.fireEvent('onClose');this.hideWin();if(this.options.useIframeShim)this.hideIframeShim();this.visible=false;return this},hideWin:function(){this.win.setStyle('display','none')},destroyOthers:function(){if(!this.options.allowMultipleByClass||!this.options.allowMultiple){$$('div.StickyWinInstance').each(function(sw){if(!this.options.allowMultiple||(!this.options.allowMultipleByClass&&sw.hasClass(this.options.className)))sw.retrieve('StickyWin').destroy()},this)}},setContent:function(html){if(this.win.getChildren().length>0)this.win.empty();if($type(html)=="string")this.win.set('html',html);else if($(html))this.win.adopt(html);this.win.getElements('.'+this.options.closeClassName).each(function(el){el.addEvent('click',this.hide.bind(this))},this);this.win.getElements('.'+this.options.pinClassName).each(function(el){el.addEvent('click',this.togglepin.bind(this))},this);return this},position:function(options){this.positioned=true;this.setOptions(options);this.win.setPosition({allowNegative:true,relativeTo:this.options.relativeTo,position:this.options.position,offset:this.options.offset,edge:this.options.edge});if(this.shim)this.shim.position();return this},pin:function(pin){if(!this.win.pin){dbug.log('you must include element.pin.js!');return this}this.pinned=$pick(pin,true);this.win.pin(pin);return this},unpin:function(){return this.pin(false)},togglepin:function(){return this.pin(!this.pinned)},makeIframeShim:function(){if(!this.shim){var el=(this.options.iframeShimSelector)?this.win.getElement(this.options.iframeShimSelector):this.win;this.shim=new IframeShim(el,{display:false,name:'StickyWinShim'})}},showIframeShim:function(){if(this.options.useIframeShim){this.makeIframeShim();this.shim.show()}},hideIframeShim:function(){if(this.shim)this.shim.hide()},destroy:function(){if(this.win)this.win.dispose();if(this.options.useIframeShim&&this.shim)this.shim.dispose();if($('modalOverlay'))$('modalOverlay').dispose()}});StickyWin.Fx=new Class({Extends:StickyWin,options:{fade:true,fadeDuration:150,draggable:false,dragOptions:{},dragHandleSelector:'.dragHandle',resizable:false,resizeOptions:{},resizeHandleSelector:''},setContent:function(html){this.parent(html);if(this.options.draggable)this.makeDraggable();if(this.options.resizable)this.makeResizable();return this},hideWin:function(){if(this.options.fade)this.fade(0);else this.parent()},showWin:function(){if(this.options.fade)this.fade(1);else this.parent()},hide:function(){this.parent(this.options.fade)},show:function(){this.parent(this.options.fade)},fade:function(to){if(!this.fadeFx){this.win.setStyles({opacity:0,display:'block'});var opts={property:'opacity',duration:this.options.fadeDuration};if(this.options.fadeTransition)opts.transition=this.options.fadeTransition;this.fadeFx=new Fx.Tween(this.win,opts)}if(to>0){this.win.setStyle('display','block');this.position()}this.fadeFx.clearChain();this.fadeFx.start(to).chain(function(){if(to==0){this.win.setStyle('display','none');this.fireEvent('onClose')}else{this.fireEvent('onDisplay')}}.bind(this));return this},makeDraggable:function(){dbug.log('you must include Drag.js, cannot make draggable')},makeResizable:function(){dbug.log('you must include Drag.js, cannot make resizable')}});var StickyWinFx=StickyWin.Fx;var Waiter=new Class({Implements:[Options,Events,Chain],options:{baseHref:'http://www.cnet.com/html/rb/assets/global/waiter/',containerProps:{styles:{position:'absolute','text-align':'center'},'class':'waiterContainer'},containerPosition:{},msg:false,msgProps:{styles:{'text-align':'center',fontWeight:'bold'},'class':'waiterMsg'},img:{src:'waiter.gif',styles:{width:24,height:24},'class':'waiterImg'},layer:{styles:{width:0,height:0,position:'absolute',zIndex:999,display:'none',opacity:0.9,background:'#fff'},'class':'waitingDiv'},useIframeShim:true,fxOptions:{},injectWhere:null},initialize:function(target,options){this.target=$(target)||$(document.body);this.setOptions(options);this.waiterContainer=new Element('div',this.options.containerProps);if(this.options.msg){this.msgContainer=new Element('div',this.options.msgProps);this.waiterContainer.adopt(this.msgContainer);if(!$(this.options.msg))this.msg=new Element('p').appendText(this.options.msg);else this.msg=$(this.options.msg);this.msgContainer.adopt(this.msg)}if(this.options.img)this.waiterImg=$(this.options.img.id)||new Element('img').inject(this.waiterContainer);this.waiterOverlay=$(this.options.layer.id)||new Element('div').adopt(this.waiterContainer);this.waiterOverlay.set(this.options.layer);this.place(target);try{if(this.options.useIframeShim)this.shim=new IframeShim(this.waiterOverlay,this.options.iframeShimOptions)}catch(e){dbug.log("Waiter attempting to use IframeShim but failed; did you include IframeShim? Error: ",e);this.options.useIframeShim=false}this.waiterFx=this.waiterFx||new Fx.Elements($$(this.waiterContainer,this.waiterOverlay),this.options.fxOptions)},place:function(target,where){var where=where||this.options.injectWhere||target==document.body?'inside':'after';this.waiterOverlay.inject(target,where)},toggle:function(element,show){element=$(element)||$(this.active)||$(this.target);this.place(element);if(!$(element))return this;if(this.active&&element!=this.active)return this.stop(this.start.bind(this,element));if((!this.active||show)&&show!==false)this.start(element);else if(this.active&&!show)this.stop();return this},reset:function(){this.waiterFx.cancel().set({0:{opacity:[0]},1:{opacity:[0]}})},start:function(element){this.reset();element=$(element)||$(this.target);this.place(element);if(this.options.img){this.waiterImg.set($merge(this.options.img,{src:this.options.baseHref+this.options.img.src}))}var start=function(){var dim=element.getComputedSize();this.active=element;this.waiterOverlay.setStyles({width:this.options.layer.width||dim.totalWidth,height:this.options.layer.height||dim.totalHeight,display:'block'}).setPosition({relativeTo:element,position:'upperLeft'});this.waiterContainer.setPosition($merge({relativeTo:this.waiterOverlay},this.options.containerPosition));if(this.options.useIframeShim)this.shim.show();this.waiterFx.start({0:{opacity:[1]},1:{opacity:[this.options.layer.styles.opacity]}}).chain(function(){if(this.active==element)this.fireEvent('onShow',element);this.callChain()}.bind(this))}.bind(this);if(this.active&&this.active!=element)this.stop(start);else start();return this},stop:function(callback){if(!this.active){if($type(callback)=="function")callback.attempt();return this}this.waiterFx.cancel();this.waiterFx.clearChain();this.waiterFx.start({0:{opacity:[0]},1:{opacity:[0]}}).chain(function(){this.active=null;this.waiterOverlay.hide();if(this.options.useIframeShim)this.shim.hide();this.fireEvent('onHide',this.active);this.callChain();this.clearChain();if($type(callback)=="function")callback.attempt()}.bind(this));return this}});if(typeof Request!="undefined"&&Request.HTML){Request.HTML=Class.refactor(Request.HTML,{options:{useWaiter:false,waiterOptions:{},waiterTarget:false},initialize:function(options){this._send=this.send;this.send=function(options){if(this.waiter)this.waiter.start().chain(this._send.bind(this,options));else this._send(options);return this};this.parent(options);if(this.options.useWaiter&&($(this.options.update)||$(this.options.waiterTarget))){this.waiter=new Waiter(this.options.waiterTarget||this.options.update,this.options.waiterOptions);['onComplete','onException','onCancel'].each(function(event){this.addEvent(event,this.waiter.stop.bind(this.waiter))},this)}}})}Element.Properties.waiter={set:function(options){var waiter=this.retrieve('waiter');return this.eliminate('wait').store('waiter:options')},get:function(options){if(options||!this.retrieve('waiter')){if(options||!this.retrieve('waiter:options'))this.set('waiter',options);this.store('waiter',new Waiter(this,this.retrieve('waiter:options')))}return this.retrieve('waiter')}};Element.implement({wait:function(options){this.get('waiter',options).start();return this},release:function(){var opt=Array.link(arguments,{options:Object.type,callback:Function.type});this.get('waiter',opt.options).stop(opt.callback);return this}});