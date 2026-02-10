# Why spatial conservation prioritization?

This vignette introduces spatial conservation prioritization, a powerful
approach for deciding **where** conservation actions matter most.

## The Geography of Conservation Decisions

Spatial conservation decisions are ultimately decisions about **where to
act.** Even when conservation goals are global, the real impact happens
in specific places, whether it’s a forest, a coral reef, a river basin,
or a broader landscape. Because space is finite, conservation always
involves **making choices**.

> Protecting one area usually means not protecting another, at least not
> immediately or to the same extent.

This simple yet crucial reality shapes modern conservation planning:

- **Biodiversity is unevenly distributed** across the globe.
- **Threats vary spatially**, affecting some areas more than others.
- **Resources are limited**, creating competition among different land
  uses and priorities.

Therefore, conservation operates under constraints such as:

- Limited budgets,
- Conflicting land uses,
- Multiple objectives that cannot all be maximized simultaneously.

These constraints are **not failures**, they are the **starting point**
for effective, strategic conservation planning.

------------------------------------------------------------------------

## From Spatial Patterns to Decision Challenges

Over the past decades, conservation science has made enormous progress
in data availability. Species distribution models, habitat maps, remote
sensing products, and global biodiversity databases are now more
accessible than ever. However, conservation planners are often
challenged not by a lack of data, but by the **difficulty of turning
complex, sometimes incomplete data into clear decisions**.

A common first approach is to layer maps on top of one another:
visualizing species richness, threat levels, or habitat extent. While
informative, this rarely leads to clear choices.

When multiple features are considered simultaneously, **conflicts
emerge**:

- Areas important for one species may be less important for another.
- Regions with high biodiversity value may overlap with areas of intense
  human use.

This often leads to a familiar frustration:

> *“I have all the information I need — so why is deciding still so
> hard?”*

The problem lies not in the data alone, but in the **lack of a
structured way to resolve trade-offs across space**.

## Moving Beyond Yes or No: The Need to Prioritize

Many conservation decisions are often seen as simple **binary choices**:
protect or not protect, include or exclude. But in reality, conservation
planning rarely works this way. Decisions are usually **incremental** —
actions happen over time, budgets change, and priorities evolve as new
information becomes available. In this dynamic context, **flexibility is
key**.

Instead of asking *“Should this area be protected?”* planners often need
to ask:

- **Which areas matter more?**
- **Which actions should happen first?**
- **If only part of a landscape can be addressed now, where should we
  start?**

This shift from **selection** to **prioritization** fundamentally
changes the problem.The goal is no longer to find a single “best”
solution, but to support **informed decisions** that work under
uncertainty and constraints.

> Understanding this shift helps planners make smarter choices that
> adapt to real-world challenges.

------------------------------------------------------------------------

## Ordering space by importance

Spatial conservation prioritization addresses this challenge by ordering
locations according to their relative importance for biodiversity
conservation. Instead of dividing space into protected and unprotected
areas, it produces a ranking that reflects how much each location
contributes to overall conservation goals. This ordering is inherently
comparative. The importance of a given place depends on how it
complements other places, how many features it supports, and how
irreplaceable it is within the broader landscape. A ranked solution
allows decision-makers to explore different levels of conservation
action, adjust boundaries, and evaluate trade-offs transparently.

## Zonation as a practical implementation

Explain that: • Zonation produces a spatial ranking of conservation
importance • It integrates multiple biodiversity features • It supports
transparent and reproducible decision-making

## How this package fits in

Clarify that ZonationR: • does not replace Zonation • helps structure
and run analyses from R • is designed for learning, teaching, and
reproducible workflows
