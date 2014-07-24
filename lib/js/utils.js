define(['jquery'], function ($){
   return {
        multiTemplateHelper: function(templateSource) {
            var $templateElement, canonicalTemplates, templateElement, templates, 
            i, len, _ref, _ref1;
            
            templates = $.parseHTML(templateSource);
            canonicalTemplates = {};
           
            for (i = 0, len = templates.length; i < len; i++) {
                templateElement = templates[i];
                $templateElement = $(templateElement);
                if (templateElement.id) {
                    canonicalTemplates[templateElement.id] = $templateElement.html();
                }
                
            }
                       
            return canonicalTemplates;
        }
    }
});
