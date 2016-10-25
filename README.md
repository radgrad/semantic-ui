# semantic-ui

Holds the semantic-ui distribution used to make the custom theme for RadGrad.

There exists an [Atmosphere package for Semantic UI](https://github.com/Semantic-Org/Semantic-UI-Meteor). Unfortunately, as far as I can tell, this package only provides an easy way to install the default themes, and we need a customized theme.

So, instead of using the Atmosphere package, we'll use this repo to manage our own customized RadGrad theme and then copy the generated .css and .js files into the radgrad app.

This has the advantage that we can more easily keep up to date with the latest releases of Semantic UI.  The Atmosphere package is currently a couple of minor releases out of date. 

This distribution of semantic-ui was installed using NPM. See [Semantic UI, Getting Started](http://semantic-ui.com/introduction/getting-started.html) for more details.

## Customizations

Here are changes:

  * Made Open Sans the default font. (src/themes/default/globals/site.variables)
  * Changed @description and @extracontent color definitions to use textColor so text isn't so light. (src/themes/default/views/card.variables)
  
## Installation
  
If you are downloading this from GitHub, the node_modules directory needs to be built.  I think you can do this with:

  * `npm install semantic-ui --save`
  
To update to a new release of semantic-ui, try:

  * `npm update`
  
To build a new theme and install it in the template, cd into the semantic/ directory, then invoke:

  * `gulp build`
  * `install-dist.sh`
  
The install script copies dist/semantic.min.css and dist/semantic.min.js to radgrad/app/client/lib/semantic-ui.

So that the icon files can be loaded, the dist/themes/ directory is copied to radgrad/app/public.


