# Validation exercise for Social frontiers
Repo for work related to the 2021 summer project related to the Life at the Frontiers project

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBmcm9udGllcl9kYXRhW291dHNpZGUgZnJvbnRpZXIgZGF0YV1cbiAgICBtYWtlRmlsZTAxW21ha2VGaWxlMDEgZXh0cmFjdCBmcm9udGllcnNdXG4gICAgZnJvbnRpZXJfZGF0YSAtLi0-IHxyZWFkIGlufG1ha2VGaWxlMDFcbiAgICBtYWtlRmlsZTAxIC0tPiAwMVxuXG4gICAgc3ViZ3JhcGggbWFrZU1hcHNcbiAgICAwMVswMSBtYXAgZGF0YV1cbiAgICAwMlswMiBtYWtlIGFsbCBtYXBdXG4gICAgMDEgLS0-IDAyXG4gICAgMDIgLS4tPiB8bWFudWFsbHkgZXhwb3J0IC5odG1sfCAwMm91dFttYXAgcGFpcnMuaHRtbF1cbiAgICAwMm91dCAtLi0-IHxlZGl0IGh0bWwgZGlyZWN0bHl8aHRtbDAxW0VkaXQgaHRtbF1cbiAgICBlbmRcbiAgICBzdWJncmFwaCByYW5kb21pc2VcbiAgICAwM1swMyByYW5kb21pc2Ugb3JkZXJdXG4gICAgMDRbMDQgb3V0cHV0IG1hcHNdIFxuICAgIDAzIC0uLT4gfG1hcCBvcmRlci5yZHN8IDA0XG4gICAgaHRtbDAxIC0uLT4gfHh4LWNsZWFuLmh0bWx8MDRcbiAgICBlbmRcbiAgICBodG1sMDJbdGlwIHNuaXBwZXQuaHRtbF1cbiAgICBodG1sMDIgLS4tPiB8YWRkIGNvbnRlbnQgdG98aHRtbDAxXG4gICAgcm1kMDFbcHJlbGltaW5hcnkgdGFzay5ybWRdXG4gICAgcm1kMDEgLS4tPiBodG1sMDFcbiIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2UsImF1dG9TeW5jIjp0cnVlLCJ1cGRhdGVEaWFncmFtIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/edit##eyJjb2RlIjoiZ3JhcGggVERcbiAgICBmcm9udGllcl9kYXRhW291dHNpZGUgZnJvbnRpZXIgZGF0YV1cbiAgICBtYWtlRmlsZTAxW21ha2VGaWxlMDEgZXh0cmFjdCBmcm9udGllcnNdXG4gICAgZnJvbnRpZXJfZGF0YSAtLi0-IHxyZWFkIGlufG1ha2VGaWxlMDFcbiAgICBtYWtlRmlsZTAxIC0tPiAwMVxuXG4gICAgc3ViZ3JhcGggbWFrZU1hcHNcbiAgICAwMVswMSBtYXAgZGF0YV1cbiAgICAwMlswMiBtYWtlIGFsbCBtYXBdXG4gICAgMDEgLS0-IDAyXG4gICAgMDIgLS4tPiB8bWFudWFsbHkgZXhwb3J0IC5odG1sfCAwMm91dFttYXAgcGFpcnMuaHRtbF1cbiAgICAwMm91dCAtLi0-IHxlZGl0IGh0bWwgZGlyZWN0bHl8aHRtbDAxW0VkaXQgaHRtbF1cbiAgICBlbmRcbiAgICBzdWJncmFwaCByYW5kb21pc2VcbiAgICAwM1swMyByYW5kb21pc2Ugb3JkZXJdXG4gICAgMDRbMDQgb3V0cHV0IG1hcHNdIFxuICAgIDAzIC0uLT4gfG1hcCBvcmRlci5yZHN8IDA0XG4gICAgaHRtbDAxIC0uLT4gfHh4LWNsZWFuLmh0bWx8MDRcbiAgICBlbmRcbiAgICBodG1sMDJbdGlwIHNuaXBwZXQuaHRtbF1cbiAgICBodG1sMDIgLS4tPiB8YWRkIGNvbnRlbnQgdG98aHRtbDAxXG4gICAgcm1kMDFbcHJlbGltaW5hcnkgdGFzay5ybWRdXG4gICAgcm1kMDEgLS4tPiBodG1sMFxuIiwibWVybWFpZCI6IntcbiAgXCJ0aGVtZVwiOiBcImRlZmF1bHRcIlxufSIsInVwZGF0ZUVkaXRvciI6ZmFsc2UsImF1dG9TeW5jIjp0cnVlLCJ1cGRhdGVEaWFncmFtIjpmYWxzZX0)

# Intro
This code produces maps for sharp boundaries (or social frontiers) for a validation exercise.

Trials of maps and important old code are tagged as archive/[branchname]. In case, they need to be checked out.

# Folders

- data: place to put local data -- not to be committed
- cleaned data: place to put cleaned local data that we can back up
- output pair alternatives: location of html files with map to be randomised
- output maps: place where the maps are generated and saved incld. order file
- docs: place to put write ups



# data source

Data used for making maps are in the /cleaned data folder. The raw frontiers are generated from measureFrontiers 04 UK script in nordF repo. Used in makeFile[0x] (i.e. 01 for Sheffield)



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
    02 -.-> |manually export .html| 02out[map pairs.html]
    02out -.-> |edit html directly|html01[Edit html]
    end
    subgraph randomise
    03[03 randomise order]
    04[04 output maps]
    03 -.-> |map order.rds| 04
    html01 -.-> |xx-clean.html|04
    end
    html02[tip snippet.html]
    html02 -.-> |add content to|html01
    rmd01[preliminary task.rmd]
    rmd01 -.-> html01



```
