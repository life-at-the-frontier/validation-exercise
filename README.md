# wardenProject2021
Repo for work related to the 2021 summer project related to the Life at the Frontiers project


[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBmcm9udGllcl9kYXRhW291dHNpZGUgZnJvbnRpZXIgZGF0YV1cbiAgICBtYWtlRmlsZTAxW21ha2VGaWxlMDEgZXh0cmFjdCBmcm9udGllcnNdXG4gICAgZnJvbnRpZXJfZGF0YSAtLi0-IHxyZWFkIGlufG1ha2VGaWxlMDFcbiAgICBtYWtlRmlsZTAxIC0tPiAwMVxuXG4gICAgc3ViZ3JhcGggbWFrZU1hcHNcbiAgICAwMVswMSBtYXAgZGF0YV1cbiAgICAwMlswMiBtYWtlIGFsbCBtYXBdXG4gICAgMDEgLS0-IDAyXG4gICAgMDIgLS4tPiB8bWFudWFsbHkgZXhwb3J0fCAwMm91dFttYXAgcGFpcnMuaHRtbF1cbiAgICBlbmRcbiAgICBzdWJncmFwaCByYW5kb21pc2VcbiAgICAwM1swMyByYW5kb21pc2Ugb3JkZXJdXG4gICAgMDRbMDQgb3V0cHV0IG1hcHNdIFxuICAgIDAzIC0uLT4gfG1hcCBvcmRlci5yZHN8IDA0XG4gICAgMDJvdXQgLS4tPiAwNFxuICAgIGVuZFxuXG4iLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlLCJhdXRvU3luYyI6dHJ1ZSwidXBkYXRlRGlhZ3JhbSI6ZmFsc2V9)](https://mermaid-js.github.io/mermaid-live-editor/edit##eyJjb2RlIjoiZ3JhcGggXG4gICAgZnJvbnRpZXJfZGF0YVtvdXRzaWRlIGZyb250aWVyIGRhdGFdXG4gICAgbWFrZUZpbGUwMVttYWtlRmlsZTAxIGV4dHJhY3QgZnJvbnRpZXJzXVxuICAgIGZyb250aWVyX2RhdGEgLS4tPiB8cmVhZCBpbnxtYWtlRmlsZTAxXG4gICAgbWFrZUZpbGUwMSAtLT4gMDFcblxuICAgIHN1YmdyYXBoIG1ha2VNYXBzXG4gICAgMDFbMDEgbWFwIGRhdGFdXG4gICAgMDJbMDIgbWFrZSBhbGwgbWFwXVxuICAgIDAxIC0tPiAwMlxuICAgIDAyIC0uLT4gfG1hbnVhbGx5IGV4cG9ydHwgMDJvdXRbbWFwIHBhaXJzLmh0bWxdXG4gICAgZW5kXG4gICAgc3ViZ3JhcGggcmFuZG9taXNlXG4gICAgMDNbMDMgcmFuZG9taXNlIG9yZGVyXVxuICAgIDA0WzA0IG91dHB1dCBtYXBzXSBcbiAgICAwMyAtLi0-IHxtYXAgb3JkZXIucmRzfCAwNFxuICAgIDAyb3V0IC0uLT4gMDRcbiAgICBlbmRcblxuIiwibWVybWFpZCI6IntcbiAgXCJ0aGVtZVwiOiBcImRlZmF1bHRcIlxufSIsInVwZGF0ZUVkaXRvciI6ZmFsc2UsImF1dG9TeW5jIjp0cnVlLCJ1cGRhdGVEaWFncmFtIjpmYWxzZX0)
# Intro
This code produces maps for sharp boundaries (or social frontiers) for a validation exercise. 

Trials of maps and important old code are tagged as archive/[branchname]. In case, they need to be checked out.

# Folders

- data: place to put local data -- not to be committed
- cleaned data: place to put cleaned local data that we can back up
- output maps: place where the maps are generated and saved incld. order file
- docs: place to put write ups


# data source
Frontiers are generated from measureFrontiers 04 UK script in nordF repo. Used in makeFile01

## misc

code for code map
```
graph TD
    frontier_data[outside frontier data]
    makeFile01[makeFile01 extract frontiers]
    frontier_data -.-> |read in|makeFile01
    makeFile01 --> 01

    subgraph makeMaps
    01[01 map data]
    02[02 make all map]
    01 --> 02
    02 -.-> |manually export| 02out[map pairs.html]
    end
    subgraph randomise
    03[03 randomise order]
    04[04 output maps] 
    03 -.-> |map order.rds| 04
    02out -.-> 04
    end


```