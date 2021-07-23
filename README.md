# wardenProject2021
Repo for work related to the 2021 student summer project related to the Life at the Frontiers project



[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggTFJcbiAgICBmcm9udGllcl9kYXRhW291dHNpZGUgZnJvbnRpZXIgZGF0YV1cbiAgICBtYWtlRmlsZTAxW21ha2VGaWxlMDEgZXh0cmFjdCBmcm9udGllcnNdXG4gICAgZnJvbnRpZXJfZGF0YSAtLi0-IHxyZWFkIGlufG1ha2VGaWxlMDFcbiAgICBtYWtlRmlsZTAxIC0tPiAwMVxuXG4gICAgc3ViZ3JhcGggcmFuZG9taXNlLW1hcHMgXG4gICAgMDFbMDEgZ2V0IG1hcCBkYXRhXVxuICAgIDAyWzAyIG1hcHMgKyByYW5kb21pc2UgKyByZW5kZXIgcm1kXVxuICAgIDAxIC0tPiAwMlxuICAgIGVuZFxuICAgIHN1YmdyYXBoIC9vdXRwdXQtbWFwc1xuICAgIDAyIC0uLT58cmVuZGVyc3xyZW5kZXJQYWlyMS5SbWRcbiAgICAwMiAtLi0-fHJlbmRlcnN8cmVuZGVyUGFpcjIuUm1kXG4gICAgMDIgLS4tPnxyZW5kZXJzfHJlbmRlclBhaXIzLlJtZFxuICAgIDAyIC0uLT58b3V0cHV0c3xvcmRlckZpbGVbbWFwIG9yZGVyLmNzdl1cbiAgICBlbmRcblxuIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZSwiYXV0b1N5bmMiOnRydWUsInVwZGF0ZURpYWdyYW0iOmZhbHNlfQ)](https://mermaid-js.github.io/mermaid-live-editor/edit##eyJjb2RlIjoiZ3JhcGggVERcbiAgICBBW0NocmlzdG1hc10gLS0-fEdldCBtb25leXwgQihHbyBzaG9wcGluZylcbiAgICBCIC0tPiBDe0xldCBtZSB0aGlua31cbiAgICBDIC0tPnxPbmV8IERbTGFwdG9wXVxuICAgIEMgLS0-fFR3b3wgRVtpUGhvbmVdXG4gICAgQyAtLT58VGhyZWV8IEZbZmE6ZmEtY2FyIENhcl0iLCJtZXJtYWlkIjoie1xuICBcInRoZW1lXCI6IFwiZGVmYXVsdFwiXG59IiwidXBkYXRlRWRpdG9yIjpmYWxzZSwiYXV0b1N5bmMiOnRydWUsInVwZGF0ZURpYWdyYW0iOmZhbHNlfQ)

# Intro
This code produces maps for sharp boundaries (or social frontiers) for a validation exercise. 

Trials of maps and important old code are tagged as archive/[branchname]. In case, they need to be checkedout.

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
graph LR
    frontier_data[outside frontier data]
    makeFile01[makeFile01 extract frontiers]
    frontier_data -.-> |read in|makeFile01
    makeFile01 --> 01

    subgraph randomise-maps 
    01[01 get map data]
    02[02 maps + randomise + render rmd]
    01 --> 02
    end
    subgraph /output-maps
    02 -.->|renders|renderPair1.Rmd
    02 -.->|renders|renderPair2.Rmd
    02 -.->|renders|renderPair3.Rmd
    02 -.->|outputs|orderFile[map order.csv]
    end

```