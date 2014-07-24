define(
    ['jquery','underscore','backbone', 'marionette', 'lib/mula/views/keg'], 
    function ($, _, Backbone, Marionette, Keg){

        var KegRouter = Backbone.Router.extend({
            routes: {
                "keg":"listAll",
                "keg/:id":"getKeg",
                "keg/:id/history/p:page":"getKegHistory"
            },
            listAll: function (){
                console.log('Listing ALL kegs.');
                var kegView = new Keg();
                kegView.render();
            },
            getKeg: function (id){
                console.log('Showing Keg with ID: ' + id);
            },
            getKegHistory: function (id, page){
                console.log('Showing History for Keg with ID: ' + id);
            }
        });
        return KegRouter;
    }
);