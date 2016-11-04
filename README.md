# stat159-fall2016-project2

Authors: **Kevin Liao**, **Thomas Y Sun**, **Peng Cheng**
<div>
University of California, Berkeley </br>
Berkeley CA, 94072 USA </br>
Kevin Liao: lwk723@berkeley.edu </br>
</div>

### Objective 
This repository is mainly about Course Stats 159 at UC Berkeley, fall 2016 - second project. This project follows the ideas presented chapter 6: _Linear Model Selection and Regularization_ (from "An Introduction to Statistical Learning" by James et al) and performs a predictive modeling process applied on the data set `Credit`. We will carry out results and comparison between different predictive models and details the project in report paper. 

Instruction: [github project repository](https://github.com/ucb-stat159/stat159-fall-2016/tree/master/projects)

Course website: [gastonsanchez.com/stat159](http://gastonsanchez.com/stat159)

### File Structure

The main directories of this repository are:
* `data`, which stores the original data set `Credit.csv`, the mean centralized and scaled data set `scaled-credit.csv` and some other RData output from our analysis
* `Code`, which holds the codes for all analysis/computations and containes three main directories: 
   * functions, which contains generic functions used in scripts
   * scripts, which is the main folder for all data process and model analysis
   * tests, which holds unit tests for output comparison
* `images`, which stores the graphic output including histogram, boxplot, correlation matrix and barcharts etc.
* `report`, which is sectioned into 7 parts and produces the official project report and analysis
* `slides`, which adds on additional feature to the project and complements the materials in the report for a formal presentation

The complete file-structure for the project is as follows:

```
stat159-fall2016-project2/
   README.md
   Makefile
   LICENSE
   session-info.txt
   .gitignore
   code/
      README.md
      test-that.R
      functions/
         mse-function.R
      scripts/
         eda-qualitative-script.R
         eda-quantitative-script.R
         pre-process-script.R
         ols-regression-script.R
         ridge-regression-script.R
         lasso-regression-script.R
         PCR-script.R
         PLSR-script.R
         session-info.R
      tests/
         test-mse.R
   data/
      README.md
      Credit.csv
      eda-qualitative-output.txt
      eda-quantitative-output.txt
      correlation-matrix.RData
      scaled-credit.csv
      train-and-test-set.RData
      ols-regression-output.txt
      ols-regression.RData
      ridge-regression-output.txt
      ridge-regression.RData
      lasso-regression-output.txt
      lasso-regression.RData
      PCR-output.txt
      PCR.RData
      PLSR-output.txt
      PLSR.RData
   images/
      README.md
      barchart-Ethnicity.png
      barchart-gender.png
      barchart-married.png
      barchart-student.png
      boxplot-age.png
      boxplot-balance-ethnicity.png
      boxplot-balance-gender.png
      boxplot-balance-married.png
      boxplot-balance-student.png
      boxplot-balance.png
      boxplot-cards.png
      boxplot-education.png
      boxplot-income.png
      boxplot-limit.png
      boxplot-rating.png
      histogram-age.png
      histogram-balance.png
      histogram-cards.png
      histogram-education.png
      histogram-income.png
      histogram-limit.png
      histogram-rating.png
      ridge-cv-lambda.png
      lasso-cv-lambda.png
      pcr-cv-ncomp.png
      plsr-cv-ncomp.png
      scatterplot-matrix.png
   report/
      README.md
      report.pdf
      report.Rmd
      sections/
         00-abstract.Rmd
         01-introduction.Rmd
         02-data.Rmd
         03-methods.Rmd
         04-analysis.Rmd
         05-results.Rmd
         06-conclusions.Rmd
   slides/
      predictive-modeling-slides.Rmd
      predictive-modeling-slides.html
```

### Structure of the paper

> * 0. Abstract - provide basic information of the project
> * 1. Introduction - provide the objective of the project
> * 2. Data - explain the source and use of our raw data
> * 3. Methods - OSL, ridge, lasso, PCR, PLSR
> * 4. Analysis - train and test models for each method
> * 5. Results - display findings of the project
> * 6. Conclusions - draw conclusion from the research results
> * References

### How to reproduce the project
The objective of the project is to practice how to use different methods to do model selection based on given data set. 

If you want to reproduce the results represented in this project (images, dataset, report etc), one simply clone the repository (download zip file) and run the make file with command
> make

If you would like to reproduce a specific part of the project (e.g. regressions), run the corresponding command line in the terminal
> make regressions

If you would like to reproduce the report, run the corresponding command line in the terminal
> make report

If you would like to remove the report, run the following command line
> make clean

the following is a complete list of make commands for phony targets:
* make all 
* make data 
* make tests 
* make eda 
* make pre 
* make ols 
* make ridge 
* make lasso 
* make pcr 
* make plsr 
* make regressions 
* make report 
* make slides 
* make session 
* make clean

### REFERENCES
James, Gareth, Daniela Witten, Trevor Hastie, and Robert Tibshirani. An Introduction to Statistical Learning: With Applications in R. New York: Springer, 2013. Print.

### License additonal info 
All media content (e.g. report/report, and images) licensed under Creative Commons Attribution-ShareAlike 4.0 International License.

All code licensed under Apache License 2.0


### LICENSE

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

Author: **Kevin Liao**, **Thomas Y Sun**, **Peng Cheng**

