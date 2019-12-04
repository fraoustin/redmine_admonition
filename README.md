# Redmine Admonition Plugin

From idea https://github.com/dseifert/redmine_wiki_notes

## Plugin installation

1. Copy the plugin directory into the vendor/plugins directory
2. Restart Redmine

with a Dockerfile

```
   FROM redmine
   WORKDIR /usr/src/redmine/plugins
   RUN git clone https://github.com/fraoustin/redmine_admonition.git
   WORKDIR /usr/src/redmine/
```
 

## Usage

The following macros are added:

* note
* info
* warning
* alert

which can be used in one of three ways:

```
   {{note(text with *wiki formatting*)}}

   {{note
   Alternately, you can put blocks of *wiki-formatted* text here.
   }}

   {{note(Or if you really want)
   You can do both...
   }}
```
 
This displays a block in the wiki page with a corresponding
icon and the specified text.

## License

This plugin is released under the GPLv2.
