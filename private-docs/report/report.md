---
output: word_document
bibliography: assets/report-bib.bib
csl: assets/plos-one.csl
---

# Using residents and experts to evaluate the validity of a border detection algorithm: a small-scale feasibility study

Meng Le Zhang$^1$$^*$, Aneta Piekut, Zaneb Rasool, Lydia Warden, Henry Staples and Gwilym Pryce

[1]
[2]

* Corresponding Author
Email: meng_le.zhang@sheffield.ac.uk (MZ)

-----

# Using residents and experts to evaluate the validity of a border detection algorithm: a small-scale feasibility study

Full title: Using residents and experts to evaluate the validity of a border detection algorithm: a small-scale feasibility study


Authors: Meng Le Zhang, Aneta Piekut, Zaneeb Rasool, Lydia Warden, and Gwilym Pryce
Versions:
- Revised with real results - 23 Aug 2022
- Original- 29 July 2021

Study preregistration: https://osf.io/yzw8u/ (29/07/2021)

# Introduction

A number of studies have used computer algorithms with areal-level data to detect community borders. One such study @deanFrontiersResidentialSegregation2019 uses a statistical model to detect sharp community boundaries, referred to as social frontiers. However, to date, none of these studies has validated the accuracy of their algorithms externally using human participants or other means. Therefore, the evidence base for the usefulness of these algorithms for policy, researchers and the public has not been developed yet. Data and algorithmic issues could lead to i) misleading inferential results using these borders and ii) misinformation once the results of these algorithms are made available to the public and policymakers.

This current study uses local residents and experts in Rotherham, England to test the validity of social frontiers producted by a border detection algorithm. The sharpness of a boundary is defined by the difference in the proportion of foreign-born residents across two adjacent areas (after accounting for spatial autocorrelation and population size). All else being equal, larger differences lead to sharper boundaries and we expect sharper borders are more likely to correspond to potential communities boundaries. We used the algorithm to find three maps: map A had the sharpest borders, C had the least sharp borders and B had borders that were in between. Participants were shown several pairs of maps and asked which map in each pair best corresponds to the local community borders. We found that participants overwhelmingly tend to choose the set of borders with a high degree of sharpness however there is limited evidence that participants would choose medium borders over low sharpness borders. Due to implementation issues, we did not achieve the desired sample size set out in our protocol. We discuss limitations and directions for future research. The study was pre-registered @zhangDiscreteChoiceExperiment.

## Literature review

The existence of a boundary between two communities could lead to several positive or negative outcomes. Past studies in Northern Ireland, where a concept of “interface areas” was coined have demonstrated that frontiers are contested areas, “spaces where the terrain is marked in ways that reflect the specific claims of competing groups” (@leonardTeensTerritoryContested2006 p.227), of less frequent interaction resulting in poorer familiarity with each other @boalFrontierCityEthnonationalism1984, and as such, more likely to be sites of tensions and conflict. Because social forces represent wider social inequalities, including ethnic hierarchies, they are never settled and fixed, hence might provide “an excellent opportunity for mutual interpenetration and sway” (@kristof1959nature p.273). This dual nature of the frontiers comes in the results of quantitative geography studies. While Legewie and Schaeffer @legewieContestedBoundariesExplaining2016 study in New York, USA, revealed more neighbourhood tension when boundaries were blurred and and between-community boundaries less defines, but Dean et al. @deanFrontiersResidentialSegregation2019 found more crime closes to more steep frontiers in Sheffield, UK. However, when repeating the study in Czechia using Dean et al. method @deanFrontiersResidentialSegregation2019, Křížková et al. @krizkovaSocialFrontiersEstimating2021 did not found significant relationship between the location of frontiers and crime. Maguire, French, and O’Reilly @maguireResidentialSegregationDividing2016 did not used any boundary-detection algorithm, but found correlation between ‘peace lines’ and poorer mental health (higher depression and axiety).

Studies using algorithms to detect community boundaries have found that these boundaries are associated with more or less crime/ public disorder. Legewie and Schaeffer @legewieContestedBoundariesExplaining2016 use an edge detection algorithm from image processing whilst Dean et al. @deanFrontiersResidentialSegregation2019 chose borders based on a Bayesian statistical model. However, neither study validated their algorithm nor described how they picked most of the tuning parameters in their model.


## Rationale for a trial
The need for external validation of the results of algorithms is well accepted in fields like machine learning. Similarly, the validation of measurement instruments is commonplace in psychology. The lack of external validation leads to misleading results as well as a range of scientific issues ranging from measurement error to fundamental scientific issues such as a lack of testable hypotheses. This trial will establish an evidence base for the external validity of these detection algorithms starting with the sharp border detection algorithm in Dean et al. @deanFrontiersResidentialSegregation2019. The measure of sharpness is based on the proportion of foreign-born residents on either side of a border in 2011. Sharper borders are theorised to indicate the location of strong community borders or social frontiers.

The main claim behind boundary detection studies is that these boundaries can be detected using secondary data analysis (@legewieContestedBoundariesExplaining2016, @deanFrontiersResidentialSegregation2019). The same studies will implicitly or explicitly claim that these community boundaries are at least noticeable to people in the local area. [insert list quotes].

If both claims are true, it should be possible for local residents to distinguish community boundaries, generated by boundary detection algorithms, from other types of boundaries (e.g. random noise). This is a testable hypothesis. Assuming the testing procedure is valid, if local residents cannot validate these boundaries (e.g. cannot distinguish generated boundaries from random noise) then one or both claims are false: either the generated boundaries are not accurate depictions or that community boundaries are unnoticeable to the local community (but somehow apparent to academics and computer untested algorithms).

# Objectives

_Primary objective_: Determine whether residents and experts perceive sharper borders (as determined by the algorithm) as indicative of more clearly defined community borders.

_Hypothesis_: The algorithm can predict which borders are more likely to be clearly defined community borders. The hypothesis is that participants will agree with the predictions of the algorithm.

_Secondary objective_: Determine the feasibility of this type of trial for future research.


# Research design

We use the boundaries detection algorithm to create three maps (A, B, and C) of the same geographical area. The maps are ranked in order of how much they reflect sharp community boundaries (according to the algorithm, A > B > C). The maps then form the basis of our validation exercise with human participants.

The study was originally designed to be a multi-site trial across six communities in the UK, Norway and Sweden. In each site, particiants would be recruited from experts and residents from the local community. Participants are given a discrete choice given a pair of maps (e.g. map A and B, C and B etc) and asked to pick which map represents more defined community borders. Each participant is given three pair sets to complete. The pair sequence shown to particiants (and the order of maps within each pair) are randomised. The exercise is conducted as part of a longer semi-structured qualitative interview. The exercise is given at either the beginning or end of the interview (depending on whether experts or residents).

For each map pair, there is agreement if participants choose the map with sharper boundaries (as defined by the algorithm, e.g. A over B). Our test statistic is the rate of agreement: under the null hypothesis the agreement rate is 50 percent.

Due to implementation issues, we were only able to collect data from one site: Rotherham, UK. This leads to less statistical power than anticipated in the original protocol (e.g. lower likelihood of rejecting the null hypothesis). A study protocol including analysis plan was created before data collection @zhangDiscreteChoiceExperiment.

# Methods

## Study setting

The study is carried out as part of a qualitative study with residents and experts living within areas with a high number of sharp community boundaries (as detected by the algorithm). A number of factors determined the choice of areas. First, each city was chosen due to their higher than average degree of segregation, the proportion of foreign-born residents, and the research team's prior links and collaborations. Rotherham – a town in South Yorkshire was selected as a case study on the basis of literature and conversations with local stakeholders. As of 2011 Census, 92% Rotherham population was White British; it has a substantial settled British Pakistani population and more recent, i.e. post-2004 EU extension immigration from Eastern Europe. We decided on the final boundaries of the studied areas after producing maps with social frontiers for Rotherham West (based on 2011 Census data – add footnote?). Author MZ gave AP a map of social frontiers in each city. Finally, AP and expert ZR chose an area in Rotherham with an above-average number of defined community borders. The maps used in the trial are centred on the middle of these areas and show border information within a 1.5km radius.

## Eligibility criteria

Participants fall under three different groups.
- Local experts (adults, 18+) recruited among local community workers, housing associations, advocacy groups, third sector organisations, and various agencies involved in the support and integration of migrant communities in each selected case study area.
- Residents (adults, 18+) for individual interviews will be residents of the case study area who live in the vicinity and on different sides of the identified social frontier. We will invite residents living 1 km radius from the frontier, who have lived in the area for at least a year.
- [REVISE] Focus groups interviews will be conducted with young people aged 18-25 who have lived in the vicinity and on different sides of the identified social frontier for at least a year.


## Recruitment
Local experts for expert interviews were recruited via our local contacts in Rotherham, identified by desk research and by snowball sampling (i.e. further contacts gained from initial interviews).

- Residents of two selected areas. We will ask each expert to point us to any community webpages, groups or centres which are most suitable to recruit participants. We will create a leaflet with information about the research to be distributed via identified channels, online and offline, and interested participants can come back to us via email and telephone.

Group interviews participants were recruited via our local contacts in Rotherham (RCUST).

Table 1. Summary of socio-demographic profile of respondents
[insert]


## Validation task

After a preliminary task to familiarise participants with the map interface, where participants are shown pairs of interactive maps with borders (Map A and Map B). Participants are asked to choose which map better represents distinct community boundaries in terms of migration background in the selected area.

Pilot exercises were conducted before deployment, and the entire validation exercise takes under 10 minutes to complete. We will checked that all the maps are similar with respect attributes (e.g. total border lengths) to omit alternative explanations (see supplementary materials). The pair of interactive maps are synced so scrolling and moving Map A also moved the area viewed in Map B.


**Intervention**

We wish to test if social frontiers produced by the Dean et al. routine are more plausible than those produced by an alternative algorithm such as sampling borders at random. Since the interview team chose the area selected for the qualitative interviews based on having social frontiers, a simple random selection of borders will contain many sharp borders by chance. Furthermore, the interview team has already seen a map of social frontiers, which will affect the possibility of having a double-blind.

To address these issues, we designed an exercie that made it difficult for the interview team to detect the 'correct' map whilst also allowing inferences to be made.

For borders in the target area, we calculate a measure of sharpness based on the absolute difference in the proportion of foreign-born in LSOAs on each side of the border (the true measure is more complicated @deanFrontiersResidentialSegregation2019). We then standardise this measure and denote it as $\Phi$ where large values indicate sharper boundaries. $\Phi$ is the basis of Dean et al.'s algorithm: any border with a value of $\Phi > 1.96$ was considered substantial and likely to be a social frontier.

Then we group borders into tertiles and create three maps; where map A contains the sharpest set of borders (highest tertile), map B contains the middle tertile and Map C contains the lowest tertile. The maps are shown in figure [!XX].

![](assets/fig-maps.png)

 We then compare maps from each tertile against each other in pairs:

- A and B (pair 1)
- A and C (pair 2)
- B and C (pair 3)


For each pair, we measure the proportion of participants who prefer the map with the sharpest borders (i.e. map A in pair 1). If the algorithm produces meaningless borders (i.e. the null hypothesis) then the choice of preferred map will be random.

We will check that all the maps are similar with respect attributes (e.g. total border lengths) to omit alternative explanations. The pair of interactive maps are synced so scrolling and moving Map A also moved the area viewed in Map B.

The maps are created in R and exported as leaflet maps within html files. The code to recreate the maps are found at: https://github.com/MengLeZhang/wardenProject2021.


**Allocation**
All participants will be shown all three pairs of maps after an initial preliminary task. The order of maps and the sequence of pairs is chosen at random by the statistical software R.

**Concealment mechanism and blinding**
The order and sequence is saved onto a file and not shown to the any member of the research team until the data has been collected. The interview team was blind to the order/sequence until after data collection. The participants and the interview team were unaware of how the maps in the exercise have been generated.

## Outcomes
The main outcome are the preferred maps chosen by each participant. This is recorded by the interview team along (with the entire semi-structured interview). Metadata about the exercise (e.g. how long participants spent on each task) was also recorded. Data about the random ordering of the exercise is automatically generated and saved using R.

## Sample size
The validation exercise was created as an add-on to a longer qualitative interview. Therefore, the sample size determined by the qualitative research design. In the protocol, the original sample was composed of respondents from six sites. The final sample consists of 31 participants from Rotherham, England. We are left with 30 participatns after eliminating ineligible responses (i.e. respondents who did not complete the preliminary exercise).


## Data collection and statistical analysis

_Collection and management_: Trial results data were the interview team (AP, ZR) and entered into a spreadsheet. The interview team checked a subset of results against the interview recordings for accuracy. We plan to collect basic demographic information on participants in the residents interview [!Aneta did we?].

_Statistical analysis_: There are three sets of map pairs. For each pair, we measure the agreement rate: proportion of participants who prefer the map with the sharpest borders. We wil refer this rate as $P_j$ where $j$ denotes map pairing. We calculate $Z_j$ where $Z_j =  P_{j} - 0.5$. Under the null hypothesis, $Z_j$ will be approximately normally distributed with a mean of 0 and standard error of $\sqrt{0.25 / n}$ (given our sample size is large enough, n > 25). We use this distribution to calculate our $p$ values with $p < 0.05$ as our threshold for statistical significance. With our final sample, for each map pair, agreement rates higher than 69.6% (or lower than 30.4%) are statistically significant ($p < 0.05$). We can also calulate the overall agreement rate across all map pairs (i.e. mean of $Z_j$).

Missing data, including item non-response (e.g. skipping pairs), will be omitted. We will test the effect of item non-response by using partial identification to calculate the lower and upper bounds for the agreement rate (e.g. non-responders are always agree or disagree).

We conduct additional tests for sequencing, ordering, and better agreement over time. Sequencing tests for whether participant engagement wanes during the exercises due to distractions or boredom (which will reduce the agreement rate). If engagement does not wane then the sequence that which pairs are shown should not affect agreement (e.g. pair 1 should not have a higher amount of agreement than pair 3). Ordering tests whether participants are more or less likely to pick the left map in a pair: this may suggest that participants want to complete the exercise quickly (e.g. lack of engagement). Under the null hypothesis, the chance of participants picking the left map is equal to the chance that the left map contains the 'correct' response. Finally we test whether agreement rates change over time. Higher agreement rate for later participants suggests that the interview team may be nudging participants towards 'correct' response (despite our attempt to blind the interview team). Since the order of participation is not random, this test could also reflect changes over time in participation (e.g. expert interviews occurred first, later participant may be less willing).

## Ethics and consent

We will sent participant information sheets well before the interviews (either via email or traditional post), so participants will have time to read them and ask questions. Consent for online interviews with experts will be given in through ticking a box on a Google Form. From experience in our past research conducted during the Covid-19 pandemic, we know that some participants find it difficult to add a signature to an online document. It will be a strict prerequisite for interviews to take place, and interviews will only proceed once consent has been established. Participants will be sent a digital copy of a consent form. For individual and group interviews, we will use either an online, Google Form consent or a printed / paper consent form (depending on what kind of interview will occur). Information about research will be distributed through identified via experts local community pages, emails (if participants approach us to take part in research via their email), and consent will be given either online or by signing a consent form. Participants will be sent a digital copy or given a paper copy, depending on the type of consent form they will sign.

Each participant of the individual and group interview will be offered a £25 shopping voucher in recognition of their time. The vouchers can be sent in a digital form if any interview happens online, sent to a home address or handed in person. Receipts will be collected in a digital or paper form, respectively. There will be no incentives for expert interviews.

In the context of the pandemic, many interview participants constitute a potentially vulnerable group given the increased risk of exposure to coronavirus, which might intersect with precarious professional and personal circumstances. With this in mind, the fieldwork will be informed by project partners, including community and migrant organisations with experience of supporting migrants in vulnerable situations (RCUST in Rotherham and the North West Migrants Forum in Derry, via Maeve O'Brien).

Participants could find parts of the interview distressing, e.g. emotionally sensitive issues such as migration status, place attachment and/or stigma, local conflicts, anxieties related to Brexit, or experiences of discrimination. This will be mitigated by sensitive interviewing, creating a supportive and relaxed interview experience, appropriate signposting and the right to withdraw from the study. Online interviews, where body language and non-verbal cues are harder to read, will also be informed by insights from project partners with experience of supporting migrants.

In addition, the presence of others (co-workers, family members) in the room during the interview might impact the conversation. To meet these challenges, the interviewer will inform the participants that the interview can be paused at any time and ask participants to, if possible, find a private space.

## Project timelines

Recruitment of participants for the qualitative interviews began in XXX. The validation exercise design and materials were created between June and August 2021.  Ethical approval from the University of Sheffield was secured on 30th July 2021. The interviews for Rotherham took place between September 2021 and the end of September 2022.


# Results

The agreement rates for each map pair are: 96.7% (p < 0.001, A vs B), 96.7% (p < 0.001, A vs C) and 60% (p = 0.20, B vs C).  We can reject the null hypothesis that participants do not recognise borders with high sharpness as more distinct community borders. However, we cannot reject the null hypothesis that participants recognise medium borders as more distinct community borders compared to low borders.

Testing the robustness of our study, we do not find any statistically significant sequencing effects (fisher exact test, p = 0.667); ordering effects (fisher exact test, p = 0.570); or changes in agreement rate over time (p = 0.384). Our robustness tests combines responses from all map pairs. All our results tables are included in the supplementary materials.

From the qualitative interviews, we do not find any evidence of inattention amongst participants. [Add how the interviewee felt]. The exercise was designed to be completed within 10 minutes, however participants completed the exercise quickers than ancitipated.

# Discussion

To our knowledge, experiments in Urban Studies and Human Geography are rare and this is one of a few studies to empirically test the validity of border detection algorithms. The magnitude of the effect size was far larger than we anticipated (96.7% agreement rate) and the completion time for the exercise was shorter than anticipated.

The study does have a number of limitations. The sample size is much smaller than initially anticipated which limits our ability to detect smaller effect sizes. Although we do not find any issues with the robustness of the study design, this does not mean issues are not present. Finally, even if they are not validated by residents, frontier may be valid for other purposes (e.g. prediction of crime hotspots). However, there is no evidence for the effiacy of frontiers for other purposes and is outside the scope of the current study.

Further work can be done to scale up the validation exercise in order to detect smaller differences in agreement rates especially given the faster than anticipated completion times. Furthermore, the same research design can be used to establish the validity of different border detection algorithm against each other.

# Conclusions

Recap


## Declaration of interests
AP and GP are co-authors on the Dean et al. (2019) paper. We have a collaboration contract with Rotherham United Community Sports Trust (RUCUST) as a vendor. ZR works as a community manager at RUCUST.


## Data access
We intend to anonymise and share the final results data after an embargo period. The code to replicate the research materials, writeup, and statistical analysis can be found at: https://github.com/MengLeZhang/wardenProject2021. Through GitHub, other researchers can check changes made to the code and materials.

## Author's contributions

MZ originally conceived the validation study. AI (Aarti Iyer) and AP designed the qualitative interviews, sampling design and the recruitment of participants. AP, ZR and MO will conduct the interviews. LW and MZ created the research materials for the exercise. MZ, AP and LW are responsible for the write up of the study protocol and results. MZ provides statistical expertise and primary data analysis. AP and GP are grant holders.

## Funding

This study is funded by Nordforsk as part of the life at the frontiers project (project number 95193). For more details, see [here](https://www.nordforsk.org/projects/life-frontier-impact-social-frontiers-social-mobility-and-integration-migrants). LW's time on the study is funded by Sheffield University.


----

# Supplementary materials

# Research materials
## Preliminary exercise

[screenshot]

## Validation exercise

[screenshot]

## Map attributes

[table here]


# Result tables

````

# Agreement

realPair     n agreeN agreeRate     se       p.value
        1    30     29     0.967 0.0913 0.00000000186
        2    30     29     0.967 0.0913 0.00000000186
        3    30     18     0.6   0.0913 0.200

# Sequence

seenOrder agreeN disagreeN agreeRate
1         1     27         3     0.9
2         2     24         6     0.8
3         3     25         5     0.833

Fisher's Exact Test for Count Data

p-value = 0.6673
alternative hypothesis: two.sided

# order

Choice of map position
1  2
44 46

mapA_position agreeN disagreeN
        <dbl>  <int>     <int>
             1     36         8
             2     40         6
Fisher's Exact Test for Count Data

  data:  .
  p-value = 0.5693
  alternative hypothesis: true odds ratio is not equal to 1
  95 percent confidence interval:
  0.1756629 2.4746366

# over tinme

splitTime    agreeN disagreeN
<fct>         <int>     <int>
1 (0.971,15.5]     40         5
2 (15.5,30]        36         9

Fisher's Exact Test for Count Data

data:  .
p-value = 0.3837


````

---

# References
