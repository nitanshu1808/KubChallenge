# Kubicle Coding Challenge

As part of our continuing commitment to the latest cutting-edge data literacy learning solutions and content, Kubicle is working on our first ever robot! Before it will help us with anything to do with our product and technology, we’re going to first program the Robot to clean our new open-plan office in Dublin!

We call it (dramatic pause): OptimusGrime. Your task is to tell OptimusGrime which square-meter of the office that needs to be cleaned by specifying the required coordinates.

In more specific terms, given a grid (where each point on the grid is one square-meter) and a list of points representing square-meters in the office that need to be cleaned, return a list of instructions for getting OptimusGrime to those locations on the grid. An instruction is one of:

> **N**: Move north

> **S**: Move south

> **E**: Move east

> **W**: Move west

> **C**: Clean the square-meter

OptimusGrime always starts at the origin point, (0, 0). As with a mathematical graph, this point lies at the most south-westerly point of the grid. Therefore, given the following input:

```bash
$ ./optimus_grime 5x5 (1, 3) (4, 4）
```

one correct solution would be:

> ENNNCEEENC

In other words: move east once and north thrice; clean the square-meter; move east thrice and north once; clean the square-meter.

There are multiple correct ways to navigate between locations. We do not take optimality of route into account when grading: all correct solutions are good solutions.

# Submission

You have within the next 7 days upon receiving this challenge to submit your exercise. If for some reason this is not possible please let us know.

If you have any issues or need help feel free to ask us questions ttroy@kubicle.com or bdwyer@kubicle.com.

Please submit via email with a link to your code on Github/Gitlab/other to developers@kubicle.com

> 😎 Finally, don't panic! Just get as much done as you're comfortable with - that will be fine