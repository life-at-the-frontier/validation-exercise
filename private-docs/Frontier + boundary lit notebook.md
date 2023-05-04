
Lit review method: 
 - take key papers 
	 - legewie 
	 - dean et al 
- follow key references 
- use research rabbit
- check citations 

----

## Summaries and questions 

My key question is can we continue to research conflict along boundaries if we have no evidence that we can actually label and detect community boundaries in the first place? This would be akin to adopting machine learning algorithm without way to obtain 'ground truth'.

**Why do boundaries matter?**

In Legewie's framework people are i) threatened by out groups and ii) seek to defend neighbourhoods of their community. Social boundaries are socially constructed symbolic boundaries -- which may coincide with other boundaries. 

Socially constructed implicityly assumes that these relations exist in actors. Seeking to defend neighbourhoods 


Key questions: 
- what are the definitions of border / social frontiers / research question
- what's the theory of change (i.e. why do boundaries matter)
- what empirical method was used 
	- was there any validation
- what are the uses


key papers + tables: 



----

# Legewie, Joscha, and Merlin Schaeffer. 2016. 

> Legewie, Joscha, and Merlin Schaeffer. 2016. ‘Contested Boundaries: Explaining Where Ethnoracial Diversity Provokes Neighborhood Conflict’. _American Journal of Sociology_ 37.


Hypothesis:

> This article proposes the __contested boundaries hypothesis__ as a refined contextual explanation focused on poorly defined boundaries between ethnic and racial groups. The authors argue that neighborhood conflict is more likely to occur at fuzzy boundaries defined as interstitial or transitional areas sandwiched between two homogeneous communities.

> We argue that neighborhood conflict arises at poorly defined boundaries that separate ethnic and racial groups. Such fuzzy boundaries are interstitial or transitional areas sandwiched between two homogeneous communities. They are contested because they threaten homogeneous community life and foster ambiguities about group rank. Above and beyond disorganization and diverging ways of life generally found in mixed neighborhoods, their location between differently populated homogeneous communities triggers hostility. Well-defined boundaries, by contrast, are accepted divisions between one group’sturfandanother’s and are thus less contested. By focusing on the broader sociospatial structure, the contested boundaries hypothesis overcomes the “aspatial” treatment of neighborhoods as isolated areas in research on ethnic diversity. It highlights how residential segregation creates contentious areas at the places where groups border.


Definition of boundaries and frontiers:

key concept = __edge intensity__ 

> Edge intensity is a sociospatial feature that captures changes in the composition of neighborhoods across space. It ranges from no change in racial composition (no boundary, e.g., within a homogeneous or diverse area), to gradual changes in interstitial or transitional areas (fuzzy boundaries of different strengths), and finally to abrupt transitions from one group’s turf to another’s(well-defined or clear-cut boundaries).


Examples of boundaries:

- Research on gang violence highlights that shared turf boundaries (Papachristos, Hureau, and Braga 2013) or boundary crossings (Radil, Flint, and Tita 2010) are an important predictor of violence. 
- -Desmond and Valdez (2013) claim that neighborhoods at the edges of segregated black communities have particularly high frequencies of nuisance property citations because nonblack residents feel threatened by their black neighbors. 

**theory of change**

Essentialy trying to explain why conflicts may occur at fuzzy boundaries 

> As reviewed above, a common argument in the literature is that ethnoracial compositions have the potential to stir social tensions because out-group members are perceived as threatening.

^ my note: this is merely the presence of outgroups in areas 

From here it seems that it's given that resident can 'feel' which areas are part of their community:

> Gould (2003) and others claim that polarized situations in which two equally sized opponents face each other are even more contentious than circumstances in which a majority defends its space against the in-migration of minorities. Here the ambiguity about social rank—that is, who is the dominating group—breeds conflict.

Second reason is *defended neighbourhoods*:

> The defended neighborhoods literature further suggests that residents of ethnically homogeneous areas develop exclusive community identities. Campbell et al. (2009) note how ethnoracial compositions inform people’s subjective construction of neighborhood boundaries correspondingly. Minorities’ in-migration to homogeneous areas contests these subjective boundaries and is consequently met by strong resistance to defend the integrity of the dominant group’s neighborhood community.

note: The defended neighbourhood hypothesis depends on the existence of recognisible neighbourhoods and boundaries 

my note: the concept of turf etc is used throughout

**Method**

Basically proposal to do edge detection:
> The term edge detection refers to a number of mathematical methods with the goal to detect “points in a digital image at which the image brightness changes sharply or, more formally, has discontinuities” (Nosrati et al. 2013, p. 116; see also Ziou and Tabbone 1998; Shapiro and Stockman 2001). These algorithms are a fundamental and well-established tool in image processing and computer vision with applications ranging from image sharpening, over robotics, to driverless cars (Shapiro and Stockman 2001). Edge detection algorithms are part of a larger literature on spatial boundary detection. This literature includes various methods used in ecology, epidemiology, and other areas, such as “wombling” (Jacquez, Maruca, and Fortin 2000; Dale and Fortin 2014), or methods based on ecocentric signatures and cluster analysis (Logan et al. 2011; Spielman and Logan 2013). Most of the existing boundary analysis methods are designed for either point-specific data with known coordinates or regular lattices such as images (Nosrati et al. 2013; Dale and Fortin 2014).4 Directly applying these methods to the ethnoracial composition of neighborhoods would require a high-resolution spatial grid with point-specific information about ethnoracial composition. The smallest available census aggregation, however, is the census block level.


Based on image detection --- see Legeiw 2018 demography article
- adapted to deal with non standard areas (e.g. census blocks aren't same size)

Note: Uses internet 311 forum posts to build argument for ethnic tensions -- but no explicit mention of frontiers / disputed bounardies

**Appendix A = review of edge detection algorithm**


---- 

# Legewie, Joscha. 2018.

> Legewie, Joscha. 2018. ‘Living on the Edge: Neighborhood Boundaries and the Spatial Dynamics of Violent Crime’. _Demography_ 55(5):1957–77. doi: [10.1007/s13524-018-0708-1](https://doi.org/10.1007/s13524-018-0708-1).

Abstract: 
Neighborhood boundaries are a defining aspect of highly segregated urban areas. Yet, few studies examine the particular challenges and spatial processes that occur at the bordering region between two neighborhoods. Extending the growing literature on spatial interdependence, this article argues that neighborhood boundaries—defined as sharp changes in the racial or socioeconomic composition of neighborhoods—are a salient feature of the spatial structure with implications for violent crime and other outcomes. Boundaries lack the social control and cohesion of adjacent homogeneous areas, are contested between groups provoking intergroup conflict, and create opportunities for criminal behavior. This article presents evidence linking racial neighborhood boundaries to increased violent crime. The findings illustrate the importance of neighborhood boundaries for our understanding of spatial dimensions of population dynamics above and beyond the characteristics of neighborhoods.


**What is a boundary?**

Examplies directly from start of paper:

> In 1945, St. Clair Drake and Horace R. Cayton argued in “Black Metropolis” (1945/1993:190) that “one consequence of the pattern of residential segregation is that an area of potential conflict has been created all around the boundaries of the Black Belt.” More recently, Elijah Anderson (1990:154–156) reported about “the edge” in Eastern City (a pseudonym for his case study city) as “the place where two communities meet, where the lower-income black residents come in contact with the middle- and upper-income white ones.” Pattillo (2007) described what residents call the “dividing” or “invisible” line in Chicago’s South Side as an area that separates prospering South from languishing North Kenwood.

Whilst not directly commenting on whether people can sense boundaries, I think it remains an implicity assumption:

> Like “the edge” in Eastern City and the “dividing line” in Chicago’s South Side, social boundaries capture the transition from a low-class to a high-class neighborhood or from a predominantly white to a Hispanic area. They are related to symbolic neighborhood boundaries defined as conceptual categorizations of space into distinct areas and to political boundaries defined as administrative borders that divide geographical areas into school districts, police precincts, congressional districts, or others. In contrast to physical boundaries, such as railways, major roads, or rivers, social neighborhood boundaries facilitate contact and potentially conflict between distinct groups.


Legewie wants to look at symbolic  boundaries:

> Symbolic (neighborhood) boundaries, in contrast, refer to the subjective separation of space into distinct areas. Following the broader boundary concept, symbolic boundaries are conceived as “conceptual distinctions made by social actors to categorize objects, people, practices, and even time and space” that “separate people into groups and generate feelings of similarity and group membership” (Lamont and Molnar 2002:168).

- on p. 1959 these areas are described as socially constructed 

my note is obviously whether we can detect symbolic / socially constructued boundaries using currently available datasets and methods. 

**Methods**


Good literature on other uses
> Researchers from various disciplines have developed methods to detect neighborhood boundaries (Dale and Fortin 2014; Jacquez et al. 2000;Logan et al. 2011; Spielman and Logan 2013). These methods are often called “wombling” based on foundational work by Womble (1951). In ecology, they are used to identify boundaries (also called “ecotones”) in species or habitat distributions, to study environmental factors associated with these boundaries, and to examine the effect of boundaries (Fagan et al. 2003). In computer vision, image processing, and machine learning, edge-detection algorithms are essential tools with applications ranging from image sharpening to robotics and driverless cars (Shapiro and Stockman 2001). A separate literature has focused on identifying neighborhoods and their boundaries based on complete-count microdata from historical censuses (Logan et al. 2011;Spielmanand Logan 2013).

This article uses areal wombling 

> This article uses areal wombling as a boundary detection approach designed for areal data (Liang et al. 2009;LuandCarlin2005;Luetal.2007). It is based on the idea that two adjacent areas are separated by a boundary if the difference between the two areas in some response variable exceeds a threshold.

^ the above areal wombling technique uses
- pairs of adjcent areas (based on distance or whatever) 
- calculating the difference in attributes between pairs (called *boundary value* or in our paper sharpness )
- the attribute is the proportion of several ethinic minority
	- i.e. combines boundary values using white, afriance etc 
	- takes the max of difference across groups (i.e. if max is African then they use the Boundary value for african)
	- suppupplemntary uses other pairwse values 
^ my note: therefore actually our validiation exercise is valid 


--- 

# Neil and Legewie (2022)

This is an OSF [preprint](https://osf.io/preprints/socarxiv/4ahnm/)

Neil, Roland, and Joscha Legewie. 2023. _Policing Neighborhood Boundaries and the Racialized Social Control of Spaces_. _preprint_. SocArXiv. doi: [10.31235/osf.io/4ahnm](https://doi.org/10.31235/osf.io/4ahnm).

> Despite longstanding interest in the policing of neighborhood racial boundaries, this topic has not  
received sustained theoretical or empirical attention. Synthesizing and extending theories as to  
why racial boundaries influence police behavior, this paper advances a model of the racialized  
social control of spaces that predicts a higher level of police stops and lower standards of suspicion  
at neighborhood racial boundaries, independent of crime rates. Integrating data from New York  
City’s Stop, Question, and Frisk program from 2008-2012 with extensive neighborhood measures,  
our analyses reveal that white neighborhoods along boundaries experienced substantially elevated  
levels of police stops even after conditioning on a wide array of potential confounders. This rela-  
tionship is partially mediated by elevated crime along racial boundaries. Still, a sizeable direct  
effect persists, indicative of the racialized social control of spaces. Further, the police tend to re-  
quire less suspicion before deciding to conduct stops in white neighborhoods along racial bound-  
aries, but only for Black and Hispanic suspects. Implications for the study of race and policing,  
urban and racial inequality, and the sociology of law are discussed.

**what are boundaries**

Focuses on poluc patrolling of boundaries...

Apparently policing borders is a thingy in sociology:
> The idea that controlling spatial boundaries is important to policing—and that race plays a role in  this—has a long history in sociological thought (Desmond and Valdez 2013; Herbert 1997; Irwin  1985; Werthman and Piliavin 1967; Faber and Kalbfeld 2019).


Note: These are other studies that they have found on borders --

> In contrast, an emerging body of scholarship provides theory and evidence as to the power of  
neighborhood racial boundaries to influence spatial patterns of conflict and stratification __(Dean et  
al. 2019; Kim and Hipp 2021; Legewie 2018; Legewie and Schaeffer 2016).__

Why police may check borders:

> For instance,  in a classic essay Werthman and Piliavin (1967, 78) remark: “the police are... stringent about  preventing boys from crossing boundaries of a higher status or a different color.”

Again main two theories are i) in-group and outgroup and ii) defended neighbourhoods 

Other evidence:

> Earlier research focused on racial uprisings during the  
early twentieth century also highlights the importance of conflict around neighborhood boundaries.  
Bergesen and Herman (1998:41), for example, examined the 1992 Los Angeles uprising and found  
increased violence in the “contact zone” or “contested area” located between Hispanic and African  
American communities (see also Grimshaw 1960).

__method for detecing boundaries__ 

The areal characteristic is proportion of residents who are black and/or hispanic --
they define racial boundaries using areal wombling 
> (Legewie 2018; Logan et al. 2011; Spielman and Logan 2013)

See Legewie 2018 for descriptive 


----

# Kim and Hipp 2021 


Kim, Young-An, and John R. Hipp. 2022. ‘Both Sides of the Street: Introducing Measures of Physical and Social Boundaries Based on Differences Across Sides of the Street, and Consequences for Crime’. _Journal of Quantitative Criminology_ 38(1):75–103. doi: [10.1007/s10940-020-09484-4](https://doi.org/10.1007/s10940-020-09484-4).

Summary: look at relationship between physical and social boundaries (so called edges) and level of crime. 


**What are edges**

> Edges are the spatial boundaries where noticeable changes are observed (Brantingham and Brantingham [1993](https://link.springer.com/article/10.1007/s10940-020-09484-4#ref-CR5 "Brantingham PL, Brantingham PJ (1993) Nodes, paths and edges: considerations on the complexity of crime and the physical environment. J Environ Psychol 13:3–28")). __Edges can be physically pronounced or can be non-physically visible but socially recognized.__ 

p. 76 

Note: They quote Legeeir (2018) for the idea of a social boundary 

They also don't quite know of other studies: 

> Although previous studies on edges have provided considerable insights  
for physical boundaries and crime in place, a limitation is that they often neglect the impor‑  
tance of social boundaries. __To our knowledge, Legewie (2018) is the only study that explicitly  
theorized and empirically tested how social (racial) boundaries are associated with crime while  
accounting for the effects of other physical boundaries.__

Their paper is about the novel use of looking at characteristics either side of a street segment 

Note: on page 79 onwards they disuss social boundaries 
> We define social boundaries as socioeco‑  
nomic and racial differences that exist across the two sides of the street segment. Given the  
definition of a street segment (both sides of a street between two intersections), there are  
possible perceptual differences for residents when there are differences in the socioeco‑  
nomic or racial composition between one side and the other of a street segment (Tajfel and  
Turner 1986)


**Methods**

Sample = 117 cities in Los Angeles County 
- unit is street segement -- both faces of a street between two intersections 
- each segement has a side (or block): A and B 
- for each side they measure 
	- land use 
	- home value (proxy for socio-economic diff)
	- racial composition of residents (using census)

![[Pasted image 20230504130746.png]]

note: They have different methods for each indicator; in particular they only have resident info at census block. 

Their difference measure (or Boundary value) is given in __equation 1 on p. 82__

![[Pasted image 20230504131341.png]]

Essentially for segement $a$ the distance metric is the difference in characteristics $X_k$ between two sides of the street segment ($i, j$) squared. There might be several indicators $k$ . They take the squared difference and sum it up then square root it. 

When there is only 1 indicator -- this is just the absolute continugous difference. 

Note: Their metric of racial composition on one side is not simply the proportion of one racial categoru. See p.83 

Example of what their street segment boundaries look like: 

![[Pasted image 20230504131846.png]]

----

# Křížková et al (2021)

> Křížková, Ivana, Meng Le Zhang, Dan Olner, and Gwilym Pryce. 2021. ‘Social Frontiers: Estimating the Spatial Boundaries Between Residential Groups and Their Impacts on Crime’. Pp. 285–304 in _Urban Inequality and Segregation in Europe and China_, _The Urban Book Series_, edited by G. Pryce, Y. P. Wang, Y. Chen, J. Shan, and H. Wei. Cham: Springer International Publishing.



----


# Lu and Carlin 2005 


> Lu, Haolan, and Bradley P. Carlin. 2005. ‘Bayesian Areal Wombling for Geographical Boundary Analysis’. _Geographical Analysis_ 37(3):265–85. doi: [10.1111/j.1538-4632.2005.00624.x](https://doi.org/10.1111/j.1538-4632.2005.00624.x).

Abstract:
> In the analysis of spatially referenced data, interest often focuses not on prediction of the spatially indexed variable itself, but on _boundary analysis_, that is, the determination of boundaries on the map that separate areas of higher and lower values. Existing boundary analysis methods are sometimes generically referred to as _wombling_, after a foundational article by Womble (1951). When data are available at point level (e.g., exact latitude and longitude of disease cases), such boundaries are most naturally obtained by locating the points of steepest ascent or descent on the fitted spatial surface (Banerjee, Gelfand, and Sirmans 2003). In this article, we propose related methods for _areal_ data (i.e., data which consist only of sums or averages over geopolitical regions). Such methods are valuable in determining boundaries for data sets that, perhaps due to confidentiality concerns, are available only in ecological (aggregated) format, or are only collected this way (e.g., delivery of health-care or cost information). After a brief review of existing algorithmic techniques (including that implemented in the commercial software BoundarySeer), we propose a fully model-based framework for areal wombling, using Bayesian hierarchical models with posterior summaries computed using Markov chain Monte Carlo methods. We explore the suitability of various existing hierarchical and spatial software packages (notably S-plus and WinBUGS) to the task, and show the approach's superiority over existing nonstochastic alternatives, both in terms of utility and average mean square error behavior. We also illustrate our methods (as well as the solution of advanced modeling issues such as simultaneous inference) using colorectal cancer late detection data collected at the county level in the state of Minnesota.

Basically a method for determining boundaries if you have areal level data. 
note: wombling = typiclly using points data 

Not about social borders ... more cancer detection detection in Minnesota 

----

# Logan et al 2011 

> Logan, John R., Seth Spielman, Hongwei Xu, and Philip N. Klein. 2011. ‘Identifying and Bounding Ethnic Neighborhoods’. _Urban Geography_ 32(3):334–59. doi: [10.2747/0272-3638.32.3.334](https://doi.org/10.2747/0272-3638.32.3.334).


Abstract:
> This study presents three novel approaches to the question of how best to identify ethnic neighborhoods (or more generally, neighborhoods defined any aspect of their population composition) and to define their boundaries. It takes advantage of unusual data on the residential locations of all residents of Newark, NJ, in 1880 to avoid having to accept arbitrary administrative units (like census tracts) as the building blocks of neighborhoods. For theoretical reasons the street segment is chosen as the basic unit of analysis. All three methods use information on the ethnic composition of buildings or street segments and the ethnicity of their neighbors. One approach is a variation of k-functions calculated for each adult resident, which are then subjected to a cluster analysis to detect discrete patterns. The second is an application of an energy minimization algorithm commonly used to enhance digital images. The third is a Bayesian approach previously used to study county-level disability data. Results of all three methods depend on decisions about technical procedures and criteria that are made by the investigator. Resulting maps are roughly similar, but there is no one best solution. We conclude that researchers should continue to seek alternative methods, and that the preferred method depends on how one’s conceptualization of neighborhoods matches the empirical approach.


So in short they try out three methods using 1880 data on ethncity

My note: the beginning of this paper is actually quite good for working up the rationale for

Note: **pages 2 -3** are good for ethnographic evidence on borders. Also the vagueness of ethnographic borders prompts these algorithm:

> Ambiguous boundaries probably work fine for residents, but they  
complicate neighborhood research. How can we measure neighborhood characteristics and  
their changes over time if we only know vaguely where the neighborhoods are?
(**p. 3**)

> If neighborhoods exist in the minds of residents, then **the direct approach is to find out how  
residents understand their neighborhoods.** In fact, as Logan, Alba and Zhang (2002, pp.  
303–304) point out, “[E]thnic neighborhoods are most often identified and studied through  
fieldwork, where the researcher typically begins with the knowledge that the ethnic  
character of a given locale is socially recognized – certainly by group members and perhaps  
also by others. This ethnic character may be visible through observation of people in public  
places, the names of shops or the languages found on signs or spoken by clerks or patrons,  
or by community institutions such as churches, social clubs, and associations.” Yet many  
researchers are unable to do original fieldwork, and many study designs require information  
on more locations than could feasibly be covered by fieldwork.
(**p.3** )



Note: in their paper they don't seem to go back to assess what may be the 'right answer'
> It is not our intention to argue for the  superiority of any one of these approaches. (p. 16)

> Since there is no conventional template for assessing these models, the right result could be  
seen as indeterminate. There are potential empirical guides to making the “right” choice.


However they actually briefly mentions external validlation before just raising theoretical properties (cop out depends on the theoretist -- which isn't too helpful because this a slippery slope about fitting empirical evidence with theory):

> Another more  
substantively appealing criterion would employ external validation. Suppose, for example,  
that archival research could determine the locations of churches whose denomination or  
name identifies an ethnic affiliation, or the addresses of members of ethnic voluntary  
associations. One criterion could be that the best mapping of neighborhoods is the one that  
locates these institutions most centrally in zones represented by their ethnic constituents.  
Historical documents that give ethnic labels to areas of the city would also be of use for  
validation. (p. 14)

----

# Spielman, Seth E., and John R. Logan. 2013

> Spielman, Seth E., and John R. Logan. 2013. ‘Using High-Resolution Population Data to Identify Neighborhoods and Establish Their Boundaries’. _Annals of the Association of American Geographers_ 103(1):67–84. doi: [10.1080/00045608.2012.685049](https://doi.org/10.1080/00045608.2012.685049).




Another article at operationalising neighbourhoods. Big issue is that social scientists are forced to treat administrative data unit as neighbourhoods (Dietz 2002)

> Since entering the social science lexicon in theearly twentieth century, neighborhood has been a con-tentious unit of analysis. McKenzie (1923, quoted byMatthews 2011, 41) noted that, “probably no otherterm is used so loosely or with such changing contentas the term neighborhood, and very few are more dif-ficult to define.” (p.67)

Uses the 1880 data (used in Logan et al 2011)