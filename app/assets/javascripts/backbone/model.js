//definitions
var MyModel = Backbone.Model.extend({});
var MyCollection = Backbone.Collection.extend({
    model: MyModel
});

//wherever you need a collection instance
collection = new MyCollection();

//wherever you need to do the ajax
Backbone.ajax({
  type: "GET", 
	dataType: "jsonp",
	url: "http://display.cjmall.com/c/rest/item/36260855/itemInfo.json?channelCode=30001001&isEmployee=false&isMyzone=false&isSimple=false&isSearch=false",
	data: {},
	xhrFields: {
		withCredentials: true
	},

  success: function(val){
    collection.add(val);  //or reset
    console.log(val);
    // callback(collection);
  }
});
