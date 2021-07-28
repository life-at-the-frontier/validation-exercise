# Using residents and experts validate a border detection algorithm
Full title:  A discrete choice experiment using residents and experts in Rotherham to evaluate the validity of a border detection algorithm.

Authors: Meng Le Zhang, Lydia Warden, Aneta Piekut, Zaneeb Rasool, Gwilym Pryce
Versions:
- Original- 26 July 2021

Note: Based on SPIRIT checklist here (https://www.spirit-statement.org/about-spirit/).

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Using local residents and experts validate a border detection algorithm](#using-local-residents-and-experts-validate-a-border-detection-algorithm)
- [Introduction](#introduction)
- [Methods](#methods)
	- [Participants, interventions and outcomes](#participants-interventions-and-outcomes)
	- [Evaluation criteria](#evaluation-criteria)
	- [outcomes](#outcomes)
	- [participant timeline](#participant-timeline)
	- [sample size](#sample-size)
	- [recruitment](#recruitment)
	- [Assignment of interventions](#assignment-of-interventions)
	- [Study setting](#study-setting)
	- [Monitoring](#monitoring)
- [Ethics and Dissemination](#ethics-and-dissemination)
- [Appendices](#appendices)
	- [Author's contributions](#authors-contributions)
	- [Funding](#funding)

<!-- /TOC -->


# Introduction

_Background_: A small number of studies have used computer algorithms with areal-level data to detect community borders. One such study by Dean et al. uses a statistical model to detect sharp community boundaries, referred to as social frontiers. However, to date, none of these studies has validated the accuracy of their algorithms externally using human participants or other means. Therefore evidence base for the usefulness of these algorithms for policy and researchers has not been developed yet. Furthermore, data and algorithmic issues could lead to i) misleading inferential results using these borders and ii) misinformation once the results of these algorithms are made available to the public and policymakers.

_Existing literature_: The existence of a boundary between two communities could lead to several positive or negative outcomes. Studies using algorithms to detect community boundaries have found that these boundaries are associated with more or less crime/ public disorder. Legewie and Schaeffer (@2016) use an edge detection algorithm from image processing whilst Dean et al. (@2019) chose borders based on a Bayesian statistical model. However, neither study validated their algorithm nor described how they picked most of the tuning parameters in their model.

_Need for a trial_: The need for external validation of the results of algorithms is well accepted in fields like machine learning. Similarly, the validation of measurement instruments is commonplace in psychology. The lack of external validation leads to misleading results as well as a range of scientific issues ranging from measurement error to fundamental scientific issues such as a lack of falsifiability. This trial will establish an evidence base for the external validity of these detection algorithms starting with the sharp border detection algorithm in Dean et al. (@2019). The measure of sharpness is based on the proportion of foreign-born residents on either side of a border in 2011. Sharper borders are theorised to indicate the location of strong community borders or social frontiers.

**Objectives**

_Primary objective_: Determine whether residents and experts perceive sharper borders (as determined by the algorithm) as indicative of more clearly defined community borders.

_Secondary objective_: Determine the feasibility of this type of trial for future research.


**Trial design** A discrete choice experiment where participants are given a pair of maps and asked to pick which map represents more defined community borders. Each participant is given three pair sets to complete. All maps cover the same geographical area. The pair sequence and the order of maps within each pair are randomised. The exercise is conducted as part of a longer semi-structured qualitative interview. The exercise is given at either the beginning or end of the interview (depending on whether experts or residents).


# Methods

## Participants, interventions and outcomes


_Study setting_: The study is carried out as part of online and face-to-face interviews with residents and experts living within areas with a high number of sharp community boundaries (as detected by the algorithm). Proposed areas are:
- Malborough, Rotherham, England
- [tbd], Derry, Northern Ireland
- 2 Sites [tbd], Norway
- 2 Sites [tbd], Sweden

The definition of a community does not match statistical boundaries. A number of factors determined the choice of areas. First, each city was chosen due to their higher than average degree of segregation, the proportion of foreign-born residents, and the research team's prior links and collaborations. Then, using the Dean et al. algorithm, MZ gave AP a map of social frontiers in each city. Finally, AP and expert ZR chose an area within each city with an above-average number of defined community borders.

The maps used in the trial are centred on the middle of these areas and show border information within a 1.5km radius.

_Eligibility criteria_: Participants fall under three different groups.
- Local experts (adults, 18+) will be recruited among local community workers, housing associations, advocacy groups, third sector organisations, and various agencies involved in the support and integration of migrant communities in each selected case study area.
- Residents (adults, 18+) for individual interviews will be residents of the case study area who live in the vicinity and on different sides of the identified social frontier. We will invite residents living 1 km radius from the frontier, who have lived in the area for at least a year.
- Focus groups interviews will be conducted with young people aged 18-25 who have lived in the vicinity and on different sides of the identified social frontier for at least a year.


_Intervention_: After a preliminary task to familiarise participants with the map interface, where participants are shown pairs of interactive maps with borders (Map A and Map B). Participants are asked to choose which map better represents distinct community borders in the selected area. The full description of the intervention and allocation mechanism is given in a separate document [here](#study-protocol-assignment.md).

Pilot exercises were conducted before deployment, and the entire validation exercise takes under 10 minutes to complete.

_Outcomes_: Participants choices will be recorded by the interview team. The entire semi-structured interview will also be recorded. It is possible to detail metadata about the exercise (e.g. how long participants spent on each task), but we do not have plans to process this data. Data about the random ordering of the exercise is automatically generated and saved using R.

_Participant timeline_: The exact timeline depends on the evolving COVID 19 situation in each country. The anticipated timeline for UK data collection is:

- Phase 1: Expert interviews (5 x 2 areas - July-August 2021) - online
- Phase 2: Individual interviews with residents (10-12 x 2 areas - August-October 2021) - face-to-face or online.
- Phase 3: Focus group interviews, FGIs (2 x 2 areas - November-December 2021) - face-to-face - focus group interviews with young people (aged 18-25) of each selected area; 4-5 participants in each group.



_Sample size_: The sample size was based on the qualitative research design. The sample is composed of respondents from six areas chosen across three countries (see below). Each selected area will have 15 participants involved in one-to-one interviews (five experts and ten residents). A simulation of 15 participants (e.g. one area only) shows that we would be able to detect a preference rate of 73% for map A over B (or vice versa) at the usual level of statistical significance ($p < 0.05$). There is potential to ask members of the group interviews to do the validation task individually.

![](assets/qual-table.png)

_Recruitment_:
- Local experts for expert interviews will be recruited via our local contacts in Rotherham and Derry, identified by desk research and by snowball sampling (i.e. further contacts gained from initial interviews).

- Residents of two selected areas. We will ask each expert to point us to any community webpages, groups or centres which are most suitable to recruit participants. We will create a leaflet with information about the research to be distributed via identified channels, online and offline, and interested participants can come back to us via email and telephone.

- Group interviews participants - will be recruited via our local contacts in Rotherham (RCUST) and Derry (i.e. The North West Migrants Forum).




## Assignment of interventions

Written in a seperate doc  [here](#study-protocol-assignment.md).

## Data collection

_Collection and management_: Trial results data will be collected by the interview team (AP, ZR) and entered into a spreadsheet. AP will check a subset of results against the interview recordings for accuracy. MZ will store data on local machines with a cloud backup.
[@Aneta] are we collecting any other data? e.g. demographic, age etc

_Statistical analysis_: Analysis of the primary outcome will use a linear regression model with cluster robust standard errors. A t-test of the regression parameters will constitute a test of our null hypothesis. Missing data, including item non-response (e.g. skipping pairs), will be omitted. The full details are contained [here](#study-protocol-assignment.md). The interview team is unaware of the exact details of the statistical analysis since it may reveal the allocation mechanism.


## Monitoring
The LATF steering group oversees all research within the LATF project.

# Ethics

_Consent_: For online interviews, we will send participant information sheets well before the interviews (either via email or traditional post), so participants will have time to read them and ask questions. We have prepared separate, tailored information for local experts and residents - see attached.

Consent for online interviews with experts will be given in through ticking a box on a Google Form. From experience in our past research conducted during the Covid-19 pandemic, we know that some participants find it difficult to add a signature to an online document. It will be a strict prerequisite for interviews to take place, and interviews will only proceed once consent has been established. Participants will be sent a digital copy of a consent form.

For individual and group interviews, we will use either an online, Google Form consent or a printed / paper consent form (depending on what kind of interview will occur). Information about research will be distributed through identified via experts local community pages, emails (if participants approach us to take part in research via their email), and consent will be given either online or by signing a consent form. Participants will be sent a digital copy or given a paper copy, depending on the type of consent form they will sign.

_Payment_: Yes. Each participant of the individual and group interview will be offered a £25 shopping voucher in recognition of their time. The vouchers can be sent in a digital form if any interview happens online, sent to a home address or handed in person. Receipts will be collected in a digital or paper form, respectively. There will be no incentives for expert interviews.

_Potential Harm_: In the context of the pandemic, many interview participants constitute a potentially vulnerable group given the increased risk of exposure to coronavirus, which might intersect with precarious professional and personal circumstances. With this in mind, the fieldwork will be informed by project partners, including community and migrant organisations with experience of supporting migrants in vulnerable situations (RCUST in Rotherham and the North West Migrants Forum in Derry, via Maeve O'Brien).

Participants could find parts of the interview distressing, e.g. emotionally sensitive issues such as migration status, place attachment and/or stigma, local conflicts, anxieties related to Brexit, or experiences of discrimination. This will be mitigated by sensitive interviewing, creating a supportive and relaxed interview experience, appropriate signposting and the right to withdraw from the study. Online interviews, where body language and non-verbal cues are harder to read, will also be informed by insights from project partners with experience of supporting migrants.

In addition, the presence of others (co-workers, family members) in the room during the interview might impact the conversation. To meet these challenges, the interviewer will inform the participants that the interview can be paused at any time and ask participants to, if possible, find a private space.

_Declaration of interests_: AP and GP are co-authors on the Dean et al. (2019) paper. We have a collaboration contract with Rotherham United Community Sports Trust (RUCUST) as a vendor. ZR works as a community manager at RUCUST.

_Access to data_: We intend to anonymise and share the final results data after an embargo period. The code to replicate the research materials, writeup, and statistical analysis can be found at: https://github.com/MengLeZhang/wardenProject2021. Through GitHub, other researchers can check changes made to the code and materials.

_Dissemination_: TBD


## Author's contributions

MZ originally conceived the validation study. AP and ZR designed the qualitative interviews, sampling design and the recruitment of participants. AP and ZR will conduct the interviews. LW and MZ created the research materials for the exercise. MZ, AP and LW are responsible for the write up of the study protocol and results. MZ provides statistical expertise and primary data analysis. AP and GP are grant holders.

## Funding

This study is funded by Nordforsk as part of the life at the frontiers project (project number 95193). For more details, see [here](https://www.nordforsk.org/projects/life-frontier-impact-social-frontiers-social-mobility-and-integration-migrants). LW's time on the study is funded by Sheffield University.

# References

Dean, Nema, Guanpeng Dong, Aneta Piekut, and Gwilym Pryce. 2019. ‘Frontiers in Residential Segregation: Understanding Neighbourhood Boundaries and Their Impacts’. Tijdschrift Voor Economische En Sociale Geografie 110 (3): 271–88. https://doi.org/10.1111/tesg.12316.

Legewie, Joscha, and Merlin Schaeffer. 2016. ‘Contested Boundaries: Explaining Where Ethnoracial Diversity Provokes Neighborhood Conflict’. American Journal of Sociology, 37.
