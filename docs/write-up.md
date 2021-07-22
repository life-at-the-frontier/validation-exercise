# Validating the social frontiers algorithm using participant's perceptions
Authors: Meng Le Zhang and Lydia Warden


# Introduction

There exists a small literature in the detecting community boundaries using computer algorithms and areal level demographic data. One such study by Dean et al uses a statistical model to detect sharp community boundaries which they refered to as social frontiers. To date, none of these studies have validated the accuracy of their algorithms externally using human participants or other means. In this paper, we develop an experimental design that tests whether local residents in an area recognise the sharp boundaries produced by the Dean et al algortihm.

The experiment is deployed as part of a semi-structured qualitative interview with local residents. For the qualitative interview, the interview team was given a map of social frontiers in a city produced earlier in the research project. The team chose an area within each city that had an above average number of social frontiers and began sampling participants local to that area (or were connected to it). The primary goal of the sampling method was to maximise the quality of the qualitative data and not to accomodate the validation exercise. This place some limitations on the experimental design.



# Experimental design

Fundamentally, we wish to test if social frontiers produced by the Dean et al routine are more plausible than those produced by an alternative algorithm such as sampling borders at random. Since the area selected for the qualitative interviews was chosen on the basis of having social frontiers, a simple random selection of borders will contain many sharp borders by chance. Furthermore, the interview team has already seen a map of social frontiers and this will affect the possibility of having a double blind.

To address these issues, we propose a design where particpants are asked choose between maps with set of borders that have different degrees of sharpness. For each map, we subtly alter the borders to i) make difficult for the interview team to detect the 'correct' map and ii) allow us to make additional inferences.

For borders in the target area, we calculate a measure of sharpness based on the absolute difference in the proportion of foreign born in LSOAs on side of the border (the actual measure is more complicated, see Dean et al 20xx). We then standardise this measure and denote it as $\Phi$ where large values denote sharper boundaries. $\Phi$ is the basis of Dean et al's algorithm: any border with a value of $\Phi > 1.96$ was considered substantial and likely to be a social frontier.

Then we group borders into quartiles; where quartile 1 $Q1$ are the sharpest and $Q4$ the least sharp. We then produce maps which include borders from 2 quartile groups. For example, map $Q(1, 3)$ shows borders in quartile 1 and 3.

We test the following pairs of maps against each other:
- $Q(1, 2)$ versus $Q(3, 4)$ (pair 1)
- $Q(1, 2)$ versus $Q(2, 3)$ (pair 2)
- $Q(2, 4)$ versus $Q(3, 4)$ (pair 3)
- $Q(1, 3)$ versus $Q(2, 3)$ (pair 4)


For each pair, we measure the proportion of participants who prefer the map with the sharpest borders (i.e. the first mentioned map in each pair above, $Q(1, 2)$ in pair 1).
We wil refer this proportion as $P_j$ where $j$ denotes map pairing. The null hypothesis is that the chance of choosing any map is 50%:

$$P_{j=1} = P_{j=2} = P_{j=3} = P_{j=3} = 0.50$$

We also explore whether particpants recognise specific border sets as social frontiers regardless of $\Phi$.

## Rationale

Pair 1 simply tests the sharpest borders in map against the least sharpest borders. Since the difference between the maps are so stark, this comparison yield the largest value of $P_j$ and thus the highest chance of rejecting the null hypothesis. However, the interviewer are likely to recognise map $Q(1, 2). Furthermore, this trial alone cannot tell us the perceived sharpness of borders in each quartile group.

For instance, participants might prefer $Q(1, 2)$ over $Q(3, 4)$ because they perceive the set of borders in $Q2$ to be social frontiers whilst they are ambivalent about $Q1-3$. It is also likely that given so much information, participants rely on heuristics and look for one or two known community borders. These borders may occur in $Q2$ rather than $Q1$.

In either circumstance, we would like to know if participants prefer the borders in $Q1$ verus $Q2$, henceforth written as $Q1 >Q2$. To test the full range of comparisons $Q1 vs Q2$, $Q1 vs Q3$ etc would require 6 trials. However, we can limit our comparisons by first assuming:

> if particpants prefer $Q1 > Q3$ then they would prefer map $Q(1,2) > Q(2,3)$.

This is because the only difference between the maps is the inclusion of borders in $Q1$ and $Q3$. As such:

- if $Q(1, 2) > Q(2, 3)$ then $Q1 > Q3$ (pair 2)
- if $Q(2, 4) > Q(3, 4)$ then $Q2 > Q3$ (pair 3)
- if $Q(1, 3) > Q(2, 3)$ then $Q1 > Q2$ (pair 4)

To save time, we are uninterested in the relationship between $Q4$ and borders in the other quartiles.
