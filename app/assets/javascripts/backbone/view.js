var View = Backbone.View.extend({
    el: $('div#recommend'),

    initialize: function(){
        var s = this;
        var model = new MyModel();
        model.update();
        
        s.model = model;
        
        s.listenTo(s.model, 'success', s.render);


        // model.on("success", movieSuccessHandler);
        // this.listenTo(model,'success',this.render());  
        // //view.listenTo(model, 'change', view.render);
        //model.listenTo(model,'updated',this.render);
    },
    render: function(){
        var s = this;
        console.log(s.model.get('imageURL'));
        $(s.el).html('<a href="http://display.cjmall.com/m/item/'+s.model.get('code')+'"><img class="card-img-top"src='+s.model.get('imageURL')+' alt="Card image cap"></a>');
        $(s.el).append('<div class="card-body text-right" id="personTemplate"><h6 class="card-title">'+s.model.get('name')+'</h6>');
        $(s.el).append('<p class="card-text mr-3 text-right">'+s.model.get('price')+'원 </p></div>');
    }
});