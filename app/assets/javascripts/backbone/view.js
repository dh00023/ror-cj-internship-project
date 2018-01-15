var View = Backbone.View.extend({
    el: '#container',
    template: _.template("<h3>Hello <%=who%></h3>"),
    initialize: function(){
            this.render();
          },

          render: function(){
            // render the function using substituting the varible 'who' for 'world!'.
            this.$el.html(this.template({who: 'dd'}));
            // console.log(collection.models[0].attributes);
            //***Try putting your name instead of world.
          }
    // el : element
    // el: '#cc',
    // events: {
    //     "click button": "render"
    // },
    // render: function() {
    //     var data = collection.at(0).attributes.result;
    //     console.log(data.imagesInfo.itemImages);
    //     console.log(data.detailInfo.dispItemName);
    //     console.log(data.detailInfo.clpSlPrc);
    //     // 이미지 경로 a.imagesInfo.itemImages
    //     // 상품이름  a.detailInfo.dispItemName
    //     //가격 a.detailInfo.clpSlPrc
    // }
});
var view = new View({ model: collection });
// http://mobicon.tistory.com/240
// https://stackoverflow.com/questions/9350726/raising-a-backbone-js-view-event(trigger)
// http://webframeworks.kr/tutorials/backbonejs/backbone_events/
// http://adrianmejia.com/blog/2012/09/11/backbone-dot-js-for-absolute-beginners-getting-started/

// http://codebeerstartups.com/2012/12/9-collection-views-in-backbone-js-learning-backbone-js/