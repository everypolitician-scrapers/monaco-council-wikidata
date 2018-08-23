#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

sparq = <<~SPARQL
  SELECT DISTINCT ?item WHERE {
    ?item p:P39 [ ps:P39 wd:Q21328626 ; pq:P2937 ?term ] .
    ?term wdt:P571 ?term_start FILTER(YEAR(?term_start) >= 2008)
  }
SPARQL

ids = EveryPolitician::Wikidata.sparql(sparq)
EveryPolitician::Wikidata.scrape_wikidata(ids: ids)
