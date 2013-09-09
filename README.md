Sling Content Explorer
======================

As the name says, this is a "Content Explorer" for [Apache Sling][1].

Features (so far):
---
* Basic drill-down navigation
* Node creation via JSON import, file upload and "manual" definition
* Update operations on nodes and properties
* Node deletions
* Basic search using SQL2 queries 


Usage
---

- Start a recent enough Sling Launchpad - 6 is too old, 7-SNAPSHOT must be used
- Build and deploy the project using `mvn package sling:install`
- Navigate to http://localhost:8080/.edit.html

[1]: http://sling.apache.org/ "Apache Sling"
