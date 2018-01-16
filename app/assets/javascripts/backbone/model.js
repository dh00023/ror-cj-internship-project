var MyModel = Backbone.Model.extend({
  initialize: function(){
    // console.log('aa');
    var s = this;
    s.code = code2;
    s.url = "http://display.cjmall.com/c/rest/item/"+code2+"/itemInfo.json?channelCode=30001001&isEmployee=false&isMyzone=false&isSimple=false&isSearch=false";
  },
  
  update: function(){
    var s = this;
    Backbone.ajax({
      type: "GET", 
      dataType: "jsonp",
      url: s.url,
      data: {},
      xhrFields: {
        withCredentials: true
      },
      success: function(val){
        if(val.code==1 && val.status==200){
          // console.log(val.result);
          s.setData(val.result);
          s.trigger('success');
        }
      }
    });
  },
  setData: function(result){
    var s = this;
    // console.log(result);
    s.set ({
      imageURL  :result.imagesInfo.itemImages[0],
      name      :result.detailInfo.dispItemName,
      price     :result.detailInfo.clpSlPrc,
      code      :s.code
    });
  }
});
