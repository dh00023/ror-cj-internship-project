var View = Backbone.View.extend({
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
        console.log(s.model);

        // (this.el).html.append("<p>Hello World</p>");
    }
});