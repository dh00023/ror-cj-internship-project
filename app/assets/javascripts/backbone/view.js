var View = Backbone.View.extend({
    initialize: function () {
        this.template = $('#list-template').children();
    },
    // el : element
    el: '#cc',
    events: {
        "click button": "render"
    },
    render: function() {
        var data = collection.at(1).attributes.result;
        console.log(data.imagesInfo.itemImages);
        console.log(data.detailInfo.dispItemName);
        console.log(data.detailInfo.clpSlPrc);
        // 이미지 경로 a.imagesInfo.itemImages
        // 상품이름  a.detailInfo.dispItemName
        //가격 a.detailInfo.clpSlPrc
    }
});
var view = new View({ model: MyModel });