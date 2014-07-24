define(
    ['utils','jquery','underscore','backbone', 'marionette', 'text!/templates/kegs/templates.tpl'], 
    function (Utils, $, _, Backbone, Marionette, kegTemplates){
        kegTemplates = Utils.multiTemplateHelper(kegTemplates);
        var KegLayout = Marionette.LayoutView.extend({
            template: "#main",
            regions: {
                title: '#title',
                body: '#body'
                //menu: '#menu',
                //footer: '#footer'
            },
            initialize: function (options) {
                this.title.show( new KegTitle() );
                this.body.show(  new KegItem() );
                //this.body.show(  new KegItem({name: 'Ariel'}) );
            }
            
        });
        var KegTitle = Marionette.ItemView.extend({
            className: 'title',
            template: function (data){
                data = data || {};
                return _.template(kegTemplates['kegs-title'], data, {variable: ''});
            }
        }); 
        var KegItem = Marionette.ItemView.extend({
            defaults: {
                name: 'Marcos'
            },
            initialize: function (options) {
                _.defaults(this.options, this.defaults);
            },
            serializeData: function (data) {
                return {
                    name: this.options.name
                }
            },
            className: 'keg-container',
            template: function (data) {
                data = data || {};                
                return _.template(kegTemplates['kegs-item'], data, {variable: ''});
            }
        });
        return KegLayout;
    }
);