# semantic-ui

Holds the semantic-ui distribution used to make the custom theme for RadGrad.

There exists an [Atmosphere package for Semantic UI](https://github.com/Semantic-Org/Semantic-UI-Meteor). Unfortunately, as far as I can tell, this package only provides an easy way to install the default themes, and we need a customized theme.

So, instead of using the Atmosphere package, we'll use this repo to manage our own customized RadGrad theme and then copy the generated .css and .js files into the radgrad app.

This also has the advantage that we can more easily keep up to date with the latest releases of Semantic UI.  The Atmosphere package is currently a couple of minor releases out of date. 

This distribution of semantic-ui was installed using NPM. See [Semantic UI, Getting Started](http://semantic-ui.com/introduction/getting-started.html) for more details.

## Customizations

Here is a summary of the modifications; follow the links to see the latest definitions:

[src/site/globals/site.variables](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/globals/site.variables)

  * Define fonts: make Open Sans the default font and Lobster for the brand.
  * Define the color palette. Using a 'key lime pie' aesthetic. Also ICE Colors.
  
[src/site/globals/site.overrides](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/globals/site.overrides)

  * Define classes to provide theme colors and fonts for standard HTML (i.e. not semantic UI elements.)
  
[src/site/views/card.variables](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/views/card.variables)

  * Override @description and @extracontent color definitions so text isn't so light.
  
[src/site/collections/menu.variables](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/collections/menu.variables)

  * Override menu and inverted menu background colors with our foreground/background colors.
  
[src/site/elements/labels.variables](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/elements/label.variables)

  * Override label text color to make it darker.
  
  
## Installation
  
If you are downloading this from GitHub, the node_modules directory needs to be built.  I think you can do this with:

```sh
$ npm install semantic-ui --save
```
  
To update to a new release of semantic-ui, try:

```
$ npm update
```
  
To build a new theme and install it in the template, cd into the semantic/ directory, then invoke install-dist.sh

```
$ cd semantic
$ ./install-dist.sh
```

Here's the expected output (elided):

```
[~/github/radgrad/semantic-ui/semantic]-> ./install-dist.sh 
[15:07:58] Using gulpfile ~/github/radgrad/semantic-ui/semantic/gulpfile.js
[15:07:58] Starting 'build'...
Building Semantic
[15:07:58] Starting 'build-javascript'...
Building Javascript
[15:07:58] Starting 'build-css'...
Building CSS
[15:07:58] Starting 'build-assets'...
Building assets
[15:07:59] Created: dist/components/site.js
[15:07:59] Created: dist/components/site.min.js
 :
 :
 :
[15:08:10] Created: dist/components/transition.css
[15:08:10] Starting 'package uncompressed css'...
[15:08:10] Created: dist/components/transition.min.css
[15:08:10] Starting 'package compressed css'...
[15:08:19] Created: dist/semantic.min.css
[15:08:19] Finished 'package compressed css' after 8.67 s
[15:08:19] Created: dist/semantic.css
[15:08:19] Finished 'package uncompressed css' after 8.68 s
[15:08:19] Finished 'build-css' after 21 s
[15:08:19] Finished 'build' after 21 s
+ rm -rf ../../radgrad/app/client/lib/semantic-ui
+ rm -rf ../../radgrad/app/public/themes
+ mkdir ../../radgrad/app/client/lib/semantic-ui/
+ cp -r dist/semantic.min.css ../../radgrad/app/client/lib/semantic-ui/
+ cp -r dist/semantic.min.js ../../radgrad/app/client/lib/semantic-ui/
+ cp -r dist/themes ../../radgrad/app/public
```
  
The install script runs `gulp build` copies dist/semantic.min.css and dist/semantic.min.js to ../../radgrad/app/client/lib/semantic-ui.

So that the icon files can be loaded, the dist/themes/ directory is copied to ../../radgrad/app/public.


