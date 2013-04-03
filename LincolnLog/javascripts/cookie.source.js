var cookie = {
	get:function(name){
		if(document.cookie)
			return unescape(document.cookie.match(new RegExp(name + '=([^;]+)'))[1]);
		return null;
	},
	set:function(name,value,expiredays){
		var expireDate = new Date ();
		expireDate.setTime(expireDate.getTime() + (expiredays * 24 * 3600 * 1000));
		return document.cookie = name + "=" + escape(value) +
		((expiredays == null) ? "" : "; expires=" + expireDate.toGMTString());
	},
	del:function(name){
		if(this.get(name))
			this.set(name,"",-1);
	}
}