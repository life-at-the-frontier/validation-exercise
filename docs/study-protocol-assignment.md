## Methods: Assignment of intervention

**Intervention**
Fundamentally, we wish to test if social frontiers produced by the Dean et al. routine are more plausible than those produced by an alternative algorithm such as sampling borders at random. Since the interview team chose the area selected for the qualitative interviews based on having social frontiers, a simple random selection of borders will contain many sharp borders by chance. Furthermore, the interview team has already seen a map of social frontiers, which will affect the possibility of having a double-blind.

To address these issues, we propose a design where participants choose between maps with a set of borders with different degrees of sharpness. We subtly alter the borders for each map to i) make it difficult for the interview team to detect the 'correct' map and ii) allow us to make additional inferences.

For borders in the target area, we calculate a measure of sharpness based on the absolute difference in the proportion of foreign-born in LSOAs on each side of the border (the true measure is more complicated, see Dean et al. 2019). We then standardise this measure and denote it as $\Phi$ where large values indicate sharper boundaries. $\Phi$ is the basis of Dean et al.'s algorithm: any border with a value of $\Phi > 1.96$ was considered substantial and likely to be a social frontier.

Then we group borders into tertiles; where tertile 1 $Q1$ is contains the sharpest set of borders. We then compare maps from each tertile against each other in pairs. For example, map pair $Q(1, 2)$ shows tertile 1 and 2.

- $Q(1, 2)$ (pair 1)
- $Q(1, 3)$ (pair 2)
- $Q(2, 3)$ (pair 3)


For each pair, we measure the proportion of participants who prefer the map with the sharpest borders (i.e. tertile 1 in pair 1). We wil refer this proportion as $P_j$ where $j$ denotes map pairing. The null hypothesis is that the chance of choosing any map is 50%:

$$P_{j=1} = P_{j=2} = P_{j=3} = 0.50$$

We also explore whether participants recognise specific border sets as social frontiers regardless of $\Phi$.

We will check that all the maps are similar with respect attributes (e.g. total border lengths) to omit alternative explanations. The pair of interactive maps are synced so scrolling and moving Map A also moved the area viewed in Map B.

The maps are created in R and exported as leaflet maps within html files. The code to recreate the maps are found at: https://github.com/MengLeZhang/wardenProject2021.


**Rationale**

Pair 1 tests the sharpest borders in the map against the least sharp borders. Since the difference between the maps are so stark, this comparison yield the largest value of $P_j$ and thus the highest chance of rejecting the null hypothesis. However, the interviewer is likely to recognise the borders for tertile 1. Furthermore, this trial alone cannot tell us the perceived sharpness of borders in each quartile group.

For instance, participants might prefer tertile 2 over tertile 1. It is likely that given so much information, participants rely on heuristics and look for one or two known community borders. These borders may occur in tertile 2 rather than tertile 1.

**Allocation**
All participants will be shown all three pairs of maps after an initial preliminary task. The order of maps and the sequence of pairs is chosen at random by the statistical software R.

**Concealment mechanism and blinding**
The order and sequence is saved onto a file and not shown to the any member of the research team until the data has been collected. This includes member of the data analysis team who will only access the sequencing information after an interview to check the automated routine has not failed. In the case of the interview team, they will not see the data or the order/sequence until all the data has been collected.
The participants and the interview team will be unaware of how the maps in the exercise have been generated.

## Stat analysis

Analysis of the primary outcome will use a linear regression model with cluster robust standard errors (cluster = participant). The outcome will be whether a respondent 'agrees' with the algorithm by choosing the map with 'sharper' borders in a pair. A t-test of the regression parameters will constitute a test of our null hypothesis. Missing data, including item non-response (e.g. skipping pairs), will be omitted.

Additional test for sequencing, ordering, and better agreement over time will be conducted. We will use fisher exact tests to check if the agreement rate is different across the 3 pairs (pair sequence is randomised). We will use a linear regression model with cluster robust standard errors to check the frequency with which participants pick maps shown on the left-hand side of a pair (map order is randomised). We will . We will test the effect of item non-response by using partial identification to calculate the lower and upper bounds for the agreement rate (e.g. non-responders are always agree or disagree).


Exploratory analysis will include a multinomial logit model to measure whether the attribute 'sharpness' has a linear relationship with map preference.
