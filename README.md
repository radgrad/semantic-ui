# semantic-ui

Holds the semantic-ui distribution used to make the custom theme for RadGrad.

There exists an [Atmosphere package for Semantic UI](https://github.com/Semantic-Org/Semantic-UI-Meteor). Unfortunately, as far as I can tell, this package only provides an easy way to install the default themes, and we need a customized theme.

So, instead of using the Atmosphere package, we'll use this repo to manage our own customized RadGrad theme and then copy the generated .css and .js files into the radgrad app.

This also has the advantage that we can more easily keep up to date with the latest releases of Semantic UI.  The Atmosphere package is currently a couple of minor releases out of date. 

This distribution of semantic-ui was installed using NPM. See [Semantic UI, Getting Started](http://semantic-ui.com/introduction/getting-started.html) for more details.

## Current theme customizations

Here is a summary of the modifications; follow the links to see the latest definitions:

[src/site/globals/site.overrides](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/globals/site.overrides)

  * Define global CSS classes to provide theme colors and fonts for standard HTML (i.e. not semantic UI elements.)

[src/site/globals/site.variables](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/globals/site.variables)

  * Define fonts: make Open Sans the default font and Lobster for the brand.
  * Define the color palette. Using a 'key lime pie' aesthetic. Also ICE Colors.
  
[src/site/views/card.variables](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/views/card.variables)

  * Override @description and @extracontent color definitions so text isn't so light.
  
[src/site/collections/menu.variables](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/collections/menu.variables)

  * Override menu and inverted menu background colors with our foreground/background colors.
  
[src/site/elements/labels.variables](https://github.com/radgrad/semantic-ui/blob/master/semantic/src/site/elements/label.variables)

  * Override label text color to make it darker.
  
  
## Installation
  
If you are downloading this from GitHub, the node_modules directory needs to be built.  Do this by invoking the following at top-level:

```sh
$ npm install semantic-ui --save
```
  
If you already have this around, and want to update to a new release of semantic-ui, try:

```
$ npm update
```

### Building a theme (semantic-ui repo only)
  
To build a new theme, invoke:
 
```
$ cd semantic
$ gulp build
```

This will build the theme. You can display it by retrieving the index.html file.

### Build a theme (install into radgrad repo)

To build a new theme *and* install it into the radgrad repository, invoke:

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

## Note from April 2018 update

We started seeing the following error in Meteor after updating to Meteor 1.6.1:

```
warn: there are some @import rules those are not taking effect as they are required to be in the beginning of the file 
```

This appears to a result of our custom theme css file (semantic.min.css) doing an import of Google Fonts at the top of its file, but being concatenated with other CSS files by Meteor so that this import ends up in the middle of the jumbo CSS file.

The workaround we are using is to copy semantic.min.css into the public directory, and then import it using a regular link reference in the head element in app/client/main.html.  

The scripts have been updated so you hopefully won't have any problems. 

At this same time, we updated Semantic UI to from 2.2.6 to 2.3.1.

## How to develop RadGrad theme adjustments?

Here's how we're currently developing the theme for RadGrad. It is based upon an interplay between the radgrad and semantic-ui repositories.

1. Create a branch in both the radgrad and semantic-ui repositories for your theme development work.  

2. Start in the semantic-ui repository. Make changes to the various semantic-ui site/ files and run `gulp build` to create the theme.  Test your changes by editing and displaying the index.html file.

3. When you are ready to see how the theme looks in radgrad, run `install-dist.sh`, which builds the theme and copies it into (your branch) in the radgrad repo (which should be a sibling directory of the semantic-ui repo).

4. When you feel comfortable with your changes, sync both branches to GitHub. When you're really, really comfortable with your changes, merge your branches into master.  


