define(
    ['jquery','underscore','backbone', 'marionette', 'lib/mula/routers/kegs'], 
    function ($, _, Backbone, Marionette, KegRouter){

        var KegApp = new Marionette.Application();
        KegApp.addInitializer(function (options){
            new KegRouter();
            Backbone.history.start();
            console.log('App Started');
        });
        return KegApp;
    }
);