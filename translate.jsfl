var wait_uri;
var work_uri;
var targets;
var actions;
var actionMap = {
	"export.img": actionExportImg,
	"import.img": actionImportImg,
	"export.txt": actionExportTxt,
	"import.txt": actionImportTxt,
	"export.swf": actionExportSwf,
	};

function foreach(es, func){
	for(var i = 0; i < es.length; ++i){
		if(func(es[i])){
			break;
		}
	}
}

function mkdir(uri){
	var li = uri.lastIndexOf("/");
	if(li < uri.length){
		uri = uri.substring(0, li+1);
	}
	if(!FLfile.exists(uri)){
		FLfile.createFolder(uri);
	}
}

function readIniArgs(){
	var inis = FLfile.read(fl.scriptURI.substring(0, fl.scriptURI.lastIndexOf("/")) + "/translate.jsfl.ini").split("\r\n");
	var ini;
	var obj = {};
	var arr;
	for(var i = 0; i < inis.length; ++i){
		ini = inis[i];

		if("" === ini ||  "#" === ini.charAt(0)){
			continue;
		}

		arr = ini.split("=");
		obj[arr[0]] = arr[1];
	}

	return [obj.version_dir, obj.targets, obj.actions].join(",");
}

function initEnvArgs(args_str){
	args = args_str.split(",");

	if(0 === args.length || "" === args[0] || "" === args[1] || "" === args[2]){
		return false;
	}

	var root = args[0];
	wait_uri = FLfile.platformPathToURI(root + "/fla.wait");
	work_uri = FLfile.platformPathToURI(root + "/fla.work");

	targets = ";" ===  args[1] ? [] : args[1].split(";").map(function(target){return target+".fla"});

	actions = args[2].split(";");

	return true;
}

function lockLayer(need_lock){
	var layers = fl.getDocumentDOM().getTimeline().layers;
	for(var i= 0; i < layers.length; ++i){
		layers[i].locked = need_lock;
	}
}

function actionExportImg(file){
	var src_img_dir = work_uri + "/img.wait/" + file;
	var dst_img_dir = work_uri + "/img.work/" + file;

	var items = fl.getDocumentDOM().library.items;

	foreach(items, function(item){
		if("bitmap" == item.itemType){
			mkdir(src_img_dir + "/" + item.name);
			mkdir(dst_img_dir + "/" + item.name);
			item.exportToFile(src_img_dir + "/" + item.name);
		}
		return false;
	});
}

function actionImportImg(file){
	var dst_img_dir = work_uri + "/img.work/" + file;

	var items = fl.getDocumentDOM().library.items;

	foreach(items, function(item){
		if("bitmap" == item.itemType){
			if(FLfile.exists(dst_img_dir + "/" + item.name)){
				var uri = decodeURI(item.sourceFilePath);
				mkdir(uri);
				FLfile.remove(uri);
				FLfile.copy(dst_img_dir + "/" + item.name, uri);
				fl.getDocumentDOM().library.updateItem(item.name);
			}
		}
		return false;
	});
}

function actionExportTxt(file){
	var handler = function(){
		for(var i = 0; i < fl.getDocumentDOM().getTimeline().frameCount; ++i){
			fl.getDocumentDOM().getTimeline().currentFrame = i;

			lockLayer(false);
			fl.getDocumentDOM().selectAll();

			var es = fl.getDocumentDOM().selection;

			foreach(es, function(e){
				if("text"=== e.elementType){
					var txt = e.getTextString();
					if("" !== txt){
						var txt_escape = encodeURIComponent(txt);
						var txt_md5 = md5(txt_escape);
						var pair = txt_md5 + "=" + txt_escape;
						if(-1 === txts.indexOf(pair)){
							txts.push(pair);
						}
					}
				}

				return false;
			});

			fl.getDocumentDOM().selectNone();
		}
	}

	var items = fl.getDocumentDOM().library.items;

	var txts = [];

	foreach(items, function(item){
		if("movie clip" == item.itemType){
			fl.getDocumentDOM().library.editItem(item.name);

			handler();
		}
		return false;
	});

	fl.getDocumentDOM().library.editItem();

	handler();

	if(0 < txts.length){
		var src_txt = work_uri + "/" + file + ".txt";

		mkdir(src_txt);

		FLfile.write(src_txt, txts.join("\n"));
	}
}

function actionImportTxt(file){
	var handler = function(){
		for(var i = 0; i < fl.getDocumentDOM().getTimeline().frameCount; ++i){
			fl.getDocumentDOM().getTimeline().currentFrame = i;

			lockLayer(false);
			fl.getDocumentDOM().selectAll();

			var es = fl.getDocumentDOM().selection;

			foreach(es, function(e){
				if("text"=== e.elementType){
					var txt = e.getTextString();
					if("" !== txt){
						var txt_escape = encodeURIComponent(txt);
						var txt_md5 = md5(txt_escape);
						if(void 0 !== txt_md5){
							e.setTextString(maps["_" + txt_md5]);
						}
					}
				}

				return false;
			});

			fl.getDocumentDOM().selectNone();
		}
	}

	var dst_txt = work_uri + "/" + file + ".txt";

	if(!FLfile.exists(dst_txt)){
		return;
	}

	var txts = FLfile.read(dst_txt).split("\n");
	var maps = {};
	var pair;

	for(var i = 0; i < txts.length; ++i){
		pair = txts[i].split("=");
		maps["_" + pair[0]] = decodeURIComponent(pair[1]);
	}

	var items = fl.getDocumentDOM().library.items;

	var txts = [];

	foreach(items, function(item){
		if("movie clip" == item.itemType){
			fl.getDocumentDOM().library.editItem(item.name);

			handler();
		}
		return false;
	});

	fl.getDocumentDOM().library.editItem();

	handler();
}

function actionExportSwf(file){
	fl.getDocumentDOM().publish();
}

function main(){
	var args_str = prompt("目标目录,目标0;目标1;...,操作0;操作1,...", readIniArgs());
	
	if(null == args_str){
		return;
	}

	if(!initEnvArgs(args_str)){
		return;
	}

	fl.showIdleMessage(false);

	fl.runScript(fl.scriptURI.substring(0, fl.scriptURI.lastIndexOf("/")) + "/md5.js");

	var files = FLfile.listFolder(wait_uri + "/*.fla", "files");

	foreach(files, function(file){
		if(0 < targets.length && -1 === targets.indexOf(file)){
			return false;
		}

		fl.openDocument(wait_uri + "/" + file);

		foreach(actions, function(action){
			var actionFunc = actionMap[action];

			if(void 0 !== actionFunc){
				actionFunc(file);
			}

			return false;
		});

		fl.saveDocument(fl.getDocumentDOM());
		fl.closeDocument(fl.getDocumentDOM(), false);
	});

	fl.quit(false);
}

main();
