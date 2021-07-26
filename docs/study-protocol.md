# Using local residents and experts validate a border detection algorithm
Full title:  A discrete choice experiment using local residents and experts in Rotherham to evaluate the validity of a border detection algorithm.

Authors: Meng Le Zhang, Lydia Warden, Aneta Piekut, Gwilym Pryce
Date:
- Original- 26 July 2021

Note: Based on SPIRIT checklist

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

_Background_: A small number of studies have used computer algorithms with areal-level data to detect community borders. One such study by Dean et al. uses a statistical model to detect sharp community boundaries, referred to as social frontiers. However, to date, none of these studies has validated the accuracy of their algorithms externally using human participants or other means. Therefore evidence base for the usefulness of these algorithms for policy and researcher has not developed yet. Data and algorithmic issues could lead to i) misleading inferential results using these borders and ii) misinformation once the results of these algorithms are made available to the public and policy makers.

_Existing literature_: The existence of a boundary between two communities could lead to a number of positive or negative outcomes. Studies using algorithms to detect community boundaries have found that these boundaries are associated with more or less crime/ public disorder. Legewie and Schaeffer [@Legewie] use an edge detection algorithm from image processing whilst Dean et al [@Dean] chose borders based on a Bayesian statistical model. Neither study validated their algorithm and do not describe how they chose most of the tuning parameters in their model.

_Need for a trial_: The need for external validation of the results of algorithms is well accepted in fields like machine learning. Similarly, the validation of measurement instruments well accepted in psychology. The lack of external validation leads to misleading results as well as a range of scientific issues ranging from measurement error to fundamental scientific issues such as a lack of falsifiablity. This trial will start to establish an evidence base for the external validity of these detection algorithms starting with the sharp border detection algorithm in Dean et al [@Dean]. The measure of sharpness is based on the proportion of foreign born residents on either side of a border in 2011. Sharper borders are theorised to indicate the location of sharp community borders or social frontiers.

**Objectives**

_Primary objective_: Determine whether local residents and experts perceive sharper borders (as determined by the algorithm) as indicative of more clearly defined community borders.

_Secondary objective_: Determine the feasibility of this type of trial for future research.


**Trial design** A discrete choice experiment where participants are given a pair of maps and asked to pick which map represents more defined community borders. Each participant is given three [@TODO check this] pair sets to complete. All maps cover the same geographical area. The order of pairs shown and the order of maps within pairs is randomised. Due to limitations, there is a lack of double-blind. The exercise is conducted as part of a longer semi-structured qualitative interview. The exercise is given at either the beginning or end of the interview (depending on whether experts or local residents) [@TODO check this].

The experiment is a part of a series of semi-structured qualitative interviews with residents. For the qualitative interview, MZ gave the interview team a map of social frontiers in a city produced earlier in the research project. The team chose an area within each city with an above-average number of social frontiers and began sampling participants local to that area (or were connected to it). The primary goal of the sampling method was to maximise the quality of the qualitative data. This place some limitations on the experimental design.



# Methods

## Participants, interventions and outcomes


_Study setting_: The study is carried out as part of online and face-to-face interviews with local residents and experts living within areas with a high number of sharp community boundaries (as detected the algorithm). Proposed areas are:
- Masborough, Rotherham, England
- [tbd], Derry, Northern Ireland
- 2 Sites [tbd], Norway
- 2 Sites [tbd], Sweden

The definition of a community was discussed with experts not part of the trial. They do not match statistical boundaries. The choice of areas was determined by a number of factors. First, these cities were chosen due to their higher than average degree of segregation, proportion of foreign born residents, and the research team's prior links and collaborations. Then, using the Dean et al algorithm, MZ gave AP a map of social frontiers in each city. Finally AP and experts chose an area within each city with an above-average number of social frontiers and defined community borders.

The maps used in the trial are centred on the middle of these areas and show border information within a 1.5km radius.

_Eligibility criteria_: Participants have to be familiar with the selected within the city by either being a resident or a professional engaged in activity within that area. Participants had to have filled in an informed consent form.

_Intervention_: [@Todo omit for Aneta] After a preliminary task to familarise participants with the map interface, where participants are shown pairs of interactive maps with borders (Map A and Map B). Maps A and B have different degrees of sharpness as measured by the algorithm. Participants are asked to choose which map better represents distinct community borders in the selected area.

To produce the borders, we calculate a measure of sharpness based on the absolute difference in the proportion of foreign-born in LSOAs on each side of the border (the true measure is more complicated, see Dean et al. 20xx). We then standardise this measure and denote it as $\Phi$ where large values indicate sharper boundaries. $\Phi$ is the basis of Dean et al.'s algorithm: any border with a value of $\Phi > 1.96$ was considered substantial and likely to be a social frontier.

Then we group borders into quartiles, where quartile 1 $Q1$ are the sharpest and $Q4$ the least sharp. We then compare maps from one quartile group to another in the map pairing exercise.

We will check that all the maps are similar with respect attributes (e.g. total border lengths) to omit alternative explanations. The pair of interactive maps are synced so scrolling and moving Map A also moved the area viewed in Map B.

The maps are created in R and exported as leaflet maps within html files. The code to recreate the maps are found at: https://github.com/MengLeZhang/wardenProject2021.

_Outcomes_: Participants choices will be recorded. The entire semi-structured interview will also be recorded. It is possible to detail metadata about the exercise (e.g. how long participants spent on each task) but we do not have plans to process this data. Data about the random ordering of the exercise is automatically generated and saved using R.

_Participant timeline_: NA

_Sample size_: The sample size was based on the qualitative research design. The sample is composed of respondents from six areas chosen across three countries (see below). Each selected area will have 15 participants involved in one-to-one interviews (five experts and ten residents). A simulation of 15 participants (e.g. one area only) shows that we would be able to detect a preference rate of 73% for map A over B (or vice versa) at the usual level of statistics significance ($p < 0.05$). There is potential to ask members of the group interviews to individually do the validation task.

![](assets/qual-table.png)

_Recruitment_:


## Evaluation criteria
## outcomes
## participant timeline
## sample size
## recruitment


##  Assignment of interventions
## Study setting
## Monitoring


# Ethics and Dissemination

# Appendices



## Author's contributions

MZ originally conceived the validation study. AP designed the qualitative interviews, sampling design and the recruitment of participants. AP will conduct the interviews. LW and MZ created the research materials for the exercise. MZ, AP and LW are responsible for the write up of the study protocol and results. MZ provides statistical expertise and primary data analysis. AP and GP are grant holders.

## Funding

This study is funded by the Nordforsk as part of the life at the frontiers project (project numnber 95193). For more details, see [here](https://www.nordforsk.org/projects/life-frontier-impact-social-frontiers-social-mobility-and-integration-migrants). LW's time on the study is funded by Sheffield University.
