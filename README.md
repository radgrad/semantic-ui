# semantic-ui

Holds the semantic-ui distribution used to make the custom theme for RadGrad.

There exists an [Atmosphere package for Semantic UI](https://github.com/Semantic-Org/Semantic-UI-Meteor). Unfortunately, as far as I can tell, this package only provides an easy way to install the default themese 

This distribution of semantic-ui was installed using NPM. See [Semantic UI, Getting Started](http://semantic-ui.com/introduction/getting-started.html) for more details.

Customizations:

  * src/themes/default/globals/site.variables:  made Open Sans the default font.
  * src/themes/default/views/card.variables: I changed the @description and @extracontent color definitions to use textColor so the text wouldn't be so light.
  
If you are downloading this from GitHub, the node_modules directory needs to be built.  I think you can do this with:

  * `npm install semantic-ui --save`
  
To update to a new release of semantic-ui, I think it's as simple as:

  * `npm update`
  
To build a new theme and install it in the template, cd into the semantic/ directory, then invoke:

  * `gulp build`
  * `install-dist.sh`
