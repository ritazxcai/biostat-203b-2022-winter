*Zixuan Cai*

### Overall Grade: 99/120

### Quality of report: 10/10

-   Is the homework submitted (git tag time) before deadline? Take 10 pts per day for late submission.  

-   Is the final report in a human readable format html? 

-   Is the report prepared as a dynamic document (R markdown) for better reproducibility?

-   Is the report clear (whole sentences, typos, grammar)? Do readers have a clear idea what's going on and how results are produced by just reading the report? Take some points off if the solutions are too succint to grasp, or there are too many typos/grammar. 

    Your solution for number 5 can be clearer. Separated into paragraphs please.

### Completeness, correctness and efficiency of solution: 55/70

- Q1 (10/10)

- Q2 (20/20)

- Q3 (5/20)

    3.4 - Did not use `zcat`. So you are counting the number of compressed rows right now. `-5`.
    
    3.5 - Same problem here. You do not use `zcat` when you execute your commands. `-5`.
    
    3.6 - Same here. Use `zcat` before performing your command, rendering the conclusion useless. But I think your code should work if you include `zcat`. `-5`.

- Q4 (10/10)

- Q5 (10/10)
	    
### Usage of Git: 7/10

-   Are branches (`main` and `develop`) correctly set up? Is the hw submission put into the `main` branch?

    Yes, but the Rproject file is not linked. I have now included. . Please create a new project in your R session connecting to this github repo and then upload that RProj file to GitHub. Let me know if you need help . `-3`

-   Are there enough commits (>=5) in develop branch? Are commit messages clear? The commits should span out not clustered the day before deadline. 

    Yes
          
-   Is the hw1 submission tagged? 

    Yes

-   Are the folders (`hw1`, `hw2`, ...) created correctly? 
  
    Yes

-   Do not put a lot auxiliary files into version control. 

-   If those gz data files or `pg42671` are in Git, take 5 points off.

### Reproducibility: 7/10

-   Are the materials (files and instructions) submitted to the `main` branch sufficient for reproducing all the results? Just click the `knit` button will produce the final `html` on teaching server? 

    We want to run hw1 fully knitted reproducing all output. Line 197 I get an error because middle.sh is not included. `-3`.

-   If necessary, are there clear instructions, either in report or in a separate file, how to reproduce the results?

### R code style: 20/20

For bash commands, only enforce the 80-character rule. Take 2 pts off for each violation. 

-   [Rule 3.](https://google.github.io/styleguide/Rguide.xml#linelength) The maximum line length is 80 characters. 

-   [Rule 4.](https://google.github.io/styleguide/Rguide.xml#indentation) When indenting your code, use two spaces.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place spaces around all binary operators (=, +, -, &lt;-, etc.). 
	
-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place a space before a comma, but always place one after a comma. 

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place a space before left parenthesis, except in a function call.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place spaces around code in parentheses or square brackets.
